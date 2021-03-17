Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	PDS_BAD_THREAD_QP_64,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21947C433DB
	for <platform-driver-x86@archiver.kernel.org>; Wed, 17 Mar 2021 02:29:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E3C1364F40
	for <platform-driver-x86@archiver.kernel.org>; Wed, 17 Mar 2021 02:29:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229550AbhCQC2n (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 16 Mar 2021 22:28:43 -0400
Received: from mail1.bemta24.messagelabs.com ([67.219.250.1]:27074 "EHLO
        mail1.bemta24.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230378AbhCQC2k (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 16 Mar 2021 22:28:40 -0400
Received: from [100.112.128.158] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-1.bemta.az-a.us-west-2.aws.symcld.net id D6/10-57987-75961506; Wed, 17 Mar 2021 02:28:39 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA1WSf0wbZRzG+/au5cDWHaVdX2pGQiNjMK+0Hbo
  aSSZ/qF2iZiRjOmyUMirtbEvplVA0xjqcLJA1TEEGDKikbHFsc7DpZB1IAQuyZAIC4sIGhIZB
  twWEzKYinXe9DvW/z/M+z/v9kXwxRPA7V4Lp7Dad1aw1SrlxqH5pPo44ZMjJl3tOZKkeDNWzV
  U0DWarGmddVgYFprqrjxhLyMkfd3XgnRv2o5jtU7XGts9UrvZNc9XpX0gFOHsdgLii253P0l5
  Z7OJbKbfbjdb+xHWCJVwXiMAHuYMM195dcRgQAbOoY5G45Ez1+NiM2ABwbewyqQCwG8HYEHlv
  LoA2A+1B4vH6Mw4jLAFb/tQ5ogeIeBPZ92hDD/G9hQ/+fZ6KVZwH0bAQjxbh4Kgx4J7k0C/H9
  sKfhLEKHEDwE4MyVUQ5tJOAmGApPR0Nm2Dn6MMpKuDB4FaEZxVPgycBQhPm4Bv7a0RdDs4DiR
  5cmUZpj8Qz4+b0RNrPFdhgcuRBhBBfD2/7WCEMch+4bvyAMi+DyQji63FcAVs5ejBpSWOmr4T
  C8A463VgOG34Ch9roop8Opm0GU4Sz40z0XxRjFz8Jwfznz/AFcWhjm1oDMxv+MwfBz0OVZ4zK
  8G579+j7SGFktHv7c4EddAD0PVAVWQ5HeZtIajIRCLicUCiWh2CMnlM8rZdoPCa2slCTKdKSN
  oGQZKSPLTUeMhTKzztYFqMsqtBz7+wewGViV9YNEjC0V8V14Tr7g6YLiwnK9ltS/Zy016sh+s
  AvD8AnvYBOQoOZis04K+RodlYu36op09vcNRupWn0QhxpMK+df0lM0nLVoTaShirBFAYDXLzW
  2IIFJDIuZPF1EhnA7pS81bJZ5c/DjYIUngAxaLJeBZdFaTwfZ/PwDEGJAm8H10K57BbNvqRJ0
  wtYuQr3jmTXoIm/ZfS+Jg19nHy7s+Kenw5Rqse4M+ZXbf+QE05fDYgc5medbBTnu2P190aPtM
  753alcRW2dsVYSUvHB5Pbb8vdHPe/ejH+exM6/zd5uSyF58SjrtLuu1r+063D9WeyXx8Gos9K
  U64/v1RiXymegp5bVakuZyucdiDaaeOsub2Jr2zmEa6v7hWsedhfXfoysW5E6/sLnGbQhcmnG
  mmYsureZVex1svNXlT2loyhkpkBYuf5RBztyu8+1evIiPiRHcIIfR/1E6JWj6uOux8YVgtkM7
  u7GXhozf3xS+eu+V25ubderCramF5ReG0auKPtIWSNr5NluQmp27mnrr7zeb14Z1T2xyrzqAU
  JfVaRTpiJbX/APH0DthsBAAA
X-Env-Sender: njoshi1@lenovo.com
X-Msg-Ref: server-17.tower-326.messagelabs.com!1615948117!44319!1
X-Originating-IP: [104.232.225.10]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32191 invoked from network); 17 Mar 2021 02:28:38 -0000
Received: from unknown (HELO lenovo.com) (104.232.225.10)
  by server-17.tower-326.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Mar 2021 02:28:38 -0000
Received: from HKGWPEMAIL04.lenovo.com (unknown [10.128.3.72])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by Forcepoint Email with ESMTPS id 1F171C846927315F024A;
        Tue, 16 Mar 2021 22:28:35 -0400 (EDT)
Received: from HKGWPEMAIL01.lenovo.com (10.128.3.69) by
 HKGWPEMAIL04.lenovo.com (10.128.3.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Wed, 17 Mar 2021 10:28:35 +0800
Received: from HKEXEDGE02.lenovo.com (10.128.62.72) by HKGWPEMAIL01.lenovo.com
 (10.128.3.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2106.2 via Frontend
 Transport; Wed, 17 Mar 2021 10:28:35 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (104.47.125.59)
 by mail.lenovo.com (10.128.62.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2106.2; Wed, 17 Mar
 2021 10:28:35 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VsP+DVHSRr1fNcM6Tk/6nbNIy0L4IEMA8JT1Zpa9uf2MF8NjhRH06h9WvsnVEafkVhSjZ74PQN3BaS0x+kwdsYzv3jTklMgX/DqCf4gv31kG0ZUwv2RPfnR1bFeo3t7In1yeSVcIfr9IMwIE5Mtg4TWBLD68OS/QrsVUrJoTKuuOh34QKcBWW0qzcOhAHCx4DQzA+UA2HsLFeDl0Ijy5gKpCM37gaq5HlUfvAv5PQxrlXNqK48nHZ4jeA9+ciJ8AJ9msJk4I2uMNjatwuk40DdaEQOKdbfK1I5g2KuvTggS441fPT1QSE5Ss2660iVv17gV5nzs640b2zxnDETLLjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oJO8fMwvhvCo7/42/lHgzslgVsgonGWmN4ydk3fMTcI=;
 b=Sr/DaOt8hsCCHZpevw6lWCXghwK45imPWFTbdZfym/mAipEDjXhZABPqrcbHwkdfXL0jK8F/mypwMf/izZwaEDyKYIkxYPxxIy5r8rQ7LJ5I1mhP8bk4UJigC5G3ecYrTAT0KfYXr+qRv7pemKCaqN39mfC2banUVCb9DSzflgHGaBdO/MTc/77FdMcinAIP02BROHhxoXeIydWuWnauxjGP83OddzJEC0vcOajsNiH3CHySqNmpax6usDaXSayE1nXRhH5xS9+jFhbAZs2TuhLSSaazbV4wDrWzwnizGnLqoxA6Z49vVPkXizW90BwwWt/7cYmIcnKUlPTLBvolPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lenovo.com; dmarc=pass action=none header.from=lenovo.com;
 dkim=pass header.d=lenovo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=LenovoBeijing.onmicrosoft.com; s=selector2-LenovoBeijing-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oJO8fMwvhvCo7/42/lHgzslgVsgonGWmN4ydk3fMTcI=;
 b=MtJJYKEMWkeSMDVPDYYoo+uNgUFx8pZlq4OvMS/EKvVc/A8B7lcCrmakHHujOTi4+FoZOO6s5dsKs2xtqMgwxzLkSTN79F+EUpanFY1k0E2FnAtrBBlH1SopwoeaQifJEstjKyZ4jq1dpXx+o0Rr4h0o0dFWu0H6pfSMchnmUpQ=
Received: from TY2PR03MB3645.apcprd03.prod.outlook.com (2603:1096:404:3f::21)
 by TY2PR03MB4110.apcprd03.prod.outlook.com (2603:1096:404:af::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.13; Wed, 17 Mar
 2021 02:28:28 +0000
Received: from TY2PR03MB3645.apcprd03.prod.outlook.com
 ([fe80::a0e1:86f6:bc8f:8f15]) by TY2PR03MB3645.apcprd03.prod.outlook.com
 ([fe80::a0e1:86f6:bc8f:8f15%6]) with mapi id 15.20.3955.013; Wed, 17 Mar 2021
 02:28:28 +0000
From:   Nitin Joshi1 <njoshi1@lenovo.com>
To:     Kevin Locke <kevin@kevinlocke.name>,
        Nitin Joshi <nitjoshi@gmail.com>
CC:     "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "ibm-acpi-devel@lists.sourceforge.net" 
        <ibm-acpi-devel@lists.sourceforge.net>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        Mark RH Pearson <markpearson@lenovo.com>
Subject: RE: [External]  Re: [PATCH 1/2] platorm/x86: thinkpad_acpi: sysfs
 interface to reduce wlan tx power
Thread-Topic: [External]  Re: [PATCH 1/2] platorm/x86: thinkpad_acpi: sysfs
 interface to reduce wlan tx power
Thread-Index: AQHXEd6lXAkh9e1oTE28W2ZTLtLdnaqHhAeg
Date:   Wed, 17 Mar 2021 02:28:27 +0000
Message-ID: <TY2PR03MB364560279B38DB0B896C93658C6A9@TY2PR03MB3645.apcprd03.prod.outlook.com>
References: <20210212055856.232702-1-njoshi1@lenovo.com>
 <YEJfiP+oUzgCXG2r@kevinlocke.name>
In-Reply-To: <YEJfiP+oUzgCXG2r@kevinlocke.name>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [114.164.25.243]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e868477c-5e3d-44d7-e6a2-08d8e8ec59b2
x-ms-traffictypediagnostic: TY2PR03MB4110:
x-ld-processed: 5c7d0b28-bdf8-410c-aa93-4df372b16203,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY2PR03MB411047D28F2CD03A125F252B8C6A9@TY2PR03MB4110.apcprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: C+BBdwbsZB6j4yGlQJtpORkukFauoTq0Q7/Li3gxieqnKwRmhNZQ7JDfwf0cZBYn/vrNnTs9GfOnXjQOg5OmE3yFfqQ/f+0wawVwkWoeeRJHtOI8Gi1O1g7fxYlYUQ7caV5MpYr6/K/joqBy/sYeNT4LXqeT583naiDYmK6/JhydpFFFN6gWIlXA/6x7NaQ2j3OmT0lhc6Z5wfxG5dQqdJpn+608nJ/HfEA9O0Wb8piq/aSY0TTs/ZneWgUs2EbV3L6DZ5vtK0mC3qVjOKmkWBAqajtFlngp2lBzgoGxjSti1fQe9DkdDtjbV5FgQn79bCHexBfVzwKdrBeibNImHvm9ad6FXw73nDGLP2NkNXREPt56xs0HUwURegg2jyFr9hfBatK/AsrQW6rRQVFKO/eq9xvGPRYIwLy2k9/t7K8DN9NUEUfxrc/TnBNiYyZLkLD5Qy995wT5nBbky6JcAeg/kBNncmwSX1bGPgZpFgyWfWgN/YcCS4XD1YIaXIR3Xcpl4yG9jUDRcqczQ+ok+Apf9eCbfORAK8TAriEwyvhcp0H6BeXh8e3Qdio72XnS
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR03MB3645.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(136003)(366004)(376002)(396003)(2906002)(52536014)(316002)(478600001)(86362001)(66476007)(55016002)(9686003)(7696005)(8936002)(33656002)(76116006)(5660300002)(71200400001)(66556008)(4326008)(26005)(107886003)(8676002)(110136005)(66446008)(66946007)(64756008)(6506007)(83380400001)(54906003)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?wypUok7aRepJCY9xShDqTAbnykZolpeV5W2Czaw7tt9s8vBXLtbRiJ1oFVJM?=
 =?us-ascii?Q?DOeUUg5g1Yi7NEuJYYcYHk83Erzu5vX5+RABezwEErI9SwMk+5M/9SJgXELe?=
 =?us-ascii?Q?8BNGD1m2ANUfOsZA3OkDJn/+CdOWaLgvjgqmuo//kFaO83fNqUvmCsCPQz4S?=
 =?us-ascii?Q?3kPmdd98SnBplD1Ha5q/NUx43FMMbWPfJJL3WX+mWCyhNXtrTraNxU0PoyL8?=
 =?us-ascii?Q?l/Z6fLaH5w46nJPFsuziyUs+RIZF4pV+YfeZ2rZS4QxpQXgi89kAIbBFiGCc?=
 =?us-ascii?Q?AIzkJd7/3DUOoeF0g8d2A8LvPrlwOwm8qotxfpAwIceUJOqza6JQvXhT5z8o?=
 =?us-ascii?Q?7a1ikIR3KY62XVQhvDa0qr6CKuBV7mZnj6j1PO9W0Si0rBCZBAvadAq0wkds?=
 =?us-ascii?Q?vT2R1Sv1FuEcww9G1kd3SxihSMTythcl6rNTr8TAt1H0AmJZnAXawFINgOVV?=
 =?us-ascii?Q?qYQ9BxQSnuV/mcb+YZgbg9GjqSfNCJjqGweaZgn0VcaYWcc289rxpZQdTFtf?=
 =?us-ascii?Q?NAEWhri1bikOLL/dQUeEyeQxgmScRQrTIZXXawwHDWydyV5H2/15F/K6UxwS?=
 =?us-ascii?Q?1es7vACnLxGbwQmqzCs0IbWw21G2pQvkKnBJbORZKpTzr80KAqkXzcBgSFGs?=
 =?us-ascii?Q?6CqQlPcgmKVHu2mxCpPrKNX5RFzJFGvPTXmsGO0swYmv4IYy1it5ifF5L/HM?=
 =?us-ascii?Q?ThT80uGfHYcCYCrieF2rlYAns6tir86mn6b3MyieCL2w/cyzGpTBx/9uUeaC?=
 =?us-ascii?Q?2wC8MSyyGQcRMVuXBcXu2DLvPahIZCcRa84EEW+koGLilupmUYcriVLq6qnU?=
 =?us-ascii?Q?78xBtdTKxINV/+MKYN6TDfsUWRp5QIE4c74nwSUSUIAbSz3UYVBOAChHlJvc?=
 =?us-ascii?Q?SqZ1ahav6ZASHOG34MgbrrBNhp2pKdkOg7iKRGHc9se5N+ERNWzWfX/hzNCQ?=
 =?us-ascii?Q?0rAudWGpgq/VHmbdJjBPBRSyMA7/YMQVjBj5mUDW3DCpfHcR6aQF8Hhb02vx?=
 =?us-ascii?Q?KQ/ueHpkjpiktXh5sxcE3OIankAxPLpp35r7BSpBkmp//g8S2K+D96dZx0y6?=
 =?us-ascii?Q?7vuSY5gxrRZIMfU6fbX1XHVSMRy67GvSxewhzL/eiIQt4a9fCw8hPZycaDCS?=
 =?us-ascii?Q?TnOiCsr0F4uTa8nSHA3dNf2+bO8fHhYR84XKQFu33tyJCUt75JmrZZ1C9iJb?=
 =?us-ascii?Q?j9KalsLswLHY9Vaa2/KcHBnAgCNt+EGCctSzF5zjk4PyNtwaNVmP8IHnUQvO?=
 =?us-ascii?Q?vX0i3TGnpf6kWPg5/tyVM71swnFxiYl/dJo1cQfTUA8hOy15dvwAJO0UK3vY?=
 =?us-ascii?Q?FxgAiYFjV9LE8HG/ChV9Q67n?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR03MB3645.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e868477c-5e3d-44d7-e6a2-08d8e8ec59b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2021 02:28:28.6588
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lmXOzqEMPLn8AYB3WFk0Al7Y0hP26E0pgip/08yLL4CfK/iJ1hdX4X+AN5u4lbJE4AJP58EkPHPoGjEd48j4uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR03MB4110
X-OriginatorOrg: lenovo.com
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hello,
>-----Original Message-----
>From: Kevin Locke <kevin@kevinlocke.name>
>Sent: Saturday, March 6, 2021 1:43 AM
>To: Nitin Joshi <nitjoshi@gmail.com>
>Cc: hdegoede@redhat.com; ibm-acpi-devel@lists.sourceforge.net; platform-
>driver-x86@vger.kernel.org; Nitin Joshi1 <njoshi1@lenovo.com>; Mark RH
>Pearson <markpearson@lenovo.com>
>Subject: [External] Re: [PATCH 1/2] platorm/x86: thinkpad_acpi: sysfs
>interface to reduce wlan tx power
>
>On Fri, 2021-02-12 at 14:58 +0900, Nitin Joshi wrote:
>> Some newer Thinkpads have the WLAN antenna placed close to the WWAN
>> antenna. In these cases FCC certification requires that when WWAN is
>> active we reduce WLAN transmission power. A new Dynamic Power
>> Reduction Control (DPRC) method is available from the BIOS on these
>> platforms to reduce or restore WLAN Tx power.
>>
>> This patch provides a sysfs interface that userspace can use to adjust
>> the WLAN power appropriately.
>
>Question from a user: How does wlan_tx_strength_reduce relate to or
>interact with ioctl(SIOCSIWTXPOW) (i.e. iwconfig txpower) and
>NL80211_ATTR_WIPHY_TX_POWER_LEVEL (i .e. iw dev set txpower)?  If I
>request 30 dBm then enable wlan_tx_strength_reduce, what happens?  Same
>in the opposite order?  Will ioctl(SIOCGIWTXPOW) show the reduced
>txpower?

Below comment is just to update current status in this e-mail chain:
As informed in separate e-mail, after testing by changing txpower using "iw=
config tx power  xx" I cannot see any change in wlan_tx_strength_reduce
It seems wlan_tx_strength_reduce is not directly related to iwconfig or iw.=
 So, I am currently trying to find more information regarding this.
Although, this patch is working fine but need some more information for bet=
ter understanding.
Hence , dropping this patch series and splitting it i.e submitting only "WW=
AN Antenna patch " now.
=20
Thank you !!=20
=20
Thanks & Regards,
Nitin Joshi =20

>
>Thanks,
>Kevin
