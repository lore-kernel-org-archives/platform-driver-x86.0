Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DFC3C433F5
	for <platform-driver-x86@archiver.kernel.org>; Mon,  7 Mar 2022 22:28:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238224AbiCGW3U (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 7 Mar 2022 17:29:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232865AbiCGW3T (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 7 Mar 2022 17:29:19 -0500
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2063.outbound.protection.outlook.com [40.107.243.63])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53866193FE
        for <platform-driver-x86@vger.kernel.org>; Mon,  7 Mar 2022 14:28:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N1V1S4KfJxurkX7gYvGSUBXjiQlhtZRh7gNVN8V/F4u4R+kWw9WIIHV4w1I3ZDbiY3nr53SiFmZCMd7U8L3uaq3iizbo2rmBwjZ4392N8CJkv/ebQlCdpCgE4nEi/Omg6FY33Ru1P2z+D5SvkFukwo/gF5o9tc+JM7U2ZHtucMr75IvKAmeOHN2V2Sg2JmJhVgioiG3O0iMC8uT6X71DmhFazrgaWrfx0N40fKpl6xWwQc8RdHIESMt1z6qiCwqn2KEUWiQ+2aeL3hvA4WRsv2P7k13+HSXmTSnPMIcQ1DySg5CrqU20fAybK4BshkNZHEnPJU4TYO46gd1Y4E9i1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iJnkEjSh57QBlyGyNV0hYPxIv2bi3lz49bBSFkd9/f8=;
 b=SvmysvKre6sGwTrwIOHcDf23RancbGA/RHoCWYKmQ/SMPZzkOKmw/UERB/YERAVFhBd+42oTynaGCZ6sg526O8+myotnEKPx9zRDtcRGJaLEZztehkcv4D6exqr8FwgrzYaTgPdluC1O7r966PsVNBFIre+TFv2Qwur46xXkRdY8NzFkY7K/kTuchFJhtRCWa5QYSo8qWN6RMF5UFpJ29hRNC6M6pxdU9Oyxg8vLDRsD3gsvbXB+OK9dY1DH0k9S1w+Jvr6wIvAcbA5nfKALDrYOFxk517lCaaVMDv34sfV70ykioRL5sze27RxoMDnz2pu8+hPvT+UP/9Z/A6Omkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iJnkEjSh57QBlyGyNV0hYPxIv2bi3lz49bBSFkd9/f8=;
 b=PRaBwyfH1+kmqj6+Xl1NmUU3PPCMeC39y4AJ3cQ+iE7D4M1h46cKrLmfBaGMKtRD9mxO6cUaIwLqvCzbckCtbtXfqzxs9VoBevEmF199TyO+LNZmKBsirp40SkC48ji5XQkECjKTpOuHTo/8Kcd+ADGTySSXvEdKJwyKOBAyaVM=
Received: from BL1PR12MB5157.namprd12.prod.outlook.com (2603:10b6:208:308::15)
 by BL1PR12MB5048.namprd12.prod.outlook.com (2603:10b6:208:30a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.13; Mon, 7 Mar
 2022 22:28:22 +0000
Received: from BL1PR12MB5157.namprd12.prod.outlook.com
 ([fe80::692d:9532:906b:2b08]) by BL1PR12MB5157.namprd12.prod.outlook.com
 ([fe80::692d:9532:906b:2b08%5]) with mapi id 15.20.5038.027; Mon, 7 Mar 2022
 22:28:22 +0000
From:   "Limonciello, Mario" <Mario.Limonciello@amd.com>
To:     Jorge Lopez <jorgealtxwork@gmail.com>
CC:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Subject: RE: [PATCH v4 3/3] Changing bios_args.data to be dynamically
 allocated
Thread-Topic: [PATCH v4 3/3] Changing bios_args.data to be dynamically
 allocated
Thread-Index: AQHYMnAM3cB6CUxdfEqfowWG8TKog6y0e88wgAADBICAAAFPAA==
Date:   Mon, 7 Mar 2022 22:28:22 +0000
Message-ID: <BL1PR12MB5157918486C804397EB96B53E2089@BL1PR12MB5157.namprd12.prod.outlook.com>
References: <20220307220932.23607-1-jorge.lopez2@hp.com>
 <20220307220932.23607-4-jorge.lopez2@hp.com>
 <BL1PR12MB5157BEF156685B3DE7B09096E2089@BL1PR12MB5157.namprd12.prod.outlook.com>
 <CAOOmCE89Tj00ZTAh2Jnf_ALX0LKz8AkRteC1PS2Rvjx-Y1HScA@mail.gmail.com>
In-Reply-To: <CAOOmCE89Tj00ZTAh2Jnf_ALX0LKz8AkRteC1PS2Rvjx-Y1HScA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2022-03-07T22:28:19Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=83ff93ef-0d00-4e06-8693-196999016ae2;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_enabled: true
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_setdate: 2022-03-07T22:28:20Z
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_method: Privileged
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_name: Public-AIP 2.0
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_actionid: d7fffa9a-e18d-4b76-8c54-73955543546d
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: deedb3c1-abdb-443a-8e0a-08da0089c9c5
x-ms-traffictypediagnostic: BL1PR12MB5048:EE_
x-microsoft-antispam-prvs: <BL1PR12MB50487B619298385E7387435AE2089@BL1PR12MB5048.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zuTjo4bpJ+L+ctr6ZQmq3eKHg3F/bRQe5GOXIITBTQTxL0xsJhaqP1kx2U/qaB2vzDbDrsZJCy7kLtRXxCL4PWSgYTPYWa2GAgUvZ5qm+DPusPzoEI039i8znYPPAVWfBvh3Kv/XXH9YD2qqKJZAbhNnQzvd6HkFsVGuTTQCsqKxDF/MczRNuI2YUKgeNDeo0xQ6evAF9px10L3aDK2NmFWrC85+C9JlWLPc1S0+BPdXLKFNB/GXzjal+eTmSWz1h089FZo/dRKRg+9GQ2LBWWo31m/tGSlIRTJlujyOA1+ioxNh2QMfwu5cVSfdPZGssF2CtGIxxv7rz+j2sLR8n7td7mwTySxMFcEi8Yw/i6c2EEMxLNHbTYGVe0RCXRym3FgK7SGVojQubxp2tB/b+xGiRh01ln3tJ0RilT2w5zlcG/He+EwlJJoKlhOUqX42ocB86ztwL26eEaZgUpruR4ozogKF/Q3T7ksNSy1nDa2I+1tAYGEi3in21TzoB7iYR2swUApbPx73YwAMzF+xdZzadMMRampNV1eCEO2VlKQ/ATDxhGLrOP7elKP+880ULrosAMySY2mLmatT6CaObcI1wXFl2MkHYrFx+fH4uM82CeuW7HZjwJjmPHdj+rC82rb4Nms22mCoJkzOAELVYd+S2ttb3Zs9PqE7N37LL7tSUF+zw1u5B9fLT8NNpjEp/BbSQi3qoaNlJ1c4504Rpw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5157.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(4326008)(2906002)(86362001)(186003)(66476007)(64756008)(52536014)(8676002)(7696005)(6506007)(9686003)(66446008)(76116006)(66946007)(66556008)(38070700005)(316002)(6916009)(8936002)(71200400001)(508600001)(38100700002)(55016003)(33656002)(122000001)(5660300002)(4744005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L3hJZGkybTVVZjJ5MXovby9Wei9GNk1JdW9Ncy9Ec0VuS0hIcFRoNkZCNXFs?=
 =?utf-8?B?SitGYTU4cGJsaXp2eU9xK0RQbEVQVE1FMGRramxWTmpjNjlVejgvL0F2ZXEz?=
 =?utf-8?B?STVpT0l4VE9zV1BZVnViVVFqbXNTb2ZMZ1RVV0R2RGRtRzFGVVlwL1Y4NWta?=
 =?utf-8?B?aTNKeTRiamNvM3MwMjVUT0U2T0xxbWx4RjNXR2doelF2Nk5sK3lTQkZ1UGRx?=
 =?utf-8?B?SWlSZ1ZHakJCRlVtOXlxb0pRSG1MYlBnVVp1YXNIaFB0OWRvMXdqVk9ueE5L?=
 =?utf-8?B?d1FGYk5YbmRocU1sM2l6ZHZJUGVQRGVySUcvOXJEVjlsbU55Y0VrbFpiMG5S?=
 =?utf-8?B?bTZEWkVVd093d2RzY2RGRTlMRitUaWRRTHVFOS9NRjIzbW9wNS9DZXptMUdk?=
 =?utf-8?B?WHBvT1B0L0Z6Mmg4R2VpQTlZUHIvZytKcjAyUHp2L1dPZGlYUmtYS1Q1bFpj?=
 =?utf-8?B?YUk5NHo2cCtGQnNnSis3OFU5WlFDalNjL1k3TjBDT08xTUloWmxreE5yUkhN?=
 =?utf-8?B?UFBhRHZ3Wk90dzFtMythUzNiV2pveWdIZjRtWjI2UGNkMWtmeVhyeUpyQ2dw?=
 =?utf-8?B?NGQ0OWRLZkQ2MEVOenFHNlFQZ0RiNDZ4cE1uS2l2ajNBSDZ1RjlkbWRGL1Aw?=
 =?utf-8?B?di9Rd2lVNHN5Y0M3cWxtcHpHQ2JzMDZUQVBQOEkyL3g3V1NzYjFIeGx3d0FM?=
 =?utf-8?B?WXJaenZSTVAvWEViemVrbVBVK05mRytmdFFGazBta2NCRGxSZnIyc0lZdk5S?=
 =?utf-8?B?SHJuYjJlVEl0UU52R0E1dDJDZ1o0VkxDMFhSVWh6SlU5NzFXbXdWdlpteUo0?=
 =?utf-8?B?REI1SmRmWXdZZGQ5amoxMVpHa3dDSGx5SjZIT3liMUFVTTF2WXl3UUZFTTF2?=
 =?utf-8?B?bFgwZTFaNUFTdE1FZXgvRmVDazgycjlnRFNmOG9NTUlQaW5BWXlDRmpaT2Uw?=
 =?utf-8?B?Z2MyVG1KV3JBbWs3em9TQndERlRYTHpXc0RtSzlNUlNpWUpQZ3I3OC9jMEdn?=
 =?utf-8?B?dXVTUHN5a3Bja3ptVjFKSzViRFN5WTFLaWg0eWU1bnZQN1R5UHhhdXBIZ1BO?=
 =?utf-8?B?VHpYejJIZTFUYUk1YUxqWS9SMnlNbTlVeklDUy9KNGNpbWhLYktxbFNqc0Fu?=
 =?utf-8?B?aFhQZGJTMSs4RVpmMzdWRlo4TWtBdGI2clgwVzRqVDJ3b0ExK0U5S2NDeEtQ?=
 =?utf-8?B?Ynlpcmh4SGFsNitnMktsR1d0UUt6MVlUNlpLdlZNcGJOKyt4akEzSDRoNUx4?=
 =?utf-8?B?eGJBWkY4UVNPclpwQ3JjZitQSTFZNy83cHUwOGRkeURub0o3ZWNuSGY2YnRD?=
 =?utf-8?B?RmdGY3JwQkt4N2NJYVlDRVhSUlF0Qk5xYUJCTlhiZ3hCb3h3Q2hncHorT1Q5?=
 =?utf-8?B?K1d3b2tERllvRExPQ2ZmRzVVVEFWeW4wSXJGcklxeXhjRTlTakQ1eVVvUmc5?=
 =?utf-8?B?RkwzM2FVSVd5ZzdvQjFob2s0cnFINjdLRWZabGtOeWNOSnBab2NWdWFMaDk1?=
 =?utf-8?B?dm05SW4xQjRIaEtQV0w2QmNlUmRSSExxM1JuVUtlaE9SNk1SWTN0UGZUQnhB?=
 =?utf-8?B?VHpxL0NDLzFXRmQwa3dicGZFajJQaCt0amxFb3Fwc3dXbTRBZWUzK1BYR3ZY?=
 =?utf-8?B?UmI2Slp4Z1FqSHJVM3pKVUQ4cVJpeXVoMmdRNndRSk9TUmFPS3Z6bkM1a3pv?=
 =?utf-8?B?RlB2WWpKSGNFRkhCdmc2UkFxQ0x2VkgxcDl5ZEhSYThSK29aTGFNdVhUWnBM?=
 =?utf-8?B?M0ltNms3TVg4ZTdOK2JTNXNUOXBHb2NwSXZuNmMvU2lYYTI3a25TNnQxcStN?=
 =?utf-8?B?WEt1Q1QvQVYzZk1LbUp4N1FSc0E3aFF5VHh1NGNZVVgrRUpTY0JTM2pmM1V0?=
 =?utf-8?B?V3ZOcWdySGtiR0JnTDdWb0pRdHhkeXhQWVMzb3UxWW51QmlmOU5kdFpPYkJ5?=
 =?utf-8?B?b2hzcTFiVGtoaTdrWUlLRmp4b1h3VnF5RE8zNnN6RlI5K2g5end4dmdQM1c5?=
 =?utf-8?B?Yjh1UnRFcGhNbFFqZS80Z0NseW9DaGxrWU5LZHNlblQzd1daQjU4dUkyWmRy?=
 =?utf-8?B?YndtSkFBNm1ZdFRXZ3J6V2p6TzFjTll5ckxHOU1DNTRDQjUzRWo5NVJJWWdi?=
 =?utf-8?B?M3RGZmMvK1VYZnBacTJhS0t5b0dLM01xSy9oNk1jd0l5Q090Vys4T29pKzBI?=
 =?utf-8?B?alVjQy9lZnYrY3gwbzhJemI0UTk4VWUvZmF0STNqY1I5SThkUC9iUHRVZWRl?=
 =?utf-8?Q?0eP44vL6KUV98YBoc2ZkEzxHxaGk6WP4tEcSgHtkaE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5157.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: deedb3c1-abdb-443a-8e0a-08da0089c9c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2022 22:28:22.0471
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 08/URZR9z/y4pmdHxx3SHh2VT4SRjPqF5EK3ktl1pp3GlzLnvk5KDLytUptP4V6cDFfTTphq+6tiMLj09PtWJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5048
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

W1B1YmxpY10NCg0KPiBUaGUgb25seSBjaGFuZ2VzIGFwcGx5IHRvIFYzLTAwMDEuwqAgwqBQYXRj
aGVzIFYzLTAwMDIgYW5kIFYzLTAwMDMgZGlkIG5vdCBjaGFuZ2VkIGluIHZlcnNpb24gVjQuDQoN
CkluIGdlbmVyYWwgaXQncyBuaWNlIHRvIGluY2x1ZGUgZWl0aGVyIGluIHlvdXIgY292ZXIgbGV0
dGVyICJjaGFuZ2VzIGZyb20gWC1ZIiBvciBpbiBpbmRpdmlkdWFsIHBhdGNoZXMgYmVsb3cgdGhl
IC0tLg0KSXQgbWFrZXMgaXQgZWFzaWVyIGZvciBhbnlvbmUgd2hvIHJldmlld2VkIHByZXZpb3Vz
IHZlcnNpb24gdG8gc3BvdCB0aGUgZGlmZmVyZW5jZXMuDQoNCg==
