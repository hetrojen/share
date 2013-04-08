//
//  UrunUtil.h
//  KilicogluMobile
//
//  Created by mac on 11/17/12.
//  Copyright (c) 2012 com.filosoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UrunDetayOb.h"
static const int CATI_PENCERESI_CATI_CIKIS = 1 ;
static const int CATI_SISTEMLERI = 2 ;
static const int GUNES_PANELI = 3 ;
static const int DIS_CEPE_YALITIM = 4 ;
static const int KIREMITLER = 5 ;
static const int KIREMIT_IRMIGI = 6 ;
static const int KIREMIT_LEVHASI = 7 ;
static const int TUGLALAR = 8 ;
static const int YAMUR_INDIRME_SISTEMLERI = 9 ;
static const int  BACA_VE_DUVAR_COZUMLERI=10;
static const int HAVALANDIRMA_URUNLERI=11;
static const int  ISI_VE_SU_YALITIM=12;
static const int MAHYA_ALTI_COZUMLERI=13;
static const int DERE_DETAYI_COZUMLERI=14;

static  const int URUN_KIREMIT_IRMIGI=132;
static  const int URUN_KIREMIT_LEVHASI=133;
static  const int URUN_YAGMUR_INDIRME=134;

static  const int URUN_BACA_SAPKASI=101;
static  const int URUN_AKDENIZ_KIREMIT=102;
static  const int URUN_CAM_KIREMIT=103;
static  const int URUN_4_YOL_MAHYA=104;
static  const int URUN_AKDENIZ_HAVALANDIRMA=105;
static  const int URUN_CATISER=106;
static  const int URUN_UNIVERSAL_HAVALANDIRMA=107;
static  const int URUN_ANTEN_CIKIS_ELAMANI=108;
static const  int URUN_VALENSIYA_KIREMIT=109;
static  const int URUN_GUNES_PANELI=110;
static const  int URUN_OMURGA_TASIMA_PROFILI=111;
static const  int URUN_GRANADA_HAVALANDIRMA=112;
static const  int URUN_MAHYASER=113;

static const  int URUN_3_YOL_MAHYA=114;

static const  int URUN_MAHYA_MONTAJ_HARCI=115;
static const  int URUN_GRANADA_KIREMIT=116;
static const  int URUN_YAKASER=117;
static const  int  URUN_IZO_CATI=118;
static  const  int URUN_DERESER_ALUMINYUM=119;
static  const int URUN_CATI_PENCERESI=120;
static  const int URUN_KILICOGLU_MAHYA=121;
static  const  int URUN_ILK_MAHYA=122;
static  const  int URUN_YAN_SACAK_KAPAGI=123;
static  const  int URUN_DERESER_PVC=124;
static  const int URUN_CATI_TARAGI=125;
static   const int URUN_YAN_SACAK_KIREMIDI=126;
static  const int URUN_CATI_CIKIS_KAPAGI=127;
static const   int URUN_BACASER=128;
static  const  int URUN_BACAFLEKS=129;
static const  int URUN_BASKI_CITASI=130;
static const int URUN_CATIFIX=131;
static const int AKSESUAR_ANADOLU_MEDENIYET=135;
static const int AKSESUAR_KIREMIT_LEVHASI=136;
@interface UrunUtil : NSObject
+ (NSMutableArray*) getListObjects:(int)listname;
+ (NSArray*) getSubListObjects:(int )listname;
+ (UrunDetayOb*)getDetayObject:(int )index;
+ (UrunDetayOb*)getDetayObject:(int )listname  withObjectIndex:(int)index;
+(BOOL) hasSubList:(int) listname;
@end
