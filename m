Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 763CDC77B7E
	for <platform-driver-x86@archiver.kernel.org>; Thu, 25 May 2023 13:36:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236243AbjEYNgx (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 25 May 2023 09:36:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231397AbjEYNgv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 25 May 2023 09:36:51 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2074.outbound.protection.outlook.com [40.107.244.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24FAB13A
        for <platform-driver-x86@vger.kernel.org>; Thu, 25 May 2023 06:36:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VG7GgA+khAH/p6/zIqb+zp6ycoRHXEq9Ei7kd3QrhoaKq9xJ4U4eYxmJ+3W0CIsTQimRAWvvrZDsrCP+/XTFz+/BYtKarhqcEXTBTrdiBejctBH5ZpsiV3kMs6eZZX9L1+q0hO6Iev9vKGLiQHQeU1CX//VlM1Vc6g8HclJYr5ZLh4J6LwpvpfeuGL+jbHc3vM+RX/Z3PQgGesmCKnl3ekhtbNM6QMcMp0o3qkbIGEhgsK8azqGLY3Hasfxg1VIPZQV5rXhggtC08u3XAzFqgP+kmb36GuRW3qTBrzpqenfYR6QgLA6elE+klQHrxFQCoOEgaiUJRs5VBg/Dj9Btcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=la3wS4tg1m4CAMUay5jOXrjiFy4ZUlvzQAvAMbGxCSI=;
 b=JSB5OKEn0QnBp0ORvrKTxKD3/4JS+UDn7AdW2fXSBCa2dTuhE9mVXRUjIakJMca/dq5v3AX/zDupa9UycwTP2Hba64uXMnXOVyphP00MGPWLXZJOuUjxS4BDFwELyJ+h9HNnt0V3B3qebRG33zxt9/7884urbRcn1ac5feRmsAjyB5wJo3wVLy4F44rQl6i6qCSvnDoCARGA0Za7S0/BckSHQm9n23BkP2vthLlMyiAj7HLtoobJJXeTXAXITLjx7ONZfyvCu0m8NaWzVy/540Hv239++cbyT00V+BbYzR6dcydFuSmcSTzShkJXCrptyC3pMTWkLyRHcCHdsKCGMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=la3wS4tg1m4CAMUay5jOXrjiFy4ZUlvzQAvAMbGxCSI=;
 b=Ri+Nreg2OUsEQAjsW68XSFGxLeNqmAU8KvFMINc3ce6tHTlI7kmfuIw/n9p8EXH3gm3XZXDXbWLBuWhWKZDj82M3qlhPuckO16ec5X0J5jKZ1HUnIgt0BkTl3hPAayz8IQe0vCGgudSI0mz/QRbe+pBptOg8R5yZvqTHLQ1O3pU=
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by PH7PR12MB6812.namprd12.prod.outlook.com (2603:10b6:510:1b6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Thu, 25 May
 2023 13:36:46 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::3f45:358e:abba:24f5]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::3f45:358e:abba:24f5%3]) with mapi id 15.20.6411.028; Thu, 25 May 2023
 13:36:45 +0000
From:   "Limonciello, Mario" <Mario.Limonciello@amd.com>
To:     "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>,
        "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "markgross@kernel.org" <markgross@kernel.org>
CC:     "Goswami, Sanket" <Sanket.Goswami@amd.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Subject: RE: [PATCH v4 3/4] platform/x86/amd: pmc: Add helper function to
 check the cpu id
Thread-Topic: [PATCH v4 3/4] platform/x86/amd: pmc: Add helper function to
 check the cpu id
Thread-Index: AQHZjv8tXr7DvhS78UyxmfrCTapv569q/VyQ
Date:   Thu, 25 May 2023 13:36:45 +0000
Message-ID: <MN0PR12MB61016B9853BCE8B492F2EF5CE2469@MN0PR12MB6101.namprd12.prod.outlook.com>
References: <20230525115004.865395-1-Shyam-sundar.S-k@amd.com>
 <20230525115004.865395-4-Shyam-sundar.S-k@amd.com>
In-Reply-To: <20230525115004.865395-4-Shyam-sundar.S-k@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=1f46d4ff-54fd-4f92-8c64-3e34141d0653;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-05-25T13:34:48Z;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB6101:EE_|PH7PR12MB6812:EE_
x-ms-office365-filtering-correlation-id: eadb9eef-b873-4f7c-74b9-08db5d251585
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VLZEBVtZM4aGh4x0Z1kWE8t/QnWPN3KS+mj8gxCrm9nSYWQq2QOqZRSDwlEr7btQqiFAlR6+u+qRNA9ZRQ0E/Ln0TfcRHs/hc01qKSzBxzwcKmsh2bsD9kezhyqU/OvXXhB8iCdBhQEMytk8pHOOzm433nyxiyGyej01M2Isdv0gYpmtl0IIfwUfZS7veFlL3HywZDGI2cvumQxx6kdzYFSAVbRxhCo/eLQPG5FtulSNdTbGQrXnZB+26JgsGAkjC83h9Ms7KmHNlWSVJ4PoddKtcALE+h6ppTSnhV+L+/h6Yyse+2hhy+EeayUbPaDX9gBteTF+xj3DcchP6+KSsbirNBzxWSpg+FqerGRqPUxCXHrn6s2PegzlCNz4abx6nMx1//OEUxIEKifQsl6NGVzln2HRYwrhF7905JWiwQ3dPqsUL2w6fUFG/GH6S3I5r2ON9TtfnnkBQFkiCfUXuAXRKQo5Po/ZvWnXCRov5uUcY3cSFUzv95MaalrLlNyxxczQErFWv1LlxSdS3RrTUUWmHNVG2CWDLAOTr0wxmLIJyOBObgWfeFqc2HYl9lv8fcn53WBEyxOLnVb7RrQBTnt2tFcS76tJQDmlSc2MngmXtKbR04tdhPG9vw0zw8R2
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(346002)(39860400002)(136003)(396003)(451199021)(33656002)(53546011)(9686003)(83380400001)(122000001)(26005)(38100700002)(6506007)(55016003)(2906002)(186003)(478600001)(71200400001)(316002)(66476007)(4326008)(76116006)(64756008)(66556008)(66446008)(66946007)(38070700005)(86362001)(41300700001)(7696005)(52536014)(5660300002)(8676002)(8936002)(54906003)(110136005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?y2YD3vSHuTaK3onj4eTyobeeY/Fa+uOs7sBMytjGxy5GF2wxy4H5IpRpsMjh?=
 =?us-ascii?Q?ShJ9ZvzXCgNYgVMKK6peodMynjHhTTDfiuehsIrwHOUm4jI4tXC7p706PlJj?=
 =?us-ascii?Q?Io/lU3VpwMhnX2aq+MFAm0+vXOR7BRqadYKnpwJc6Vl2zp9XR3Htwu4HiCJp?=
 =?us-ascii?Q?ID7xcF+T6TmfpSyXjchMCT3nPKlCMFB+K4gZNxrDpwznEZYuGcOXRGN6f44k?=
 =?us-ascii?Q?+AkNkfQ+vW98K54OGFL4eNDwP9ysAeADNiEq+CqiOlIVqVnJD5/HYKVSGnMC?=
 =?us-ascii?Q?h5yxuK2J2Gk5c4cM09MXU8uJbLIIwxDx5ji9lPH68EJ03e/JuX1OafBlNKsi?=
 =?us-ascii?Q?fzVsoJynVcmmsb8qvkVJFf5Ygvk52Oan40nKvFgFOWwj+FSp63NlAD0hQur/?=
 =?us-ascii?Q?Sv8JNYbx+TaJ2EZsa3AxlW85N3vNsfoMlirzni5J39jEpJe9KkgS67C/INPf?=
 =?us-ascii?Q?/22DgdvCQbDpXKgyH5To4HWAOU/xiwYaOtw1bKfrmzkRuPtM2D3qO0DWlDKR?=
 =?us-ascii?Q?2if/tXR7tbpWtE2rQi+lNcKAZNGkZ2hlfLvwGaN8mxuoyQjcEgcLDcGdUCC6?=
 =?us-ascii?Q?6XuAis7XW4TTG5aJvB04ZpYu4Muww1udPLjz5pyMjmTZPTlS8ryNIGD6wQ9f?=
 =?us-ascii?Q?bwggO0Z5bupfISuDCUaAfeB2ZAVQhMXU6m11VNWIlP2TxeZ2DRXoACpUfv8d?=
 =?us-ascii?Q?NDo8w35NHmDBzK9FONfX4A6YQ1yoPN2thAg52VPIQyBJON6OOvgHcPZqnvLm?=
 =?us-ascii?Q?CaQ1qj7/T5wRHWFF4nZ8tMDLReJ/vny7BCLH/dTD/uUhSRaMY1zuioTHAteK?=
 =?us-ascii?Q?j43fAc/UDegBSt86CbKq3Q82tVl59ZroDZYgPt5o7nCapQuEfynwBNJNDh9H?=
 =?us-ascii?Q?gafBL+35UDSAbm+K48m2KDdFvzSlJcxvy6n1ie4A3AtxHO2HAQlUkFkzEm5l?=
 =?us-ascii?Q?pNxsQPKW8TFIGz+te1Ai205r2z50frdNVa8xv+sQ9ffqcsZxinDdEqFz93hQ?=
 =?us-ascii?Q?+5HC38OG4qMyeIo5xPtd1tLEQKKZmt5LFpzKcWX+mlwjfHOmEnzaJINDzQNB?=
 =?us-ascii?Q?VvtocZ08uEycG9WKVz1Hsfcrj1VUPObhg6QtguAmp9lg7zLYoiD+5rhbcYEo?=
 =?us-ascii?Q?KBBEBrM2/N0llUHFzLA8aWg1b4nJ+0/ZeF3ZngmJ7wXxemgO56T/tnZWPhN2?=
 =?us-ascii?Q?MBLB+8Tl+82Evkt/srjfZycU42Re8AH6sUfEC119Va/daqBQGwaLZhmshWov?=
 =?us-ascii?Q?pTfvF7EldbOFtF0DWMgQKnzb1DJkybUBH5eKU+w7ec8zVizAqnn96E3L4H+3?=
 =?us-ascii?Q?Id5iOkJeKs+QoOQs6foCeCZZF+oHFeXq9DMiPdeAVxzZjjLGoQaRaAaSFF4U?=
 =?us-ascii?Q?gJ/gbG4MykNSa9nMchXYSl1cvaAvQiDNRHZuHHWB27645FTtilA25S72lRXd?=
 =?us-ascii?Q?A/XTvm1RFrxUNRVtLirnErRlC6iS6+SX+k4cxLhJ+U4qaCnXaYvB5iwvZ9cC?=
 =?us-ascii?Q?Nr7sj++KsV+SHU7KCNxDc34aQJnkTNRtWaG8ph5m9GMuil7OoZgA/dGJ+KqN?=
 =?us-ascii?Q?G53saobSyoxWo7Z6xXw=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eadb9eef-b873-4f7c-74b9-08db5d251585
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2023 13:36:45.9087
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LudoUQn/6ic38kw3Im26rwuE5m/7zUTafbIrVV8yyZKbU5QMHn1JVtyWIcvQDw0QHJIDyOkZZJpTCV1VbbvfOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6812
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

[AMD Official Use Only - General]

> -----Original Message-----
> From: S-k, Shyam-sundar <Shyam-sundar.S-k@amd.com>
> Sent: Thursday, May 25, 2023 6:50 AM
> To: hdegoede@redhat.com; markgross@kernel.org
> Cc: Goswami, Sanket <Sanket.Goswami@amd.com>; Limonciello, Mario
> <Mario.Limonciello@amd.com>; platform-driver-x86@vger.kernel.org; S-k,
> Shyam-sundar <Shyam-sundar.S-k@amd.com>
> Subject: [PATCH v4 3/4] platform/x86/amd: pmc: Add helper function to
> check the cpu id
>
> Add a helper routine to check the underlying cpu id, that can be used
> across the PMC driver to remove the duplicate code.
>
> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmc.c | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/platform/x86/amd/pmc.c
> b/drivers/platform/x86/amd/pmc.c
> index e2439fda5c02..db0c330d4b85 100644
> --- a/drivers/platform/x86/amd/pmc.c
> +++ b/drivers/platform/x86/amd/pmc.c
> @@ -564,6 +564,18 @@ static void amd_pmc_dbgfs_unregister(struct
> amd_pmc_dev *dev)
>       debugfs_remove_recursive(dev->dbgfs_dir);
>  }
>
> +static bool amd_pmc_is_cpu_supported(struct amd_pmc_dev *dev)

I wonder if it would make things clearer to the casual reader of this
code to name this differently.

Perhaps:

static bool amd_pmc_is_stb_supported(struct amd_pmc_dev *dev);

> +{
> +     switch (dev->cpu_id) {
> +     case AMD_CPU_ID_YC:
> +     case AMD_CPU_ID_CB:
> +     case AMD_CPU_ID_PS:
> +             return true;
> +     default:
> +             return false;
> +     }
> +}
> +
>  static void amd_pmc_dbgfs_register(struct amd_pmc_dev *dev)
>  {
>       dev->dbgfs_dir =3D debugfs_create_dir("amd_pmc", NULL);
> @@ -575,8 +587,7 @@ static void amd_pmc_dbgfs_register(struct
> amd_pmc_dev *dev)
>                           &amd_pmc_idlemask_fops);
>       /* Enable STB only when the module_param is set */
>       if (enable_stb) {
> -             if (dev->cpu_id =3D=3D AMD_CPU_ID_YC || dev->cpu_id =3D=3D
> AMD_CPU_ID_CB ||
> -                 dev->cpu_id =3D=3D AMD_CPU_ID_PS)
> +             if (amd_pmc_is_cpu_supported(dev))
>                       debugfs_create_file("stb_read", 0644, dev->dbgfs_di=
r,
> dev,
>                                           &amd_pmc_stb_debugfs_fops_v2);
>               else
> @@ -1036,7 +1047,7 @@ static int amd_pmc_probe(struct platform_device
> *pdev)
>
>       mutex_init(&dev->lock);
>
> -     if (enable_stb && (dev->cpu_id =3D=3D AMD_CPU_ID_YC || dev->cpu_id
> =3D=3D AMD_CPU_ID_CB)) {
> +     if (enable_stb && amd_pmc_is_cpu_supported(dev)) {
>               err =3D amd_pmc_s2d_init(dev);
>               if (err)
>                       goto err_pci_dev_put;
> --
> 2.25.1

