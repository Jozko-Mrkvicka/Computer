#include "__cf_Pokus09_Display_4x4.h"
#ifndef RTW_HEADER_Pokus09_Display_4x4_acc_private_h_
#define RTW_HEADER_Pokus09_Display_4x4_acc_private_h_
#include "rtwtypes.h"
#ifndef RTW_COMMON_DEFINES_
#define RTW_COMMON_DEFINES_
#define rt_VALIDATE_MEMORY(S, ptr)   if(!(ptr)) {\
  ssSetErrorStatus(S, RT_MEMORY_ALLOCATION_ERROR);\
  }
#if !defined(_WIN32)
#define rt_FREE(ptr)   if((ptr) != (NULL)) {\
  free((ptr));\
  (ptr) = (NULL);\
  }
#else
#define rt_FREE(ptr)   if((ptr) != (NULL)) {\
  free((void *)(ptr));\
  (ptr) = (NULL);\
  }
#endif
#endif
#ifndef __RTWTYPES_H__
#error This file requires rtwtypes.h to be included
#else
#ifdef TMWTYPES_PREVIOUSLY_INCLUDED
#error This file requires rtwtypes.h to be included before tmwtypes.h
#else
#ifndef RTWTYPES_ID_C08S16I32L32N32F1
#error This code was generated with a different "rtwtypes.h" than the file included
#endif
#endif
#endif
void Pokus09_Display_4x4_JKFlipFlop_Init (
DW_JKFlipFlop_Pokus09_Display_4x4_T * localDW ,
P_JKFlipFlop_Pokus09_Display_4x4_T * localP ) ; void
Pokus09_Display_4x4_JKFlipFlop ( real_T rtu_0 , boolean_T rtu_1 , boolean_T
rtu_2 , B_JKFlipFlop_Pokus09_Display_4x4_T * localB ,
DW_JKFlipFlop_Pokus09_Display_4x4_T * localDW ,
P_JKFlipFlop_Pokus09_Display_4x4_T * localP ,
ZCE_JKFlipFlop_Pokus09_Display_4x4_T * localZCE ) ; void
Pokus09_Display_4x4_Select_Column ( uint8_T rtu_Address_01b , uint8_T
rtu_Address_11b , B_Select_Column_Pokus09_Display_4x4_T * localB ) ;
#endif
