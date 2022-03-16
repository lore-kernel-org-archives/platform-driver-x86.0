Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF043C433EF
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Mar 2022 19:24:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237072AbiCPTZ0 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 16 Mar 2022 15:25:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241391AbiCPTZU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 16 Mar 2022 15:25:20 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2060.outbound.protection.outlook.com [40.107.93.60])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3766C366BE
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Mar 2022 12:24:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ag+LoO8I6aNBhHqy+41SSUZtbdXQ/HgQyRgMYEu+/RhBfF3UemWX2vtWrPQm/fYqLB5DvI1mdAX4mTZKF4BjEzwF4CeHcSX+bJmuy9k6Iz4ILiPNWnLabMkgAoLRmZeeFe6ri1BnCcxF2Vz7lHeI9ee6vK8CJxAq5puwMQXNmRXGiqpwX+c7/ABbFKklV2PSDt6yJjeBz231ToV0bUqsemY/51kO1TeAPCEYIZADilXvBn5FtXqFvCzPVQ8nif5EqxxrQ1usPuDikPx/Y6XHDVfgBocah/dmDD4AZANhPiqX5+HIeUFJHA+GH9tZ/OLmTrbHbHZKEiHIxIpiBnju8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g7lz5BOHkt5yP/RPIfhvwdMcQUwoRW9XjvBqy/idhJg=;
 b=ACmJFBcELhYbVlIJMjwChsw8V07ggjPGreddCn1IsrOzuDJiPO0CT0SvjCk3kJ0C96byVO0WiK4b9mzZc6qB84dQmPtKhTg7Hp4+3/jjTfrlmcNeqVHkcCNZEzm0bsm6h4I4MTJDvwwwzenqUalGWucP2UHoUCEFHmWdnA3UkdzfFiVQmFJsLef+si9SFpjvHRw/QYSzmaEg5+R5bvBCftTrhFRTUA3OkYGmf+LuSovgcG9DKI4nkZjt9JEVlkvoAkvRqy8dIvIMF9kYh4uyXLqgnw416FGNedMfJV0TV7pJirEr2ZEOC8deRtBaKW00z5xLkNYML2M5Xil+GLVyhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.235) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g7lz5BOHkt5yP/RPIfhvwdMcQUwoRW9XjvBqy/idhJg=;
 b=nV25Ltr2Ec2IW1i9wQ47fQjb47qv8y/3IE60pTfWEZm9XtOuOwKmBYNTzsUOvOaLjVT/DfyaDoOPlIiKAYsVpQ5zPOmLJhu6JCVQ6FAzETZDyC1LF4B3Aqg6Myl/E3AZ+q0C1bXE3Pb/2elbf5Vlm61L62f1JnyfdS3yr46XDpC5N/6sWeLXAMneCSnLgU92W4dYI2CC4p9kdWRQvkGf2qq8tK6WPPsEASL0y2l2cGmBxHDQ1apWE33zc+katoxGFfeoMOF1fGPtyrkMZLFyHSodsakLlHDV0afTyQdjObW9+Itn1mVbQu+sy5gRfOtTo9yl19PO5vSbSXPHPSp33g==
Received: from BN6PR11CA0053.namprd11.prod.outlook.com (2603:10b6:404:f7::15)
 by MWHPR12MB1774.namprd12.prod.outlook.com (2603:10b6:300:112::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Wed, 16 Mar
 2022 19:24:02 +0000
Received: from BN8NAM11FT003.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:f7:cafe::89) by BN6PR11CA0053.outlook.office365.com
 (2603:10b6:404:f7::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14 via Frontend
 Transport; Wed, 16 Mar 2022 19:24:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.235)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.235 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.235; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.235) by
 BN8NAM11FT003.mail.protection.outlook.com (10.13.177.90) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5081.14 via Frontend Transport; Wed, 16 Mar 2022 19:24:01 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.32; Wed, 16 Mar
 2022 19:23:57 +0000
Received: from [10.20.113.98] (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 16 Mar
 2022 12:23:54 -0700
Message-ID: <884d57c1-5f41-ea80-dfaa-ab5b2f310891@nvidia.com>
Date:   Wed, 16 Mar 2022 14:23:46 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] nvidia-wmi-ec-backlight: Add workarounds for confused
 firmware
Content-Language: en-US
To:     "Limonciello, Mario" <Mario.Limonciello@amd.com>,
        =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>
CC:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        Alexandru Dinu <alex.dinu07@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        "markgross@kernel.org" <markgross@kernel.org>,
        "Deucher, Alexander" <Alexander.Deucher@amd.com>
References: <20220316012516.2233984-1-ddadap@nvidia.com>
 <v_ODhOndx3g1l-BhfKGCB6_nLY83LTc5vz1YDrVEVVF5CmgKUs1x9bmROyWXhmYkeQRVVnvfBnyrFyHaEKqtoZE5P7lKJJ1j_vE0J1Piq2Y=@protonmail.com>
 <0fbfd32e-904d-1e04-8508-e863c357a2ff@nvidia.com>
 <BL1PR12MB5157B047D2DD5548FE08F0ABE2119@BL1PR12MB5157.namprd12.prod.outlook.com>
 <7d56afc0-3428-6ab5-ba41-c5ce4f1a7ad7@nvidia.com>
 <BL1PR12MB5157CA033FD8117DCC79D0A4E2119@BL1PR12MB5157.namprd12.prod.outlook.com>
 <d3d86512-42c6-a5df-752d-efbb89257d3a@nvidia.com>
 <BL1PR12MB5157FD128325F8CCB77E390EE2119@BL1PR12MB5157.namprd12.prod.outlook.com>
From:   Daniel Dadap <ddadap@nvidia.com>
In-Reply-To: <BL1PR12MB5157FD128325F8CCB77E390EE2119@BL1PR12MB5157.namprd12.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 240489c1-bb2e-47c8-5498-08da078286f7
X-MS-TrafficTypeDiagnostic: MWHPR12MB1774:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB1774354C7DE4D9571D99E174BC119@MWHPR12MB1774.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7f7AaB3o1mAyzvDlDyuQT5+CI1bqyt3q98RpJ2t25UU1o9ORPgrRnJhk2sdd2GhrzS16ixoMg2MyS3Tu/oIuTpfC6nEuIslL46hkGOg3ZMXN3EfSNB1zet7YR1kxqcHqQ0X1QimWKUZi9O6Xaz1IlEV2MlQIDdAbvbbXC1kGFOY2JYKXGTZKhYLFUoaOAmr39zCOoLE7VsHnOW3h7+zrBo+lGLSPBeTZN3UI99kh/SZ/lByrlFE2tbn5QFqPnvtydgv1nbJH2TPqmnHh34xmfge88LYV5oTguslBTMhuIthodk5g1UQwdtAeWL/0/NTBYsVzDN8wttf6Dh5NptR+6y/mVJg7UZ3C/BF7NZbREgp9SE2JCUAdtxn/1KK2IR+cBLDi9sVGGy9qViZsh5uObpi75J32JC0Xc4onbTVhQvWziqooV82mqR+bl6vl3UiQbkjfSyqWnFrQHR3n+KLEmS+uZ7DGmsqzp4I/FO+RZcqC0TjHrHi1bw6JouoV5PnG3oeFTh4+mq+uTdjHNtjIZCvEJIp1106s8caf6iex5PNoDz1JjiLnZ3/6NlIYMXm47oLoKg26FqIH4nw2JTDpZUJigwX1SMTWrMVAneLQniAexMG6E9BxrHjtkpbkzHBpaPcSevlWbAKJDxvXkGXR7+ULwOleFOhl5AoeG70hqkwbqSMQx5CFL/BBUVvY5PomaNobNDCWuDbuderstZJb6ZM8STlCG5YoLLsac2XPto5xhhNPVMpKiKN9UrAjCzJC
X-Forefront-Antispam-Report: CIP:12.22.5.235;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(110136005)(54906003)(16576012)(316002)(26005)(53546011)(356005)(4744005)(36860700001)(5660300002)(16526019)(186003)(31686004)(2906002)(81166007)(336012)(426003)(83380400001)(8936002)(36756003)(47076005)(82310400004)(31696002)(4326008)(8676002)(508600001)(2616005)(70206006)(70586007)(86362001)(40460700003)(6666004)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2022 19:24:01.5970
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 240489c1-bb2e-47c8-5498-08da078286f7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.235];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT003.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1774
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 3/16/22 13:25, Limonciello, Mario wrote:
> [Public]
>
>
> I guess when we see backlight issues on these A+N designs the checks should be:
> 1) Are they supposed to be using the nvidia-wmi-ec-backlight driver?
> 2) Is their kernel new enough to have it?
> 3) Do they have the config enabled?
>
> Do you have a script or could you perhaps include some documentation we can
> point people to check "1" so we don't always have to go tear apart ACPI tables
> and make guesses?
>
> I guess it's something like grab _WDG and then parse it to see if there is an entry.


Probably the most foolproof way would be to check for the GUID 
603E9613-EF25-4338-A3D0-C46177516DB7 in /sys/bus/wmi/devices. (2) should 
be true for vanilla 5.16 and later, and many recent pre-5.16 distro 
kernels with HWE backports.

