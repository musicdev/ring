/* Copyright (c) 2013-2024 Mahmoud Fayed <msfclipper@yahoo.com> */

#include "ring.h"

void ring_vm_try ( VM *pVM )
{
	List *pList  ;
	pList = ring_list_newlist_gc(pVM->pRingState,pVM->pTry);
	ring_list_addint_gc(pVM->pRingState,pList,RING_VM_IR_READI);
	ring_list_addint_gc(pVM->pRingState,pList,pVM->nInsideEval);
	ring_vm_savestate(pVM,pList);
	pVM->nActiveCatch = 0 ;
}

void ring_vm_catch ( VM *pVM,const char *cError )
{
	List *pList  ;
	pList = ring_list_getlist(pVM->pTry,ring_list_getsize(pVM->pTry));
	pVM->nPC = ring_list_getint(pList,1) ;
	pVM->nInsideEval = ring_list_getint(pList,2) ;
	/* Define variable cCatchError to contain the error message */
	ring_list_setstring_gc(pVM->pRingState,ring_list_getlist(ring_vm_getglobalscope(pVM),RING_GLOBALVARPOS_ERRORMSG),RING_VAR_VALUE,cError);
	/* Avoid invalidated cError (variable) content by restore */
	ring_vm_restorestate(pVM,pList,3,RING_STATE_TRYCATCH);
	/* Tell C-API caller (CALL command) that catch happens! */
	pVM->nActiveCatch = 1 ;
	/* Catch Statements must be executed without try effects */
	ring_vm_done(pVM);
}

void ring_vm_done ( VM *pVM )
{
	ring_list_deleteitem_gc(pVM->pRingState,pVM->pTry,ring_list_getsize(pVM->pTry));
}
