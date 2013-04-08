//
//  UrunUtil.m
//  KilicogluMobile
//
//  Created by mac on 11/17/12.
//  Copyright (c) 2012 com.filosoft. All rights reserved.
//

#import "UrunUtil.h"
#import "PopupItemObject.h"
#import "UrunDetayOb.h"
@implementation UrunUtil

+(BOOL) hasSubList:(int) listname{
    if (listname==CATI_SISTEMLERI) {
        return YES;
    }
    return NO;
    
}
+(NSMutableArray *)getListObjects:(int)listname{
    
    if(CATI_SISTEMLERI==listname){
   
    NSMutableArray  *items = [[NSMutableArray alloc] init];
    
    
    PopupItemObject  *ob=[[PopupItemObject alloc] init];
    ob.label=@"Baca Şapkası";
    ob.image=@"baca_sapkasi.png";
    
    ob.hasSubItems=NO;
    UrunDetayOb *detOb=[[UrunDetayOb alloc]init];
    detOb.titleImageN=@"baca_sapkasi_baslik.png";
    detOb.mainImageN=@"baca_sapkasi_birlesik.png";
    detOb.albumName=@"baca_sapkasi";
    detOb.videosekilAlbum=@"baca_sapkasi_sekil";
    detOb.hasAksesuar=NO;
    ob.detayObject=detOb;
    
    
    NSArray *imageNames1=[[NSArray alloc] initWithObjects:@"bacafleks.png",@"bacaser.png",@"baski_citasi.png",@"catifiks.png", nil];
    PopupItemObject  *ob1=[[PopupItemObject alloc] init];
    ob1.label=@"Baca ve Duvar çözümleri";
    ob1.image=@"bacaveduvar_dibi.png";
    ob1.hasSubItems=YES;
    ob1.katagori=BACA_VE_DUVAR_COZUMLERI;
    [ob1 setListOfSubItems:imageNames1];
    
        NSArray *imageNames6=[[NSArray alloc] initWithObjects:@"dereser_pvc2.png",@"dereser_aluminyum2.png" ,nil];
        PopupItemObject  *ob6=[[PopupItemObject alloc] init];
        ob6.label=@"Dere Detayı çözümleri";
        ob6.image=@"dere_detayi.png";
        ob6.hasSubItems=YES;
        ob6.katagori=DERE_DETAYI_COZUMLERI;
        [ob6 setListOfSubItems:imageNames6];
        
        
        
        
    
        
        
    PopupItemObject  *ob2=[[PopupItemObject alloc] init];
    ob2.label=@"Detay Çözümleri";
    ob2.image=@"deay_cozumleri.png";
    ob2.hasSubItems=NO;
        
    UrunDetayOb *detOb1=[[UrunDetayOb alloc]init];
    detOb1.titleImageN=@"detay_cozumleri_baslik_cati.png";
    detOb1.mainImageN=@"detay_cozumleri_birlesik_cati.png";
    detOb1.albumName=@"detay_cozumleri_cati";
    detOb1.videosekilAlbum=@"detay_cozumleri_cati_sekil";
    detOb1.hasAksesuar=NO;        
    ob2.detayObject=detOb1;
    
    
    NSArray *imageNames3=[[NSArray alloc] initWithObjects:@"sacak_havalandirma.png",@"universal_havalandirma.png", nil];
    PopupItemObject  *ob3=[[PopupItemObject alloc] init];
    ob3.label=@"Havalandırma Ürünleri";
    ob3.image=@"havalandirma.png";
    ob3.katagori=HAVALANDIRMA_URUNLERI;
    [ob3 setListOfSubItems:imageNames3];
    ob3.hasSubItems=YES;
    
    NSArray *imageNames4=[[NSArray alloc] initWithObjects:@"castiser.png",@"catiser_plus.png", @"catiser_reflektif.png",@"cstiser_yp.png",@"izocati.png",nil];    PopupItemObject  *ob4=[[PopupItemObject alloc] init];
    ob4.label=@"Isı ve Su Yalıtımı";
    ob4.image=@"isivesuyalitim.png";
    [ob4 setListOfSubItems:imageNames4];
        ob4.katagori=ISI_VE_SU_YALITIM;
    ob4.hasSubItems=YES;
    
    NSArray *imageNames5=[[NSArray alloc] initWithObjects:@"mahya_montaj_harci.png",@"mahyaser.png", nil];
    PopupItemObject  *ob5=[[PopupItemObject alloc] init];
    ob5.label=@"Mahya Altı Çözümleri";
    ob5.image=@"mahya_alti_cozumleri.png";
    ob5.katagori=MAHYA_ALTI_COZUMLERI;
    [ob5 setListOfSubItems:imageNames5];
    ob5.hasSubItems=YES;
    
    [items addObject:ob];
    [items addObject:ob1];
    [items addObject:ob6];
    [items addObject:ob2];
    [items addObject:ob3];
    [items addObject:ob4];
    [items addObject:ob5];
    
    return items;
    
    }
    
}
+(NSArray *)getSubListObjects:(int)listname{
    
    if(listname==KIREMITLER){
          NSArray *imageNames=[[NSArray alloc] initWithObjects:@"kilicoglu1.png",@"akdeniz.png",@"granada.png",@"valensiya.png",@"alaturka.png",@"aksesuar.png",@"hitit_atesi.png",@"frigya_atesi.png",@"truva_atesi.png", nil];
        return imageNames;
    }
    if(listname==DIS_CEPE_YALITIM){
        NSArray *imageNames=[[NSArray alloc] initWithObjects:@"isi_yalitim_levhasi.png",@"yapistirma_harci.png",@"siva_harci.png",@"dubeller.png",@"siva_filesi.png",@"kaplama_astari.png",@"mineral_siva.png",@"detay_cozumleri.png" ,nil];
        return imageNames;
    }
    if(listname==TUGLALAR){
        
           NSArray *imageNames=[[NSArray alloc] initWithObjects:@"ates_tugla.png",@"cephe_doseme.png",@"nt_tugla.png",@"taban_doseme_tuglasi.png", nil];
        return  imageNames;
    }
    if(listname==CATI_PENCERESI_CATI_CIKIS){
        
        NSArray *imageNames=[[NSArray alloc] initWithObjects:@"cati_cikis_kapagi.png",@"cati_cikis_merdiveni.png",@"cati_penceresi.png", nil];
        return  imageNames;
    }
    
}

+(UrunDetayOb *)getDetayObject:(int)index{
    
     UrunDetayOb *ob=[[UrunDetayOb alloc]init];
  
    
    if(index==URUN_KIREMIT_IRMIGI){
        ob.titleImageN=@"kiremit_irmigi_baslik.png";
        ob.mainImageN=@"kiremit_irmigi.png";
        ob.albumName=@"kiremit_irmigi";
        ob.videosekilAlbum=@"kiremit_irmigi_sekil";
        ob.hasAksesuar=NO;
        
    }
    if(index==URUN_KIREMIT_LEVHASI){
        ob.titleImageN=@"kiremit_levhasi_baslik.png";
        ob.mainImageN=@"kiremit_levhasi.png";
        ob.albumName=@"kiremit_levhasi";
        ob.videosekilAlbum=@"kiremit_levhasi_Sekil";
        ob.hasAksesuar=YES;
        ob.aksesuarId=AKSESUAR_KIREMIT_LEVHASI;
    }
    if(index==URUN_YAGMUR_INDIRME){
        ob.titleImageN=@"yagmur_indirme_genel_baslik.png";
        ob.mainImageN=@"yagmur_indirme_genel_birlesik.png";
        ob.albumName=@"yagmur_indirme_genel";
        ob.videosekilAlbum=@"yagmur_indirme_genel_sekil";
        ob.hasAksesuar=NO;
    }
    if(index==URUN_BACA_SAPKASI){
        ob.titleImageN=@"baca_sapkasi_baslik.png";
        ob.mainImageN=@"baca_sapkasi_birlesik.png";
        ob.albumName=@"baca_sapkasi";
        ob.videosekilAlbum=@"baca_sapkasi_sekil";
        ob.hasAksesuar=NO;
    }
    if(index==URUN_AKDENIZ_KIREMIT){
        ob.titleImageN=@"akdeniz_baslik3.png";
        ob.mainImageN=@"akdeniz_birlesik3.png";
        ob.albumName=@"akdeniz";
        ob.videosekilAlbum=@"akdeniz_sekil";
        ob.hasAksesuar=YES;
        ob.aksesuarId=URUN_CAM_KIREMIT;
    }
    if(index==URUN_CAM_KIREMIT){
        ob.titleImageN=@"aksesuar_baslik.png";
        ob.mainImageN=@"aksesuarlar_genel.png";
        ob.albumName=@"aksesuarlar";
        ob.videosekilAlbum=@"aksesuarlar_sekil";
        ob.hasAksesuar=NO;
        
        
    }
    if(index==URUN_4_YOL_MAHYA){
        ob.titleImageN=@"aksesuar_baslik.png";
        ob.mainImageN=@"aksesuarlar_genel.png";
        ob.albumName=@"aksesuarlar";
        ob.videosekilAlbum=@"aksesuarlar_sekil";
        ob.hasAksesuar=NO;
    }
    if(index==URUN_AKDENIZ_HAVALANDIRMA){
        ob.titleImageN=@"aksesuar_baslik.png";
        ob.mainImageN=@"aksesuarlar_genel.png";
        ob.albumName=@"aksesuarlar";
        ob.videosekilAlbum=@"aksesuarlar_sekil";
        ob.hasAksesuar=NO;
    }
   
    if(index==URUN_CATISER){
        ob.titleImageN=@"catise_baslik.png";
        ob.mainImageN=@"catiser_birlesik.png";
        ob.albumName=@"catiser";
        ob.videosekilAlbum=@"catiser_sekil";
        ob.hasAksesuar=NO;
    }
    if(index==URUN_UNIVERSAL_HAVALANDIRMA){
        ob.titleImageN=@"universal_havalandirma_baslik.png";
        ob.mainImageN=@"universal_havalandirma_birlesik.png";
        ob.albumName=@"universal_havalandirma";
        ob.videosekilAlbum=@"universal_havalandirma_sekil";
        ob.hasAksesuar=NO;
    }
    if(index==URUN_ANTEN_CIKIS_ELAMANI){
        ob.titleImageN=@"aksesuar_baslik.png";
        ob.mainImageN=@"aksesuarlar_genel.png";
        ob.albumName=@"aksesuarlar";
        ob.videosekilAlbum=@"aksesuarlar_sekil";
        ob.hasAksesuar=NO;
    }
    if(index==URUN_VALENSIYA_KIREMIT){
        ob.titleImageN=@"valensiya_baslik.png";
        ob.mainImageN=@"valensiya_birlesik.png";
        ob.albumName=@"valensiya";
        ob.videosekilAlbum=@"valensiya_sekil";
        ob.hasAksesuar=YES;
        ob.aksesuarId=URUN_CAM_KIREMIT;
    }
    if(index==URUN_GUNES_PANELI){
        ob.titleImageN=@"gunes_panelleri_baslik.png";
        ob.mainImageN=@"gunes_paneli_birlesik.png";
        ob.albumName=@"gunes_panelleri";
        ob.videosekilAlbum=@"gunes_paneli_sekil";
        ob.hasAksesuar=NO;
    }
    
    if(index==URUN_OMURGA_TASIMA_PROFILI){
        ob.titleImageN=@"detay_cozumleri_baslik_cati.png";
        ob.mainImageN=@"detay_cozumleri_birlesik_cati.png";
        ob.albumName=@"detay_cozumleri_cati";
        ob.videosekilAlbum=@"detay_cozumleri_cati_sekil";
        ob.hasAksesuar=NO;
    }
    if(index==URUN_GRANADA_HAVALANDIRMA){
        ob.titleImageN=@"aksesuar_baslik.png";
        ob.mainImageN=@"aksesuarlar_genel.png";
        ob.albumName=@"aksesuarlar";
        ob.videosekilAlbum=@"aksesuarlar_sekil";
        ob.hasAksesuar=NO;
    }
    
    if(index==URUN_MAHYASER){
        ob.titleImageN=@"mahyaser_baslik.png";
        ob.mainImageN=@"mahyaser_birlesik.png";
        ob.albumName=@"mahyaser_baslik";
        ob.videosekilAlbum=@"mahyaser_baslik_sekil";
        ob.hasAksesuar=NO;
    }
    if(index==URUN_3_YOL_MAHYA){
        ob.titleImageN=@"aksesuar_baslik.png";
        ob.mainImageN=@"aksesuarlar_genel.png";
        ob.albumName=@"aksesuarlar";
        ob.videosekilAlbum=@"aksesuarlar_sekil";
        ob.hasAksesuar=NO;
    }
    if(index==URUN_MAHYA_MONTAJ_HARCI){
        ob.titleImageN=@"mahya_montaj_baslik.png";
        ob.mainImageN=@"mahya_montaj_birlesik.png";
        ob.albumName=@"mahya_montaj";
        ob.videosekilAlbum=@"mahya_montaj_sekil";
        ob.hasAksesuar=NO;
    }
    if(index==URUN_GRANADA_KIREMIT){
        ob.titleImageN=@"granada_baslik.png";
        ob.mainImageN=@"granada_birlesik.png";
        ob.albumName=@"granada";
        ob.videosekilAlbum=@"granada_sekil";
        ob.hasAksesuar=YES;
        ob.aksesuarId=URUN_CAM_KIREMIT;
    }
    if(index==URUN_YAKASER){
        ob.titleImageN=@"detay_cozumleri_baslik_cati.png";
        ob.mainImageN=@"detay_cozumleri_birlesik_cati.png";
        ob.albumName=@"detay_cozumleri_cati";
        ob.videosekilAlbum=@"detay_cozumleri_cati_sekil";
        ob.hasAksesuar=NO;
    }
    if(index==URUN_IZO_CATI){
        ob.titleImageN=@"izocati_baslik.png";
        ob.mainImageN=@"izocati_birlesik.png";
        ob.albumName=@"izocati_baslik";
        ob.videosekilAlbum=@"izocati_baslik_sekil";
        ob.hasAksesuar=NO;
    }
    if(index==URUN_DERESER_ALUMINYUM){

        ob.titleImageN=@"dereser_aliminyum_baslik.png";
        ob.mainImageN=@"dereser_aluminyum_birlesik.png";
        ob.albumName=@"dereser_aluminyum";
        ob.videosekilAlbum=@"dereser_aluminyum_sekil";
        ob.hasAksesuar=NO;
    }

    if(index==URUN_CATI_PENCERESI){
        ob.titleImageN=@"cati_penceresi_baslik.png";
        ob.mainImageN=@"cati_penceresi_birlesik.png";
        ob.albumName=@"cati_penceresi";
        ob.videosekilAlbum=@"cati_penceresi_sekil";
        ob.hasAksesuar=NO;
    }
    if(index==URUN_KILICOGLU_MAHYA){
        ob.titleImageN=@"aksesuar_baslik.png";
        ob.mainImageN=@"aksesuarlar_genel.png";
        ob.albumName=@"aksesuarlar";
        ob.videosekilAlbum=@"aksesuarlar_sekil";
        ob.hasAksesuar=NO;
    }
    if(index==URUN_ILK_MAHYA){
        ob.titleImageN=@"aksesuar_baslik.png";
        ob.mainImageN=@"aksesuarlar_genel.png";
        ob.albumName=@"aksesuarlar";
        ob.videosekilAlbum=@"aksesuarlar_sekil";
        ob.hasAksesuar=NO;
    }
    if(index==URUN_YAN_SACAK_KAPAGI){
        ob.titleImageN=@"detay_cozumleri_baslik_cati.png";
        ob.mainImageN=@"detay_cozumleri_birlesik_cati.png";
        ob.albumName=@"detay_cozumleri_cati";
        ob.videosekilAlbum=@"detay_cozumleri_cati_sekil";
        ob.hasAksesuar=NO;
    }
    if(index==URUN_DERESER_PVC){
           
        
        ob.titleImageN=@"dereser_baslik.png";
        ob.mainImageN=@"dereser_birlesik.png";
        ob.albumName=@"dereser_pvc";
        ob.videosekilAlbum=@"dereser_pvc_sekil";
        ob.hasAksesuar=NO;    }
    if(index==URUN_CATI_TARAGI){
        ob.titleImageN=@"sacak_havalandirma_baslik.png";
        ob.mainImageN=@"sacak_havalandirma_taragi_birlesik.png";
        ob.albumName=@"sacak_havalandirma";
        ob.videosekilAlbum=@"sacak_havalandirma_sekil";
        ob.hasAksesuar=NO;
    }
    if(index==URUN_YAN_SACAK_KIREMIDI){
        ob.titleImageN=@"aksesuar_baslik.png";
        ob.mainImageN=@"aksesuarlar_genel.png";
        ob.albumName=@"aksesuarlar";
        ob.videosekilAlbum=@"aksesuarlar_sekil";
        ob.hasAksesuar=NO;
    }
    if(index==URUN_CATI_CIKIS_KAPAGI){
        ob.titleImageN=@"cati_cikis_kapak_baslik.png";
        ob.mainImageN=@"cati_cikis_kapagi_birlesik.png";
        ob.albumName=@"cati_cikis_kapak";
        ob.videosekilAlbum=@"cati_cikis_kapak_sekil";
        ob.hasAksesuar=NO;
    }
    if(index==URUN_BACASER){       
        ob.titleImageN=@"bacaser_baslik.png";
        ob.mainImageN=@"bacaser_birlesik.png";
        ob.albumName=@"bacaser";
        ob.videosekilAlbum=@"bacaser_sekil";
        ob.hasAksesuar=NO;
    }
    if(index==URUN_BACAFLEKS){
        ob.titleImageN=@"baca_fleks_baslik.png";
        ob.mainImageN=@"bacafleks_birlesik.png";
        ob.albumName=@"bacafleks";
        ob.videosekilAlbum=@"bacafleks_sekil";
        ob.hasAksesuar=NO;
    }
    if(index==URUN_BASKI_CITASI){
        ob.titleImageN=@"baski_citasi_baslik.png";
        ob.mainImageN=@"baski_citasi_birlesik.png";
        ob.albumName=@"baski_catisi";
        ob.videosekilAlbum=@"baski_catisi_sekil";
        ob.hasAksesuar=NO;
    }
    if(index==URUN_CATIFIX){
        ob.titleImageN=@"catifiks_baslik.png";
        ob.mainImageN=@"catifiks_birlesik.png";
        ob.albumName=@"catifiks";
        ob.videosekilAlbum=@"catifiks_sekil";
        ob.hasAksesuar=NO;
    }
    if(index==AKSESUAR_ANADOLU_MEDENIYET){
        ob.titleImageN=@"aksesuar_baslik.png";
        ob.mainImageN=@"anadolu_medeniyetleri_aksesuar.png";
        ob.albumName=@"aksesuarlar_anadolu";
        ob.videosekilAlbum=@"aksesuarlar_anadolu_sekil";
        ob.hasAksesuar=NO;
    }
    if(index==AKSESUAR_KIREMIT_LEVHASI){
        ob.titleImageN=@"aksesuar_baslik.png";
        ob.mainImageN=@"kiremit_levhası_aksesuar.png";
        ob.albumName=@"aksesuarlar_levha";
        ob.videosekilAlbum=@"aksesuarlar_levha_sekil";
        ob.hasAksesuar=NO;
    }
    return ob;
}
+(UrunDetayOb *)getDetayObject:(int)listname withObjectIndex:(int)index{
    UrunDetayOb *ob=[[UrunDetayOb alloc]init];
    //kilicoglu1.png",@"akdeniz.png",@"granada.png",@"valensiya.png",@"aksesuar.png",@"hitit_atesi.png",@"frigya_atesi.png",@"truva_atesi.png",@"alaturka.png",
    if(listname==KIREMITLER ){
    
    if(index==0){
      
        
        ob.titleImageN=@"kilicoglu_baslik.png";
        ob.mainImageN=@"kilicoglu1_birlesik.png";
        ob.albumName=@"kilicoglu1";
        ob.videosekilAlbum=@"kilicoglu1_sekil";
        ob.hasAksesuar=YES;
        ob.aksesuarId=URUN_CAM_KIREMIT;
    }
    if(index==2){
        ob.titleImageN=@"akdeniz_baslik3.png";
        ob.mainImageN=@"akdeniz_birlesik3.png";
        ob.albumName=@"akdeniz";
        ob.videosekilAlbum=@"akdeniz_sekil";
        ob.hasAksesuar=YES;
        ob.aksesuarId=URUN_CAM_KIREMIT;
             
    }
    if(index==4){
        ob.titleImageN=@"granada_baslik.png";
        ob.mainImageN=@"granada_birlesik.png";
        ob.albumName=@"granada";
        ob.videosekilAlbum=@"granada_sekil";
        ob.hasAksesuar=YES;
        ob.aksesuarId=URUN_CAM_KIREMIT;
    }
    if(index==6){
        ob.titleImageN=@"valensiya_baslik.png";
        ob.mainImageN=@"valensiya_birlesik.png";
        ob.albumName=@"valensiya";
        ob.videosekilAlbum=@"valensiya_sekil";
        ob.hasAksesuar=YES;
        ob.aksesuarId=URUN_CAM_KIREMIT;    }
        
        
        if(index==8){
            
            
            ob.titleImageN=@"alaturka_baslik.png";
            ob.mainImageN=@"alaturka_birlesik.png";
            ob.albumName=@"alaturka";
            ob.videosekilAlbum=@"alaturka_sekil";
            ob.hasAksesuar=YES;
            ob.aksesuarId=URUN_CAM_KIREMIT;         }
        
    if(index==10){
        ob.titleImageN=@"aksesuar_baslik.png";
        ob.mainImageN=@"aksesuarlar_genel.png";
        ob.albumName=@"aksesuarlar";
        ob.videosekilAlbum=@"aksesuarlar_sekil";
        ob.hasAksesuar=NO;
    }
    if(index==12){
        ob.titleImageN=@"hitit_baslik.png";
        ob.mainImageN=@"hitit_atesi_birlesik.png";
         ob.albumName=@"hitit";
        ob.videosekilAlbum=@"hitit_sekil";
        ob.hasAksesuar=YES;
        ob.aksesuarId=AKSESUAR_ANADOLU_MEDENIYET;
    }
    if(index==14){
        ob.titleImageN=@"frigya_baslik.png";
        ob.mainImageN=@"frigya_atesi_birlesik.png";
        ob.albumName=@"frigya";
        ob.videosekilAlbum=@"frigya_sekil";
        ob.hasAksesuar=YES;
        ob.aksesuarId=AKSESUAR_ANADOLU_MEDENIYET;
    }
    
    if(index==16){
        ob.titleImageN=@"truva_baslik.png";
        ob.mainImageN=@"truva_atesi_birlesik.png";
        ob.albumName=@"truva";
        ob.videosekilAlbum=@"truva_sekil";
        ob.hasAksesuar=YES;
        ob.aksesuarId=AKSESUAR_ANADOLU_MEDENIYET;
    }

   
    }
    //"bacafleks.png",@"bacaser.png",@"baski_citasi.png",@"catifiks.png",
    if(listname==BACA_VE_DUVAR_COZUMLERI ){
        
        if(index==0){
            ob.titleImageN=@"baca_fleks_baslik.png";
            ob.mainImageN=@"bacafleks_birlesik.png";
            ob.albumName=@"bacafleks";
            ob.videosekilAlbum=@"bacafleks_sekil";
            ob.hasAksesuar=NO;
        }
        if(index==2){
            ob.titleImageN=@"bacaser_baslik.png";
            ob.mainImageN=@"bacaser_birlesik.png";
            ob.albumName=@"bacaser";
            ob.videosekilAlbum=@"bacaser_sekil";
            ob.hasAksesuar=NO;
        }
        if(index==4){
            ob.titleImageN=@"baski_citasi_baslik.png";
            ob.mainImageN=@"baski_citasi_birlesik.png";
            ob.albumName=@"baski_catisi";
            ob.videosekilAlbum=@"baski_catisi_sekil";
            ob.hasAksesuar=NO;
        
        }
        if(index==6){
            ob.titleImageN=@"catifiks_baslik.png";
            ob.mainImageN=@"catifiks_birlesik.png";
            ob.albumName=@"catifiks";
            ob.videosekilAlbum=@"catifiks_sekil";
            ob.hasAksesuar=NO;
            
        }
              
    }
    if(listname==DERE_DETAYI_COZUMLERI ){
        
        if(index==0){
            ob.titleImageN=@"dereser_baslik.png";
            ob.mainImageN=@"dereser_birlesik.png";
            ob.albumName=@"dereser_pvc";
            ob.videosekilAlbum=@"dereser_pvc_sekil";
            ob.hasAksesuar=NO;
        }
        if(index==2){
            ob.titleImageN=@"dereser_aliminyum_baslik.png";
            ob.mainImageN=@"dereser_aluminyum_birlesik.png";
            ob.albumName=@"dereser_aluminyum";
            ob.videosekilAlbum=@"dereser_aluminyum_sekil";
            ob.hasAksesuar=NO;
        }
  
        
    }
    
    //sacak_havalandirma.png",@"universal_havalandirma.png"
    if(listname==HAVALANDIRMA_URUNLERI ){
        
        if(index==0){
            ob.titleImageN=@"sacak_havalandirma_baslik.png";
            ob.mainImageN=@"sacak_havalandirma_taragi_birlesik.png";
            ob.albumName=@"sacak_havalandirma";
            ob.videosekilAlbum=@"sacak_havalandirma_sekil";
            ob.hasAksesuar=NO;
        }
        if(index==2){
            ob.titleImageN=@"universal_havalandirma_baslik.png";
            ob.mainImageN=@"universal_havalandirma_birlesik.png";
            ob.albumName=@"universal_havalandirma";
            ob.videosekilAlbum=@"universal_havalandirma_sekil";
            ob.hasAksesuar=NO;        }
    
        
    }
    
     
    
        //@"castiser.png",@"catiser_plus.png", @"catiser_reflektif.png",@"cstiser_yp.png",@"izocati.png"
    if(listname==ISI_VE_SU_YALITIM){
        
        if(index==0){
            ob.titleImageN=@"catise_baslik.png";
            ob.mainImageN=@"catiser_birlesik.png";
            ob.albumName=@"catiser";
            ob.videosekilAlbum=@"catiser_sekil";
            ob.hasAksesuar=NO;
        }
        if(index==2){
            ob.titleImageN=@"catiser_plus_baslik.png";
            ob.mainImageN=@"catiser_plus_birlesik.png";
            ob.albumName=@"catiser_plus";
            ob.videosekilAlbum=@"catiser_plus_sekil";
            ob.hasAksesuar=NO;
        }
        if(index==4){
            ob.titleImageN=@"catiser_reflektif_baslik.png";
            ob.mainImageN=@"catiser_reflektif_birlesik.png";
            ob.albumName=@"catiser_reflektif";
            ob.videosekilAlbum=@"catiser_reflektif_sekil";
            ob.hasAksesuar=NO;
        }
        if(index==6){
            ob.titleImageN=@"catiser_yp_baslik.png";
            ob.mainImageN=@"catiseryp_birlesik.png";
            ob.albumName=@"catiser_yp";
            ob.videosekilAlbum=@"catiser_yp_sekil";
            ob.hasAksesuar=NO;
        }
        if(index==8){
            ob.titleImageN=@"izocati_baslik.png";
            ob.mainImageN=@"izocati_birlesik.png";
            ob.albumName=@"izocati_baslik";
            ob.videosekilAlbum=@"izocati_baslik_sekil";
            ob.hasAksesuar=NO;
        }
    
    }

    //:@"mahya_montaj_harci.png",@"mahyaser.png"
    if(listname==MAHYA_ALTI_COZUMLERI ){
        
        if(index==0){
            ob.titleImageN=@"mahya_montaj_baslik.png";
            ob.mainImageN=@"mahya_montaj_birlesik.png";
            ob.albumName=@"mahya_montaj";
            ob.videosekilAlbum=@"mahya_montaj_sekil";
            ob.hasAksesuar=NO;
        }
        if(index==2){
            ob.titleImageN=@"mahyaser_baslik.png";
            ob.mainImageN=@"mahyaser_birlesik.png";
            ob.albumName=@"mahyaser_baslik";
            ob.videosekilAlbum=@"mahyaser_baslik_sekil";
            ob.hasAksesuar=NO;
        }
        
        
    }    
    
    
    //@"ates_tugla.png",@"cephe_doseme.png",@"nt_tugla.png",@"taban_doseme_tuglasi.png",    
    if(listname==TUGLALAR ){
        
        if(index==0){
            ob.titleImageN=@"ates_tugla_baslik.png";
            ob.mainImageN=@"ates_tugla_birlesik.png";
            ob.albumName=@"ates_tugla_baslik";
            ob.videosekilAlbum=@"ates_tugla_baslik_sekil";
            ob.hasAksesuar=NO;
        }
        if(index==2){
            ob.titleImageN=@"cephe_kaplama_baslik.png";
            ob.mainImageN=@"cephe_kaplama_birlesik.png";
            ob.albumName=@"cephe_kaplama";
            ob.videosekilAlbum=@"cephe_kaplama_sekil";
            ob.hasAksesuar=NO;
        }
        if(index==4){
            ob.titleImageN=@"nt_tugla_baslik.png";
            ob.mainImageN=@"nt_tugla_birlesik.png";
            ob.albumName=@"nt_tugla";
            ob.videosekilAlbum=@"nt_tugla_sekil";
            ob.hasAksesuar=NO;
        }
        if(index==6){
            ob.titleImageN=@"taban_doseme_tugla_baslik.png";
            ob.mainImageN=@"taban_doseme_birlesik.png";
            ob.albumName=@"taban_doseme";
            ob.videosekilAlbum=@"taban_doseme_sekil";
            ob.hasAksesuar=NO;
        
        }
        
    }
    
//@"isi_yalitim_levhasi.png",@"yapistirma_harci.png",@"siva_harci.png",@"dubeller.png",@"siva_filesi.png",@"kaplama_astari.png",@"mineral_siva.png",@"detay_cozumleri.png" ,nil];
    // :@"detay_cozumleri.png",@"dubeller.png",@"isi_yalitim_levhasi.png",@"kaplama_astari.png",@"mineral_siva.png",@"siva_filesi.png",@"siva_harci.png",@"yapistirma_harci.png    
    if(listname==DIS_CEPE_YALITIM ){
        
        if(index==0){
            ob.titleImageN=@"levha_baslik.png";
            ob.mainImageN=@"levha_birlesik.png";
            ob.albumName=@"levha";
            ob.videosekilAlbum=@"levha_sekil";
            ob.hasAksesuar=NO;
       
        }
        if(index==2){
            
            ob.titleImageN=@"yapistirma_harci_baslik.png";
            ob.mainImageN=@"yapistirma_harci_birlesik.png";
            ob.albumName=@"yapistirma_harci";
            ob.videosekilAlbum=@"yapistirma_harci_sekil";
            ob.hasAksesuar=NO;
            
            
        }
        if(index==4){
            ob.titleImageN=@"siva_harci_baslik.png";
            ob.mainImageN=@"siva_harci_birlesik.png";
            ob.albumName=@"siva_harci";
            ob.videosekilAlbum=@"siva_harci_sekil";
            ob.hasAksesuar=NO;        }
        if(index==6){
            ob.titleImageN=@"dubeller_baslik.png";
            ob.mainImageN=@"dubeller_birlesik.png";
            ob.albumName=@"dubeller";
            ob.videosekilAlbum=@"dubeller_sekil";
            ob.hasAksesuar=NO;
            
            
       
        }
        if(index==8){
            ob.titleImageN=@"siva_filesi_baslik.png";
            ob.mainImageN=@"siva_filesi_birlesik.png";
            ob.albumName=@"siva_filesi";
            ob.videosekilAlbum=@"siva_filesi_sekil";
            ob.hasAksesuar=NO;
            
        }
        if(index==10){
            ob.titleImageN=@"kaplama_Astari_baslik.png";
            ob.mainImageN=@"kaplama_Astari_birlesik.png";
            ob.albumName=@"kaplama_astari";
            ob.videosekilAlbum=@"kaplama_astari_sekil";
            ob.hasAksesuar=NO;
        }
        if(index==12){
            
            ob.titleImageN=@"mineral_siva_baslik.png";
            ob.mainImageN=@"mineral_siva_birlesik.png";
            ob.albumName=@"mineral_siva";
            ob.videosekilAlbum=@"mineral_siva_sekil";
            ob.hasAksesuar=NO;
        }
        
        if(index==14){
            
            ob.titleImageN=@"detay_cozumleri_baslik.png";
            ob.mainImageN=@"detay_cozumleri_birlesik.png";
            ob.albumName=@"detay_izocephe";
            ob.videosekilAlbum=@"detay_izocephe_sekil";
            ob.hasAksesuar=NO;
        }
        
    }
    //@"cati_cikis_kapagi.png",@"cati_cikis_merdiveni.png",@"cati_penceresi.png"
    if(listname==CATI_PENCERESI_CATI_CIKIS ){
        
        if(index==0){
            ob.titleImageN=@"cati_cikis_kapak_baslik.png";
            ob.mainImageN=@"cati_cikis_kapagi_birlesik.png";
            ob.albumName=@"cati_cikis_kapak";
            ob.videosekilAlbum=@"cati_cikis_kapak_sekil";
            ob.hasAksesuar=NO;
        }
        if(index==2){
            ob.titleImageN=@"cati_cikis_merdiveni_baslik.png";
            ob.mainImageN=@"cati_cikis_merdiveni_birlesik.png";
            ob.albumName=@"cati_cikis_merdiveni";
            ob.videosekilAlbum=@"cati_cikis_merdiveni_sekil";
            ob.hasAksesuar=NO;
        }
        if(index==4){
            ob.titleImageN=@"cati_penceresi_baslik.png";
            ob.mainImageN=@"cati_penceresi_birlesik.png";
            ob.albumName=@"cati_penceresi";
            ob.videosekilAlbum=@"cati_penceresi_sekil";
            ob.hasAksesuar=NO;
        }
        
        
    }
 
    return ob;
    
}
@end
