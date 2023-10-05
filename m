Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08D72E772B5
	for <platform-driver-x86@archiver.kernel.org>; Thu,  5 Oct 2023 16:06:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237695AbjJEQFb (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 5 Oct 2023 12:05:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238163AbjJEQEU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 5 Oct 2023 12:04:20 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2061f.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5b::61f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E05DB26185
        for <platform-driver-x86@vger.kernel.org>; Thu,  5 Oct 2023 05:03:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LqKo9ffeXK/hjZOMvypgxuNfznfrO49/4lkHKjirn/pd2iBPWyjuIGHETjdIlDB/IzeYsU6Y0bzgj0eGSzhdmmflgU9r10kJ6Q/fGtqhttoey8unqo3ZwJYNpM3ZGi024IeEEM3RpFjOM+PutaEYtW2kHYzWtk4heHB6Cs9aiy9L66CunPTJO97jsKJhFRa1Avg6rhkXHeU9CO4M4HsopLVwVniErVyyZZfs6vefAKm7GGucvBUP6r940voFnjo+wLS3higP5y0jUAq6i2htJwRmZOf0GhMSWcAeJphfHh6Y04MxEaLtcPV/3a6Izb3ipVjByaU8wsflFe1wNV/1ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T+JiGPujD0OGLEUpDEeAFwqdyE7aKnE/PzEJlY0gmJA=;
 b=bcdZQCSTxPyDHbcNnN0eQfuhKSh+E9e6XWfpJMDSyuu101Tb6f4HyTF9c+UP1PsR2A3ubhpaR2u27f3fuKpYiwKCa+vBkW+DVTONqsix7FDz4wgmNB0oFdycI2jS1IwwVmb6V69LExLXHA8u9KVqJz+iPpLyjUV8D9Q0WQuTxwprBoIMSUD3LqGtx/nd5lpV1bAfWIrGKmfQi3sOmYX5Wko6FjsTxDRWXH2PGpk4USCADfiv50kVsMAlu4/+rBMBuGTAmtxs5nDKblUXgiKa9tRcRDw5/Nqmmga2JtYae7l3CVi49Y9GgbSGFm8GGXOxEqo22r+BNNovkOA78ZSMtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T+JiGPujD0OGLEUpDEeAFwqdyE7aKnE/PzEJlY0gmJA=;
 b=h60QzlsW30sAr4RXuTEoGa0KrDPPctac8PiDI6t/KxJK45vkbLuNJ/Ba4LTNXxtQGxcr1bvsX2GI6ZLUyOh5tnahUBMHarUc6s9Ay354JYsCWBnHuopMc9E2X9MbVouhukatpBUp9R7KiSK60VD0os60BDHqInNRFQDrMxkoDj/BREyE/4lOCdJPdGJZC0jtBciweZ+bGSUiFp6aVQOSclvd9pHCi1hM5eJJtp+LJo/Y3d2/YT2roA3AFQZxSlaHRP+jmuP18q0mhVLMAdH9nlFmCuXFYznthsHpK0BW+oBKe9Ec68StpZ2+kkrRT0NuM4BGqFX9aMhZBHWzMQ3UIQ==
Received: from BN9PR12MB5068.namprd12.prod.outlook.com (2603:10b6:408:135::21)
 by CH3PR12MB8236.namprd12.prod.outlook.com (2603:10b6:610:121::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.33; Thu, 5 Oct
 2023 12:03:21 +0000
Received: from BN9PR12MB5068.namprd12.prod.outlook.com
 ([fe80::e00:7275:f848:ae4b]) by BN9PR12MB5068.namprd12.prod.outlook.com
 ([fe80::e00:7275:f848:ae4b%3]) with mapi id 15.20.6838.028; Thu, 5 Oct 2023
 12:03:20 +0000
From:   Liming Sun <limings@nvidia.com>
To:     Dan Carpenter <dan.carpenter@linaro.org>
CC:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Subject: RE: [bug report] platform/mellanox: Add BlueField-3 support in the
 tmfifo driver
Thread-Topic: [bug report] platform/mellanox: Add BlueField-3 support in the
 tmfifo driver
Thread-Index: AQHZ8gaXwmqMEKYmR02YJDcgTi3U97A7Iz5g
Date:   Thu, 5 Oct 2023 12:03:20 +0000
Message-ID: <BN9PR12MB50686A40313FAA491D0FD415D3CAA@BN9PR12MB5068.namprd12.prod.outlook.com>
References: <fc905665-465a-4929-8fb2-1dcc2aa4db04@moroto.mountain>
In-Reply-To: <fc905665-465a-4929-8fb2-1dcc2aa4db04@moroto.mountain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR12MB5068:EE_|CH3PR12MB8236:EE_
x-ms-office365-filtering-correlation-id: 5f2f7c56-007a-433a-78d3-08dbc59b1164
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HfXWaczZGv2+ckB9pl13pHrn7UxDburDrOlLRxcj3FRUi+u2+d2PZkC0mnJrvhZHLw/yiROKRvMDlg3UoxEm4pFTsPLauKmBazwecqaPpoXDVnrQJnxDNs5jxvrxdya3Vpppcec1CVhLVPJgNraYySceTJfYJtyIxLm6rZXWT0DfTp78UeaZoLKCq/zZkdMXzauoyPslkf9uDbGBPYsbCz8V44HYSLfU3ANDbueCRBl/5GFtsNnxYtzZr8bO799AqdnxY0qhhJ4xXnWA1OlGfasWWOgxukI/HX/1sGXLRRsaFUC3uTmvmD5Is/8u2/NhBfmy1F2ehy2mtRz1nckEq9orcXeMNzU6EGaD1S/P8UiVDeo+U1iFLeuWd87vTNtR0D7Kdtt1yup1prc17WIrbDd2b2c8ssgoUJltetX3ZG9gEEEME3z2S61+3bTUGA0NXnAFtHjyP8yYXQ8TzihpDgbZW38yrQAwgXbQHS68O21Ce42VOMTpSs8QgNgh4lVHkYxADNawFNmuUgxZ9rL+behUyplLBSjLglPE6I57OyNccE2q/EacxYN6vnG0N6yn1+bviu54DUOdVwMh5z6zFvDPYT7lDl/1UAhJqO7WsEOdY0GPkEieRNE9zwxYk8lz
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5068.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(136003)(396003)(366004)(346002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(55016003)(53546011)(71200400001)(478600001)(7696005)(6506007)(38100700002)(122000001)(38070700005)(86362001)(8936002)(316002)(83380400001)(26005)(9686003)(33656002)(64756008)(66446008)(52536014)(66946007)(5660300002)(41300700001)(76116006)(6916009)(66556008)(2906002)(8676002)(66476007)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?qxqqCNDarn59T1Wak0/hmOz2ZsBscVTFBfHOyxClp5+KjOlv3gew/dph4iNw?=
 =?us-ascii?Q?N6C37VaoPlTh/B9yltJvRyx0M5uGxlDdhh+9RAkT+IB9aXKfqUbw6frLQwKC?=
 =?us-ascii?Q?hSCGVqgZ8oBtBiUA1k6oRTgieAerlhU/ikw1Qfko3tyfMDfdsMLva80w1amd?=
 =?us-ascii?Q?JXAde/m+P6Puo1TqcM0kPB80NDwSPZAGoMldTT6zXRMWEN6LZ2TIDC6hYy2j?=
 =?us-ascii?Q?uUTxIaDaXcLBBY9aZ+0Prk9uPaQS9UidaYlS0457+LEL/g3gHJF7U+2xLFAx?=
 =?us-ascii?Q?qPHgJHjJIJXNfmPw7CTJbGgkmwKxeObjtqrf0V0HWd/xSCTSW/5m0t6GB2sh?=
 =?us-ascii?Q?TAmhidV9UL47fc9RSEMbVq4PBN7453JIND+GoSEaMgqcxL1Y2tCiArETfCIz?=
 =?us-ascii?Q?VAtP0Wq1m7WqYq0HLyo27T8TcI9hQqfoAM4V81pLknR0fMe2KMF6BINviWTo?=
 =?us-ascii?Q?l35NXG2zadUCdGIZbfMNwtrexi0xN2X7gIKu5aeE1VEbfsHENhQY00Fx+f3F?=
 =?us-ascii?Q?CxJDEG9rUcYkvOekYBvoG6B+TJLN/yRIWPgiZXTVzUDYIBC5vUYvI2RvfdLZ?=
 =?us-ascii?Q?EZHUBdMn/+7tbtESNUChljzYARZdmBl74epys2xBBk9lCbZYqzo8JrQAkJh2?=
 =?us-ascii?Q?Z6me+w4wH9GVOoXkkf7rDbOSjLAGZZnOWiZyrHH+5otPTgt8wPOc1KLYNi7D?=
 =?us-ascii?Q?L+v2UfZdtSSbEvz0urVmh/dWOj3FaLzgAIo1z1oy+69scjRt00WJ7D6tlYwM?=
 =?us-ascii?Q?TOXsJh8ryeKthF6IG74TZXifPgjo6XLpJBvnc+nIdHDhaV7IQ6P1/PEB01kR?=
 =?us-ascii?Q?c/D92pb+4qo1PsPkSnR83+4JPBSnwS2ILT1GOSmlk4uoCvkqfsglpLiCeF4m?=
 =?us-ascii?Q?secWQzODG0og0/8erIJENH9v1pyuWm8mD++qCyEPysQUpqyfldQ92B6I+QP/?=
 =?us-ascii?Q?sA5LlaZcucdGMRRE1q4+G7j7tUeRVUMI+3XX0GTryG2pdRXZM+M94zF/NwJM?=
 =?us-ascii?Q?XpQQUOQviILkNuawvt8p2Tl6aC1LzlC5g15cV2uG219NOjDefpjhRYXdJYwA?=
 =?us-ascii?Q?pqvN3P/lDk/09axOeVHouCJcv3Oc/tBPNdwiW7pttXjAPzXNHWPtWWGuosj4?=
 =?us-ascii?Q?BIJbgcO1y9PQORviT0f3cWp0UUsm3jp+okzRIh+kHlTOMPmKL1TdgnwABKn/?=
 =?us-ascii?Q?Ofaiic1i5h/aM5UBvrGTtKOwusIt4mHDP+AercEdnOjKeuXZWR8S87zMmTxC?=
 =?us-ascii?Q?XXpaocOOqMAvWY5IiZYb48WkaaMlGBy952btu8gvDYwAT4OJ4vHaqIHMd4C9?=
 =?us-ascii?Q?Cb7ARpPEWJtOuV/NJpPijJNYBJ6dOO/iqs0ifFsj96ZcM1rpxIcT7xTAfL3M?=
 =?us-ascii?Q?NIo9/GG/dQnETaK72BlLQiWYK10Dl6QPvnvbSeYO4RjP2lR0Albxf1CeOaGn?=
 =?us-ascii?Q?KFmbqQ97164hXsbI0NWm2fbm0bVKzenwvcwEUxPHyJ7u6ECmSuYqY6cYVlS/?=
 =?us-ascii?Q?J8yuMSAuseZUkFCfQDAV1xkLw5N1RKuBnqW9D9NLNQ8BAVHeXwGVbj4XZ4G6?=
 =?us-ascii?Q?iR0js0seueiJujjQ/0c=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5068.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f2f7c56-007a-433a-78d3-08dbc59b1164
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2023 12:03:20.4851
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z9EzMdqGR+ALsktznz+Q4GoFgMPW7gHRkufCoWaS27HRnpDfOVNkj8pEZPeFGLNh60yoycD10hzmR3vC0Z3oKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8236
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Thanks!=20

There is no functionality issue. IS_VRING_DROP is only set for Rx. Line 634=
 is for Tx. So there is no case for line 634 to be used when IS_VRING_DROP(=
) is TRUE.

But I'll submit a patch today to eliminate the warning.

Thanks,
Liming

> -----Original Message-----
> From: Dan Carpenter <dan.carpenter@linaro.org>
> Sent: Thursday, September 28, 2023 8:23 AM
> To: Liming Sun <limings@nvidia.com>
> Cc: platform-driver-x86@vger.kernel.org
> Subject: [bug report] platform/mellanox: Add BlueField-3 support in the t=
mfifo
> driver
>=20
> Hello Liming Sun,
>=20
> The patch bc05ea63b394: "platform/mellanox: Add BlueField-3 support
> in the tmfifo driver" from Oct 18, 2022 (linux-next), leads to the
> following Smatch static checker warning:
>=20
> 	drivers/platform/mellanox/mlxbf-tmfifo.c:634
> mlxbf_tmfifo_rxtx_word()
> 	error: uninitialized symbol 'data'.
>=20
> drivers/platform/mellanox/mlxbf-tmfifo.c
>     592 static void mlxbf_tmfifo_rxtx_word(struct mlxbf_tmfifo_vring *vri=
ng,
>     593                                    struct vring_desc *desc,
>     594                                    bool is_rx, int len)
>     595 {
>     596         struct virtio_device *vdev =3D vring->vq->vdev;
>     597         struct mlxbf_tmfifo *fifo =3D vring->fifo;
>     598         void *addr;
>     599         u64 data;
>     600
>     601         /* Get the buffer address of this desc. */
>     602         addr =3D phys_to_virt(virtio64_to_cpu(vdev, desc->addr));
>     603
>     604         /* Read a word from FIFO for Rx. */
>     605         if (is_rx)
>     606                 data =3D readq(fifo->rx.data);
>     607
>     608         if (vring->cur_len + sizeof(u64) <=3D len) {
>     609                 /* The whole word. */
>     610                 if (!IS_VRING_DROP(vring)) {
>     611                         if (is_rx)
>     612                                 memcpy(addr + vring->cur_len, &da=
ta,
>     613                                        sizeof(u64));
>     614                         else
>     615                                 memcpy(&data, addr + vring->cur_l=
en,
>     616                                        sizeof(u64));
>     617                 }
>=20
> if IS_VRING_DROP() is true then data isn't intialized.
>=20
>     618                 vring->cur_len +=3D sizeof(u64);
>     619         } else {
>     620                 /* Leftover bytes. */
>     621                 if (!IS_VRING_DROP(vring)) {
>     622                         if (is_rx)
>     623                                 memcpy(addr + vring->cur_len, &da=
ta,
>     624                                        len - vring->cur_len);
>     625                         else
>     626                                 memcpy(&data, addr + vring->cur_l=
en,
>     627                                        len - vring->cur_len);
>     628                 }
>=20
> Same here.
>=20
>     629                 vring->cur_len =3D len;
>     630         }
>     631
>     632         /* Write the word into FIFO for Tx. */
>     633         if (!is_rx)
> --> 634                 writeq(data, fifo->tx.data);
>                                ^^^^
> Unitialized if IS_VRING_DROP() is true.
>=20
>     635 }
>=20
> regards,
> dan carpenter
