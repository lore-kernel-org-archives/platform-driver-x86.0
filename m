Return-Path: <SRS0=eM/Q=EE=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7335DC388F7
	for <platform-driver-x86@archiver.kernel.org>; Thu, 29 Oct 2020 02:11:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1803B20738
	for <platform-driver-x86@archiver.kernel.org>; Thu, 29 Oct 2020 02:11:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.b="aVTFnJoI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730454AbgJ2CLd (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 28 Oct 2020 22:11:33 -0400
Received: from mail-mw2nam10on2079.outbound.protection.outlook.com ([40.107.94.79]:3616
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726894AbgJ1VhW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 28 Oct 2020 17:37:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HORoQoikw8+Xq+OIkaPrGYkVjwWa7+FpGz4D05uKdaS3iU502LIgyGXO6JtTHCKihbfoYdNndVJEGnN4lGIwMFgC6rDFMTkEfIxhFrzszkuLFv6dVMmMZS838UwYDijqOfU/mMmvPZUcCPdB1f8DtujgemleaFYWAbVzymhjA2nJz/2vTN1O+xRK/JaU9NgetrOPyoH1GzM2dOXAtEE6+5Yw9Xq4mXNz5mC2UNscnZo4wAKbIC1Rr4QXwUsoFonpKLZsiG6oGzUOKJ2u0j/efnFJhr17vAvVI/CKjTTtnQnrACe1SJa4fPOp0NVJfR0T6hriOAasznBxuDTObW/o5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hfQlmjDDCDrFEL0P/4mD1RDLL81H8LLhsqP23JcD6b4=;
 b=CyqTorojBTTlrLsluY3cHAp6sdoFWsOAroJmRHz23S/uzRXdQlFzeCbhjf+ManyhP69y0jv6Xr8WENlE0NJTqcRE3sQJwTP71sHL2Vdlt1Tt5pdZqx8FCB3LGL8TDrw0fw4zgl6CNW4NteSa0X7og+H7WOUgO1g7BoAj7oDEhpBI87xCSpj5hTZzpJU+L+0jPBjTyyDZNbp9EdMUvHt1a7XfvIq9BXvx8QNdSJPK1dpYWo+e3eB/mTiF05dohno/BklWR6ixhS9bEsnnH0Ov1Zc93rbvUqNJf6EguM9VDAsPODbKiUyWYIZV1PjV3BvySIA3su5HkwH2c67axTKvkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hfQlmjDDCDrFEL0P/4mD1RDLL81H8LLhsqP23JcD6b4=;
 b=aVTFnJoIB8hNWJ3IVGXBcnBCVXYMiPBhm//rGrjrtNJsKWpOkGKv8ZVjUQwCfQexPII5KtmqAylCyNb2FW1ZgtZureql22r+JXZJs0HqqONxcTJR/m6S0qVLXuEwBKCRUkIJ+td2CkcG0vIcRn5wEfJJbtFm88+laf29bByMYRI=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from BN6PR1201MB0004.namprd12.prod.outlook.com
 (2603:10b6:404:ac::23) by BN8PR12MB3249.namprd12.prod.outlook.com
 (2603:10b6:408:68::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.25; Wed, 28 Oct
 2020 19:04:08 +0000
Received: from BN6PR1201MB0004.namprd12.prod.outlook.com
 ([fe80::e8ab:4ae2:8e36:dfc9]) by BN6PR1201MB0004.namprd12.prod.outlook.com
 ([fe80::e8ab:4ae2:8e36:dfc9%5]) with mapi id 15.20.3477.029; Wed, 28 Oct 2020
 19:04:08 +0000
Subject: Re: [PATCH] platform/x86: amd-pmc: Add AMD platform support for
 S2Idle
To:     Hans de Goede <hdegoede@redhat.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        mgross@linux.intel.com, platform-driver-x86@vger.kernel.org
Cc:     Alexander.Deucher@amd.com
References: <20201023080410.458629-1-Shyam-sundar.S-k@amd.com>
 <9c38b017-edec-9c1b-3dfc-18a6a2000998@redhat.com>
 <afe22192-b9c3-5562-fc30-fbc6c90e655d@amd.com>
 <5d997a4e-faa3-1321-7360-9807bec56ada@redhat.com>
From:   Shyam Sundar S K <ssundark@amd.com>
Message-ID: <f84ac58c-2b03-524d-8d25-4052c8ff6ae0@amd.com>
Date:   Thu, 29 Oct 2020 00:33:57 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
In-Reply-To: <5d997a4e-faa3-1321-7360-9807bec56ada@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-Originating-IP: [165.204.158.249]
X-ClientProxiedBy: BM1PR01CA0139.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:40::33) To BN6PR1201MB0004.namprd12.prod.outlook.com
 (2603:10b6:404:ac::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.157.208] (165.204.158.249) by BM1PR01CA0139.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:40::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend Transport; Wed, 28 Oct 2020 19:04:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 55065528-4302-463f-8eae-08d87b743f6e
X-MS-TrafficTypeDiagnostic: BN8PR12MB3249:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN8PR12MB32492D4800A3579EFC2978019A170@BN8PR12MB3249.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1OAoUDMPIs/i5Hk/sbVu5Uy/0PJV6LENMMLhD2CkCkBefgNaAOYHT9u/NEtEWEdIUpPD+z9JSIOMc9OM999akWQSaW32ERw0pl1cGEMceLf3ifrigJdd+eDLOEOamEiN3bVNQzPZ+2N7dyGAfyP6cQZJmb5uGSB0OQzULRu66ZLYcq5zzvBPVZ94GegnjJ0g/cdTvhGXZjKoh6hdI4rmXzldCdw+WyCshwFlKBE7JXPdOnYIZkEZPoL5G4Qsw/HAb5MxtIWRvfaCHY/CMyVhOG+wrbUOzY/GzCKL1iRbuJVJt7zk5P/yca5HuiscYV6bgo3ZJxtqPUyh+EJUnjgdPUnwxIVjr6lpIw5T3JSHhs4JefQzlmV9deRsyB+x+6YmQNOf+QUUYM87p73o1y1RHxXa6N3o362juAu+QlaUjo4ec2wzMRwZ0uSAh/VTKiyO9oyf+OFVy4PTZeFqwI3y+g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR1201MB0004.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(346002)(376002)(396003)(136003)(2616005)(83380400001)(4326008)(6486002)(186003)(110136005)(16576012)(31696002)(16526019)(478600001)(31686004)(45080400002)(5660300002)(36756003)(966005)(6666004)(4744005)(8676002)(53546011)(52116002)(2906002)(8936002)(26005)(66946007)(66476007)(956004)(316002)(66556008)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: MOhX0KwAVWGZxzlCpEHY4bWdSn4inO+IVXtD3DinuNfgJK4NC1i5n5SUdffznCnhdDy8mEnsivVqjxShCLvXU5zRPeUvevqPEGU7q+y+VHAxTE3JJxGBBCxkT4CTznbP8qKKi57nMpn3Ghz8UZq1RKPE767EvBLwn5233ZOOqQKlZSrGQiMSgTJdtUuKA+yBiWTtjEN57Pzg/VRsL0dE2IVq+/L4fIRK1j4gaGNao1KdKQ9OYgE+oboCeRXASXBSOJx6C74+4wlr9qYnrX2haMMMcDVWA/CZwH29GZkJQRrUI0xYqDdkFig5jMQAG+popOfmbYcyKfNcNWpOeKpEWn7mtNgbt01BPU6/izWLydoGbo4tj46ur8HItfu5so4qEUIGUT50pCR/dpCgMM7VGrF2ZSOiXkVLgBk9gxv3xtiBrMMVJXDGJHIfmA6r+ZtUt+vKQpTThnI//iIK+YZs5duhHvs5pXz1lCOk/eSMhNLsdrjczFQGHnkWWlkvZm/MGiY+e390p5RLV7UXqCAF4HJeNmPR2I32L2XjiZ2Eb+xSg5UGLitI12MmOp4IOJ2dDqUxpfBJWn6fkTWdVxqP7f43PKA/kX6gF0sbAsrGKEs40W94ynQycdNCJFsyeaunr/G9nUTg7+Da6nUwPi1Ozw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55065528-4302-463f-8eae-08d87b743f6e
X-MS-Exchange-CrossTenant-AuthSource: BN6PR1201MB0004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2020 19:04:08.7316
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HFyjSeRMyylPuLJHKqg4Aj/Ef5lzoxWy62N82NwC5GaR46e/kYh3+5IorSw5h2LWbm5BNz4iQpvhWsY39IY2OA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3249
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org


On 10/28/2020 10:48 PM, Hans de Goede wrote:
> It looks like something went wrong with the sending of the v2, I do not
> see it in my inbox, nor is it in patchwork:
>
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.kernel.org%2Fproject%2Fplatform-driver-x86%2Flist%2F&amp;data=04%7C01%7Cshyam-sundar.s-k%40amd.com%7Ca870bd81264340ff371d08d87b6571d2%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637395022917438402%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=KY%2F1aeuUNgcg%2BPyCzv%2BEbPJIeXCGn2lftA%2Byp4rBNIY%3D&amp;reserved=0

Not sure what's going wrong. Most likely AMD smtp servers are playing a 
bit. Just resent it again. Can you kindly help to check?

Thanks,

Shyam

