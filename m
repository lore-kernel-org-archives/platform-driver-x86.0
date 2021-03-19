Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFE88C433E0
	for <platform-driver-x86@archiver.kernel.org>; Fri, 19 Mar 2021 10:40:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 52B6164DF4
	for <platform-driver-x86@archiver.kernel.org>; Fri, 19 Mar 2021 10:40:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229618AbhCSKjo (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 19 Mar 2021 06:39:44 -0400
Received: from mail1.bemta24.messagelabs.com ([67.219.250.4]:36460 "EHLO
        mail1.bemta24.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229687AbhCSKjh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 19 Mar 2021 06:39:37 -0400
Received: from [100.112.128.158] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-4.bemta.az-a.us-west-2.aws.symcld.net id D0/7E-42417-86F74506; Fri, 19 Mar 2021 10:39:36 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA1WSf0xTVxTHuX2v7QN526OAPTLB0Ti3SVppcaM
  a3XDZWMd0IYwszBHkdX3QhrawtszigjZDq7EzwWisKyId2G0Ml1nWgAiaAQoRJIsdbOLWOWbD
  +BUZkCgTh3uPh2775+bzPd9zz/3e5BCY5IYogWDsNsZipo0yURRenDQhluv35RamTgaeVvcPF
  amnet0CdU33FvWp0a+RuqljDMsQato8IbFm4TukaffOCTTTl4ZEmrnmpGzhTqHBrC21Fwr1HS
  1uvGwxxe53D+MOFEg5jKIICfUQwc2rJ0S8GEMw0ntRzIsDAjg4HRbw4gGCqsEpxAlE+TCYPNu
  6LHpw+PFGEOPFOQSu+3NLDk61Y+DyNy+PPi2Anxuvs04kK24hmHZu5FhEPQsTnUNLTXFUG4LP
  uv8WcgKjvAgGbzdiXFcslQf7DwZFHMdR70LboAvnWQVBd6+YY5x6Bq73tbJMECSVD/On1/Av1
  yP4/OiikOuJpF6Ci/udS4yolXCv76yAY4ySws1w3RIDRcGZju8xnuNh/PaikP/cJwiGR+pEvC
  GDxv7fcJ4TIVjnQjzvgIGwT8zzeugMepbrW+DKH16cCwfUWljsquDLJTDTOotVozTPf2J42C6
  Meh6+ubCBLyfDcdeImGOSioGrn4ZxL8K/QmqtxVCst5log1GuTE2VK5UquVKllivTNynoPXJa
  UW6V72asNrlKQe+2KqwVpveNOoWZsTUjdrF0ZY5vz6OaqT8VXWgVIZDFk1cW3i6UPKEt1VXoa
  at+l6XcyFi70GqCkAEZV5lbKImxMMWMvchgZNfzkQ1EtCyOtHA2aS2jTVZDMW/1oU1E9XhtPU
  aMDTWw5+VaXz0mwc2lZiZBSmZwFyjugr7c/Hjco4UPosSEWBJFRERIossYi8lg+78/gaQEksW
  SH+5lp0QbzLbHr06wgQRsoLwnc7hANvpfK8EhOJQ/8wG80ZUailTYXHsDL5fEros+6TbQA8oC
  b8/oU6cISee27P4s5vUWf7LH+d5G3WyBeNsrWbqxvI/2QYOpNmfyeKgps9JRcS88H7u1Om/Su
  cIyXDmytj41Z/s1e5T7QbBqRXZP2mslqxbJ7VGW0vozDYHnDmVGaLW6V+PvFs32EP3X0nLTDp
  S9M7B14UjDQ3J6nTshlJEvbXP9uiN5g883Onh4/sKt6BpD+lvalXdi9oi8vVPH1LtqYjb/cOT
  LN/+6pNKZU8THXsy83/JFek1T95pzXmQ7cTQp8eOd1QV3nb/8nhG+k59+Up3lX+0Ibb78E1lV
  btK0S6PGzedf8AdmBmS4VU8r12MWK/0Pf2x5vmsEAAA=
X-Env-Sender: njoshi1@lenovo.com
X-Msg-Ref: server-26.tower-326.messagelabs.com!1616150374!60915!1
X-Originating-IP: [103.30.234.7]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11823 invoked from network); 19 Mar 2021 10:39:36 -0000
Received: from unknown (HELO lenovo.com) (103.30.234.7)
  by server-26.tower-326.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 19 Mar 2021 10:39:36 -0000
Received: from reswpmail03.lenovo.com (unknown [10.62.32.22])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by Forcepoint Email with ESMTPS id E16A0BF863FB334D37B3;
        Fri, 19 Mar 2021 18:39:32 +0800 (CST)
Received: from reswpmail02.lenovo.com (10.62.32.21) by reswpmail03.lenovo.com
 (10.62.32.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Fri, 19 Mar
 2021 06:39:30 -0400
Received: from va32wusexedge02.lenovo.com (10.62.123.117) by
 reswpmail02.lenovo.com (10.62.32.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Fri, 19 Mar 2021 18:39:30 +0800
Received: from APC01-HK2-obe.outbound.protection.outlook.com (104.47.124.57)
 by mail.lenovo.com (10.62.123.117) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Fri, 19 Mar 2021 18:39:29 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f4T50RefnFOmTEgxgb47wFbSSxKsqRqlp3is8Sv2C89WeVD+ZCLcOxX1fZ0i06+bFtNEhIpSQJuhNSjhcTJhgEgpKuCGzEFEDU7GjfI45NLGOU4r0Gsu/pVxqlZ3KjzZssfE6n4R2xAYN5JL5PoXJ0praQMNn/WscGLBa6ZLA4gdDiuEaVTI9D3W/oaghS1ddBHKW4GuuVCiATrRSMZkDjvGEiPD7J8d+xtgSabhybGvGUYekrEMaZT29cEO3l9RCrxnVpXBpCaCK8FCjNTNsrBbFumyqgeLeD2+b6gjO1KsoLZj8j0IXH/rpoWyuMoGYiPXKrS5bWLY5Daux2EMmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RR2D1awjAg+bWLx3H74JpeYPJK58b+lLhHTYS7IZ+Wo=;
 b=MeABpenOP2VjJtA6XT5O80R8oFViAxUb/G4IglpwBVb3JK1GIM7963YvIiNexCZ/9pyWALibCg+snOEDE3Ng+4ccZMJDWEMMjQ4tNchq1DAjuK1AYs6qSa3QVyBeGH5cYUm/noIeBk7Y4bPq8WfBBrd/QcQfCHRCLWjsi3tKRyhzTrNosBkd1DopaFhvrw+9TzZ3HxG+g9b43zRzD7yiIJBIIDx1a+Ud3+cnd9MQh2WyBB1ZsqCgF5yKTzoWglXEEpv+mOfWQHvRMcnh0NBD26qtuU3o6Uz6cxxWBGJUK44Z+9/8knQncoKMEoc5R1F3LPZxuglEoCMiOhUSdP9KGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lenovo.com; dmarc=pass action=none header.from=lenovo.com;
 dkim=pass header.d=lenovo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=LenovoBeijing.onmicrosoft.com; s=selector2-LenovoBeijing-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RR2D1awjAg+bWLx3H74JpeYPJK58b+lLhHTYS7IZ+Wo=;
 b=S3F8D8DXEBWCZa+Pu9kq9Elo7edM64SMg53RZdFoHl6l2IBS+S0XG1OR/qUI1gR86PyGo5mtEqOmd5BmSza8GmDE55oglrGz9u6ThqfNCsTiuuGK78aDJrE0qLU8dMt5aAGjE9fPUYcFAccgg63fzoNUhdXhECyixSohce/EWg4=
Received: from TY2PR03MB3645.apcprd03.prod.outlook.com (2603:1096:404:3f::21)
 by TY2PR03MB3965.apcprd03.prod.outlook.com (2603:1096:404:aa::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.9; Fri, 19 Mar
 2021 10:39:26 +0000
Received: from TY2PR03MB3645.apcprd03.prod.outlook.com
 ([fe80::a0e1:86f6:bc8f:8f15]) by TY2PR03MB3645.apcprd03.prod.outlook.com
 ([fe80::a0e1:86f6:bc8f:8f15%6]) with mapi id 15.20.3955.023; Fri, 19 Mar 2021
 10:39:26 +0000
From:   Nitin Joshi1 <njoshi1@lenovo.com>
To:     Mark RH Pearson <markpearson@lenovo.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Esteve Varela Colominas <esteve.varela@gmail.com>,
        Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>
CC:     "ibm-acpi-devel@lists.sourceforge.net" 
        <ibm-acpi-devel@lists.sourceforge.net>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Subject: RE: [External] Re: [PATCH] thinkpad_acpi: Allow the FnLock LED to
 change state
Thread-Topic: [External] Re: [PATCH] thinkpad_acpi: Allow the FnLock LED to
 change state
Thread-Index: AQHXHDMtRNsEjYElGUiAQROxEf+fs6qLHLhg
Date:   Fri, 19 Mar 2021 10:39:25 +0000
Message-ID: <TY2PR03MB36456F1A3EFC9C31A865BF498C689@TY2PR03MB3645.apcprd03.prod.outlook.com>
References: <20210315195823.23212-1-esteve.varela@gmail.com>
 <7fcaeb12-35b1-242a-dfd0-02324643c34b@redhat.com>
 <18ee74c0-85d9-6a1a-67f5-82682878001a@lenovo.com>
In-Reply-To: <18ee74c0-85d9-6a1a-67f5-82682878001a@lenovo.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [120.138.48.130]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 19ce4af9-40ac-4344-71a0-08d8eac3446a
x-ms-traffictypediagnostic: TY2PR03MB3965:
x-ld-processed: 5c7d0b28-bdf8-410c-aa93-4df372b16203,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY2PR03MB39650FF92FE1B2E796BA62318C689@TY2PR03MB3965.apcprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wLAK2nfV+9i7mZIfr7zeSJtz5xXta8YDSXW5R5/uy1Q1h/vKMOTyTizDSoiEpZ2QdGne7mWX9+n9+8co+f+Babzti2//AWczeeE1/GvjOk+tPn1yFiYkv3KWAvobS3EqwW//cGP2Q5JSUJBFTG7b1MTrCw51ymx0hlVFDEyXNu8EBDRiuyiTx4UPn6rhHIhMURK57PixqS5C9STGP3BMaHNqrCCyCia2jIVakFhcr/vS6mqSjAE1Pb0UXCTa/i65sShZLdHkqWaJsfox6QLY0N5gqqOU/y5xvwtwLLrHsK4nxhyJiX9RiH+OhKIphrHv+mRH072+JvjRVKqC8emIb9G8yZ0Wrtx3vUNHnyphm1ef0HK1ye1vmqjWS89gWPy7Igs+/U6uB8v7sktjaQwMCQ9mwFL6px5oyLA6XRQcS0IQftSDbef451/mxsYWAWgjXGkJk2EOLXXdSCecmYTefzBe8Xhzs6tvj3Z9JUDEFJgi5jPJhBcukAO/qpEmbw8jDMnWT1YKw5QAUHHTpIZOOHg8gUGRVVtHiGmY2rVIU5lTBipjmQrvDzNqZV/zYUFw3aa9JJU8N6pRxOnNTS9T74oSXwV+8AV7awIe6/HL0OVRQDBKTR+G4vIqpVWA0bFAC2m4lBZcGLSuwqvtibMdlkVNYsL/xtW2XEY6B66VSaqB+BhcFf4ogf7iDQqTsz1VDyzDDKVypM/10hlzzq97Ar7EkmqfZcw9KYhV/UnByhub3pccbABe6ZLonSJPn0iX
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR03MB3645.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(6029001)(4636009)(366004)(396003)(136003)(39860400002)(346002)(376002)(76116006)(478600001)(7696005)(64756008)(66946007)(5660300002)(66556008)(66446008)(83380400001)(66476007)(6506007)(52536014)(966005)(33656002)(4326008)(8676002)(2906002)(71200400001)(8936002)(53546011)(26005)(9686003)(38100700001)(110136005)(186003)(55016002)(54906003)(316002)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?dXA5VjEzTCtuOHVXdnJ3UGdDQmNhU3BMR2hzaUYzc01XUXM2bUFEd2Zrd2s4?=
 =?utf-8?B?SWZRZm8raWo2QjFxYUV2MFB1VENkNTd2L2RDMkRPNHpVNWxTMnJTL0x3Zlg3?=
 =?utf-8?B?amV0eUFDaGtEMEZ3SWNOMHA1cXNUVVllOWloa3pscFg3c0F0eHVMTm5RaHFQ?=
 =?utf-8?B?SjF2L3MyanpJL1VFVHRVWnN2YzFsS2VGWEN0WTJBMytldENGeDBEWmFFUnFk?=
 =?utf-8?B?OTFnSm9EVDhuem9razh2dkxEL1BSUEc2ZzY0NVhXc0REU1V5dlh3cjZQUk44?=
 =?utf-8?B?b0NJdDJtUS9yNzB4MGpPUnZuMHlSNHg2WG1hSVRWTU5OVDI3QjcrdTVVWW0y?=
 =?utf-8?B?WEkrYVQ5dEt5TFZMcURVWS9iOE8xeDVqY1U1aDQ3aXE0UkRaRktYR1VTTW1w?=
 =?utf-8?B?YzBaKzhENENaS2pJakQ2S3laVW5lNVEvZmFmdVRSWVQ1bDJrcWFGK0s3VW16?=
 =?utf-8?B?Y1VXTWpwdG9HaTdkK3crbHcxUXlVakdsRG00UzhCQUlqL0t0WmczOURLbExV?=
 =?utf-8?B?eDhsdC96Mm9hRTAzV2FLcG1IcHNqVUJUTjlpVllZNm82TVZIVnRvTVpJdUZT?=
 =?utf-8?B?MTlEMU5kaXRvN0pIbENJd2lTOFMrRlYxd2M0L2JlbE9mWEdxbXRFWTJVUkIx?=
 =?utf-8?B?NDc4VUNRZzlRQ0JaM2l6cHRoUnRROXhyWi83cndrM3hVNmNZMVprWDhETmJ0?=
 =?utf-8?B?enNPajg3TndJbzJQWXh2dWpYOUl6anAyRE14aXVjT291RzNCS2lyWmVkVkVT?=
 =?utf-8?B?eC9aSWdLdnpZV2NSOE5FN3ZEQUlVTjNjaC9yYURzRkcrZ0NJSVNTWHluV1BE?=
 =?utf-8?B?N0JIRC9mcUZNMTV0TFVnNkt1L2pUaVgxMkVpVTYwRkFCMlVuOVZnN3BhajJE?=
 =?utf-8?B?ZzJTWkRiakFjeC9KVlhQakd2bVhJVWl0TWpYKzBTa2ZLZ2dlTEc1UElYUDRr?=
 =?utf-8?B?MDZzT2MxZ2hLQ0ViL2dzTlJzQTFhSXNWOXR2clpJRFNaTy9OeTd2akI1NHhM?=
 =?utf-8?B?dnZFaHhFT29Ld29VY3VWLzlnaDgwSExDYmFjZFUvK3ZFQU1IemhiamdLQ0Rz?=
 =?utf-8?B?aDZUUzlFRVEwcHQvSFc5eGxtVWRqRmtscndXRDZZUXVETmM1ME9LbkNoTXZT?=
 =?utf-8?B?WnFDUGVidllEYnNOY3JaMW5NYjdVS2VLLzBPbUFJdUlUQlRpRW5LLzViWDRR?=
 =?utf-8?B?MXVhTlp0ZWVnRHg2Y1dDZlBENnRvQzh6aUNzWkhKQTVNYzNxa0k5WExsRVNp?=
 =?utf-8?B?aUxIK2hrY3UrbC9zdVRyWHVKYkYzMFk3ZTZlYmUvemp6Q21LbWZEaHhmdCsw?=
 =?utf-8?B?bnBsNG1RSWpCWjJPa3p4eHNmdFI2ak1lNm5SUXJQUkhkaHJVRWNRaFdhYVdE?=
 =?utf-8?B?UXFrT0FvR1hzalRUbElScGkxZHhlZDY1K0RzVXZmc0xnenN6ako0ZU1XNTFG?=
 =?utf-8?B?eHl3bi9WYnNFWGdLT3FXM25SZkkxN09yekczWU1zbFJXMFJoZnRFYkc0Q2tU?=
 =?utf-8?B?Q09rb09taUtLT2NLaHVlaXVGS29qMjVRUUh1ZUhPa2p1MW5XMlVBOGtjbkJK?=
 =?utf-8?B?Tzh5bnIxNnBkMTVzVmFkYUZyRUV2SyswNXkveHkxOGdpaG5RVUtCWFNNdVJl?=
 =?utf-8?B?ZUpPN0hqTTZxZnVpTk9Dc1h6T2JjU0ZMb24zbnYvM2N0WkphdW8xMlY1Qld3?=
 =?utf-8?B?eVJxWkxjTmZDdlhtT0VmcnAxby9BeHlHL1lOUkJWcUI4U0d4dWlhSk1raDZZ?=
 =?utf-8?Q?oN5hB558BF0KPv3nnn4dbiJzyFpCGWHF1Sqkrdk?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR03MB3645.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19ce4af9-40ac-4344-71a0-08d8eac3446a
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2021 10:39:25.9584
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1nyEoJpiS+mSAhJdlye2gH5QJ7rCF08MpHjAnCbeQHWLT1UjToTs69LkgiFwIpUgDmnn3lBhf5h2wM5qIID1CQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR03MB3965
X-OriginatorOrg: lenovo.com
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

SGVsbG8sDQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IE1hcmsgUkggUGVh
cnNvbiA8bWFya3BlYXJzb25AbGVub3ZvLmNvbT4NCj5TZW50OiBGcmlkYXksIE1hcmNoIDE5LCAy
MDIxIDU6MTMgQU0NCj5UbzogSGFucyBkZSBHb2VkZSA8aGRlZ29lZGVAcmVkaGF0LmNvbT47IEVz
dGV2ZSBWYXJlbGEgQ29sb21pbmFzDQo+PGVzdGV2ZS52YXJlbGFAZ21haWwuY29tPjsgSGVucmlx
dWUgZGUgTW9yYWVzIEhvbHNjaHVoIDxpYm0tDQo+YWNwaUBobWguZW5nLmJyPjsgTml0aW4gSm9z
aGkxIDxuam9zaGkxQGxlbm92by5jb20+DQo+Q2M6IGlibS1hY3BpLWRldmVsQGxpc3RzLnNvdXJj
ZWZvcmdlLm5ldDsgcGxhdGZvcm0tZHJpdmVyLQ0KPng4NkB2Z2VyLmtlcm5lbC5vcmcNCj5TdWJq
ZWN0OiBSZTogW0V4dGVybmFsXSBSZTogW1BBVENIXSB0aGlua3BhZF9hY3BpOiBBbGxvdyB0aGUg
Rm5Mb2NrIExFRCB0bw0KPmNoYW5nZSBzdGF0ZQ0KPg0KPlRoYW5rcyBIYW5zDQo+DQo+T24gMTgv
MDMvMjAyMSAxMjo0OSwgSGFucyBkZSBHb2VkZSB3cm90ZToNCj4+IEhpLA0KPj4NCj4+IE9uIDMv
MTUvMjEgODo1OCBQTSwgRXN0ZXZlIFZhcmVsYSBDb2xvbWluYXMgd3JvdGU6DQo+Pj4gT24gbWFu
eSByZWNlbnQgVGhpbmtQYWQgbGFwdG9wcywgdGhlcmUncyBhIG5ldyBMRUQgbmV4dCB0byB0aGUg
RVNDDQo+Pj4ga2V5LCB0aGF0IGluZGljYXRlcyB0aGUgRm5Mb2NrIHN0YXR1cy4NCj4+PiBXaGVu
IHRoZSBGbitFU0MgY29tYm8gaXMgcHJlc3NlZCwgRm5Mb2NrIGlzIHRvZ2dsZWQsIHdoaWNoIGNh
dXNlcyB0aGUNCj4+PiBNZWRpYSBLZXkgZnVuY3Rpb25hbGl0eSB0byBjaGFuZ2UsIG1ha2luZyBp
dCBzbyB0aGF0IHRoZSBtZWRpYSBrZXlzDQo+Pj4gZWl0aGVyIHBlcmZvcm0gdGhlaXIgbWVkaWEg
a2V5IGZ1bmN0aW9uLCBvciBmdW5jdGlvbiBhcyBhbiBGLWtleSBieQ0KPj4+IGRlZmF1bHQuIFRo
ZSBGbiBrZXkgY2FuIGJlIHVzZWQgdGhlIGFjY2VzcyB0aGUgYWx0ZXJuYXRlIGZ1bmN0aW9uIGF0
DQo+Pj4gYW55IHRpbWUuDQo+Pj4NCj4+PiBXaXRoIHRoZSBjdXJyZW50IGxpbnV4IGtlcm5lbCwg
dGhlIExFRCBkb2Vucyd0IGNoYW5nZSBzdGF0ZSBpZiB5b3UNCj4+PiBwcmVzcyB0aGUgRm4rRVND
IGtleSBjb21iby4gSG93ZXZlciwgdGhlIG1lZGlhIGtleSBmdW5jdGlvbmFsaXR5DQo+Pj4gKmRv
ZXMqIGNoYW5nZS4gVGhpcyBpcyBhbm5veWluZywgc2luY2UgdGhlIExFRCB3aWxsIHN0YXkgb24g
aWYgaXQgd2FzDQo+Pj4gb24gZHVyaW5nIGJvb3R1cCwgYW5kIGl0IG1ha2VzIGl0IGhhcmQgdG8g
a2VlcCB0cmFjayB3aGF0IHRoZSBjdXJyZW50DQo+Pj4gc3RhdGUgb2YgdGhlIEZuTG9jayBpcy4N
Cj4+Pg0KPj4+IFRoaXMgcGF0Y2ggY2FsbHMgYW4gQUNQSSBmdW5jdGlvbiwgdGhhdCBnZXRzIHRo
ZSBjdXJyZW50IG1lZGlhIGtleQ0KPj4+IHN0YXRlLCB3aGVuIHRoZSBGbitFU0Mga2V5IGNvbWJv
IGlzIHByZXNzZWQuIFRocm91Z2ggdGVzdGluZyBpdCB3YXMNCj4+PiBkaXNjb3ZlcmVkIHRoYXQg
dGhpcyBmdW5jdGlvbiBjYXVzZXMgdGhlIExFRCB0byB1cGRhdGUgY29ycmVjdGx5IHRvDQo+Pj4g
cmVmbGVjdCB0aGUgY3VycmVudCBzdGF0ZSB3aGVuIHRoaXMgZnVuY3Rpb24gaXMgY2FsbGVkLg0K
Pj4+DQo+Pj4gVGhlIHJlbGV2YW50IEFDUEkgY2FsbHMgYXJlIHRoZSBmb2xsb3dpbmc6DQo+Pj4g
XF9TQl8uUENJMC5MUEMwLkVDMF8uSEtFWS5HTUtTOiBHZXQgbWVkaWEga2V5IHN0YXRlLCByZXR1
cm5zIDB4NjAzIGlmDQo+dGhlIEZuTG9jayBtb2RlIGlzIGVuYWJsZWQsIGFuZCAweDYwMiBpZiBp
dCdzIGRpc2FibGVkLg0KPj4+IFxfU0JfLlBDSTAuTFBDMC5FQzBfLkhLRVkuU01LUzogU2V0IG1l
ZGlhIGtleSBzdGF0ZSwgc2VuZGluZyBhIDEgd2lsbA0KPmVuYWJsZSBGbkxvY2sgbW9kZSwgYW5k
IGEgMCB3aWxsIGRpc2FibGUgaXQuDQo+Pj4NCj4+PiBSZWxldmFudCBkaXNjdXNzaW9uOg0KPj4+
IGh0dHBzOi8vYnVnemlsbGEua2VybmVsLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MjA3ODQxDQo+Pj4g
aHR0cHM6Ly9idWdzLmxhdW5jaHBhZC5uZXQvdWJ1bnR1Lytzb3VyY2UvbGludXgvK2J1Zy8xODgx
MDE1DQo+Pj4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBFc3RldmUgVmFyZWxhIENvbG9taW5hcyA8ZXN0
ZXZlLnZhcmVsYUBnbWFpbC5jb20+DQo+Pj4gLS0tDQo+Pj4gIGRyaXZlcnMvcGxhdGZvcm0veDg2
L3RoaW5rcGFkX2FjcGkuYyB8IDggKysrKysrKy0NCj4+PiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPj4+DQo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
cGxhdGZvcm0veDg2L3RoaW5rcGFkX2FjcGkuYw0KPj4+IGIvZHJpdmVycy9wbGF0Zm9ybS94ODYv
dGhpbmtwYWRfYWNwaS5jDQo+Pj4gaW5kZXggYzQwNDcwNjM3Li4wOTM2MmRkNzQgMTAwNjQ0DQo+
Pj4gLS0tIGEvZHJpdmVycy9wbGF0Zm9ybS94ODYvdGhpbmtwYWRfYWNwaS5jDQo+Pj4gKysrIGIv
ZHJpdmVycy9wbGF0Zm9ybS94ODYvdGhpbmtwYWRfYWNwaS5jDQo+Pj4gQEAgLTQwNzksMTMgKzQw
NzksMTkgQEAgc3RhdGljIGJvb2wgaG90a2V5X25vdGlmeV82eHh4KGNvbnN0IHUzMg0KPj4+IGhr
ZXksDQo+Pj4NCj4+PiAgCWNhc2UgVFBfSEtFWV9FVl9LRVlfTlVNTE9DSzoNCj4+PiAgCWNhc2Ug
VFBfSEtFWV9FVl9LRVlfRk46DQo+Pj4gLQljYXNlIFRQX0hLRVlfRVZfS0VZX0ZOX0VTQzoNCj4+
PiAgCQkvKiBrZXkgcHJlc3MgZXZlbnRzLCB3ZSBqdXN0IGlnbm9yZSB0aGVtIGFzIGxvbmcgYXMg
dGhlIEVDDQo+Pj4gIAkJICogaXMgc3RpbGwgcmVwb3J0aW5nIHRoZW0gaW4gdGhlIG5vcm1hbCBr
ZXlib2FyZCBzdHJlYW0gKi8NCj4+PiAgCQkqc2VuZF9hY3BpX2V2ID0gZmFsc2U7DQo+Pj4gIAkJ
Kmlnbm9yZV9hY3BpX2V2ID0gdHJ1ZTsNCj4+PiAgCQlyZXR1cm4gdHJ1ZTsNCj4+Pg0KPj4+ICsJ
Y2FzZSBUUF9IS0VZX0VWX0tFWV9GTl9FU0M6DQo+Pj4gKwkJLyogR2V0IHRoZSBtZWRpYSBrZXkg
c3RhdHVzIHRvIGZvY2UgdGhlIHN0YXR1cyBMRUQgdG8gdXBkYXRlICovDQo+Pj4gKwkJYWNwaV9l
dmFsZihoa2V5X2hhbmRsZSwgTlVMTCwgIkdNS1MiLCAidiIpOw0KPj4NCj4+IFNpY25lIHRoaXMg
aXMgYSBnZXR0ZXIgZnVuY3Rpb24gSSBndWVzcyB0aGF0IGNhbGxpbmcgaXQgaXMgbW9zdGx5DQo+
PiBoYXJtbGVzcyBhbmQgaWYgaXQgd29ya3MgYXJvdW5kIHdoYXQgc2VlbXMgdG8gYmUgYSBmaXJt
d2FyZSBidWcgb24NCj4+IHNvbWUgb2YgdGhlIEU/OTUgVGhpbmtQYWQgbW9kZWxzIHRoZW4gSSBn
dWVzcyB0aGF0IHRoaXMgaXMgZmluZSBieSBtZS4NCj4+DQo+PiBNYXJrLCBkbyB5b3UgaGF2ZSBh
bnkgY29tbWVudHMgb24gdGhpcyA/DQo+SSdkIGxpa2UgdG8gZm9sbG93IHVwIHdpdGggdGhlIGZp
cm13YXJlIHRlYW0gdG8gbWFrZSBzdXJlIHdlJ3ZlIGdvdCB0aGUgY29ycmVjdA0KPmRldGFpbHMg
YW5kIGltcGxlbWVudGF0aW9uIChrdWRvcyBvbiB0aGUgcmV2ZXJzZSBlbmdpbmVlcmluZyB0aG91
Z2gpLg0KPg0KPk5pdGluIC0geW91J3ZlIHdvcmtlZCB3aXRoIHRoZSBmaXJtd2FyZSB0ZWFtIG9u
IGhvdGtleXMsIHdvdWxkIHlvdSBtaW5kDQo+ZGlnZ2luZyBpbnRvIHRoaXMgb25lIHBsZWFzZSB0
byBjb25maXJtLiBJbiBwYXJ0aWN1bGFyIGlmIHRoZXJlJ3MgYmVlbiBhIGNoYW5nZQ0KPmhvdyBk
byB3ZSBtYWtlIHN1cmUgd2UgZG9uJ3QgaW1wYWN0IG9sZGVyIHBsYXRmb3JtcyBldGMuDQoNClJl
Z2FyZGluZyAiR01LUyIgbWV0aG9kLCBpdCBkb2VzIG5vdCBoYXZlICJ2ZXJzaW9uIiByZWxhdGVk
IGluZm9ybWF0aW9uLiBTbyAsIGl0cyB1bmxpa2VseSB0byBpbXBhY3QgYW55IG9sZGVyIHBsYXRm
b3Jtcy4NCkhvd2V2ZXIsIEkgZ290IGl0IGNvbmZpcm1lZCB0aGF0IGRlZmluaXRpb24gb2YgR01L
UyBtZXRob2QgaXRzZWxmIGRvZXNuJ3QgaW5jbHVkZSBhbnkgd29ya2Fyb3VuZCBmZWF0dXJlLiAN
Cg0KQnV0LCBzaW5jZSBpdHMgZ2V0dGVyIGZ1bmN0aW9uICwgSSBhbHNvIHRoaW5rIGl0cyBoYXJt
bGVzcyBhbmQgaWYgaXQgd29ya2Fyb3VuZCBzb21lIGlzc3VlIHRoZW4gSSBkb27igJl0IHNlZSBh
bnkgY29uY2Vybi4NCg0KPg0KPk1hcmsNCg0KVGhhbmtzICYgUmVnYXJkcywNCk5pdGluIEpvc2hp
ICANCg==
