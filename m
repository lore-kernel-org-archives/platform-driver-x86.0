Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F08CDC432BE
	for <platform-driver-x86@archiver.kernel.org>; Thu, 26 Aug 2021 15:39:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C8DEC60F4A
	for <platform-driver-x86@archiver.kernel.org>; Thu, 26 Aug 2021 15:39:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240157AbhHZPkT (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 26 Aug 2021 11:40:19 -0400
Received: from mail-bn8nam11on2040.outbound.protection.outlook.com ([40.107.236.40]:63136
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230203AbhHZPkS (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 26 Aug 2021 11:40:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cWhBw7ZtuV9uOwJz7+BfyasX0o3iMR1/qWlIrBJooSxEZN4vhmiAmVobcoNDNNBAYcjgfCZeKcLSWEv504rmP96cN9hM4ZZtW8O35cdjQFoRDiG7g0fz5ssIH/HIi+oHf2fuTUrmWMBcGa0cy6Zw1UBF0054UxOhz2Q82ooZ/E5FhfyMqHPELyo/AHe/xzy5CEJ0M2I69Wmq8urfNZ9nuEK4i2nRJbWj7rlNLHcnHqA4rrJI/X8Rc96zMblmbZyH84T4oVtglRfk9lXUpnezc4wGZz39baEN4HQ1ibMdpqFSxlcwEoobIaWzdbqpN6gG/uO9SSST2/mwWlGvaRCSVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vzYBTWUT4USGDjmAkFqJ73mV9h2qoXaWg3BCa7fjZdM=;
 b=IK9rR271szsHXjJ+pJfsOGtNMMLHmxhAw2LNfzEAdkppR2+PL71VC+MGazVsACCYtxc7+3nJB5sTPgQ+hTKMjlWr3Ti0RvqV9XISY5oStcPMvljMB7/iyRtJZXFUaEa5N9WFYNHSe5elvAXN16RynRI5h2r+Wb4OKkKfJnW6rTxRaesWAaYI447bqfgZib90Vm4jWygWroybWg9KVLK2UKmBcF3BbKmmfFSQHj9i8U3jYe+yLzngwOYm1w5gJrt4Y2V1p4RJ/uqwaIJOyomkgAS0AfKB+wAE3H+fl8Xz8PHLoImGpDy6EYYHaRJL20Yu0alRV3CVDud8WCQkgRTreQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.36) smtp.rcpttodomain=infradead.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vzYBTWUT4USGDjmAkFqJ73mV9h2qoXaWg3BCa7fjZdM=;
 b=FT/OdyhEylgbpX3hXTaFnch1O7NIQL9+FcidVHvjR3bgwCTqVRyZzNXqkUzjgG5FRYx92avWbx+RZMe6B6HpBwoc0rjHm9pQTuGMEF14LxRaWE9xcWtLQPr1D/Pvjk3UEyiNVsneXVIzwldG68mVgGxDDk0u1rI4xhHjUAQtWo1vEjbSNkFxuKg7T+TfGmVmYGch+kYAiUgF5IHeogqTvwFT4xD82fD2bM/aHrAv4103JRigV86JpNwN30BWgjy8eCcNTAeBhyLG3QEHh/JOEPY3QpZVqave0QcyzBdSyMstqUWjydDpmNY+Zq+Xdz1c6hWVUtqBeqg6ywd44DfEjA==
Received: from CO2PR07CA0060.namprd07.prod.outlook.com (2603:10b6:100::28) by
 BY5PR12MB3828.namprd12.prod.outlook.com (2603:10b6:a03:1a4::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20; Thu, 26 Aug
 2021 15:39:22 +0000
Received: from CO1NAM11FT031.eop-nam11.prod.protection.outlook.com
 (2603:10b6:100:0:cafe::cf) by CO2PR07CA0060.outlook.office365.com
 (2603:10b6:100::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.18 via Frontend
 Transport; Thu, 26 Aug 2021 15:39:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.36)
 smtp.mailfrom=nvidia.com; infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.36 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.36; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.36) by
 CO1NAM11FT031.mail.protection.outlook.com (10.13.174.118) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4457.17 via Frontend Transport; Thu, 26 Aug 2021 15:39:21 +0000
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 26 Aug
 2021 15:39:21 +0000
Received: from [10.20.22.154] (172.20.187.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 26 Aug
 2021 15:39:19 +0000
Subject: Re: [PATCH v3] platform/x86: Add driver for ACPI WMAA EC-based
 backlight control
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     Platform Driver <platform-driver-x86@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        <mario.limonciello@outlook.com>, <pobrn@protonmail.org>,
        Andy Shevchenko <andy@infradead.org>,
        Darren Hart <dvhart@infradead.org>,
        Aaron Plattner <aplattner@nvidia.com>
References: <877ae34b-dcbb-a0a4-7d76-d9d78d12fd00@redhat.com>
 <20210824220437.14175-1-ddadap@nvidia.com>
 <CAHp75VfjSrq7vF=ry1dTHJWbKLF9AqK8kZbddO-1A3FQ5pCvhQ@mail.gmail.com>
 <b22b0882-e54c-3168-2cbd-842f2ba51c90@nvidia.com>
 <CAHp75Vc91V=HU22cih_p3vy3o_2nbyrqQb25_TP5a+YigFsfbQ@mail.gmail.com>
From:   Daniel Dadap <ddadap@nvidia.com>
Message-ID: <70b81e33-c769-4cb8-0bae-5ee10a209389@nvidia.com>
Date:   Thu, 26 Aug 2021 10:39:17 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAHp75Vc91V=HU22cih_p3vy3o_2nbyrqQb25_TP5a+YigFsfbQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a62c8525-e7b4-4e28-4aba-08d968a7acfa
X-MS-TrafficTypeDiagnostic: BY5PR12MB3828:
X-Microsoft-Antispam-PRVS: <BY5PR12MB3828388C7CD824D34FA01D7FBCC79@BY5PR12MB3828.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DEyJ2ORs7hu8DXuMovD88DOXDf+UaT8LJOzgCWzInEIkRWv68e0susJBi65KPwWrhi6IBI7gt/Z7fBQ9rPB9GJK8ayvzm8dR7PnpoGITqGJGFD0bZHFUQT07DctPvajR1bN1EW98qO79mPfflmtmvM7EePJDgG9nrRsuFk0fMacXhg2W0pE0VJpL9BZYEiwcALiKuvA1sjUUFXb87Lz0TGc7g25zRYKrBQBsznvSyWDpqiYCpaTh/HNcYdMW+ya0hyFLrD4IJqzCT3V1RpgQk0ZOGXs2lAL7wMZwF7s0Yec8IvuzHPSt94WdgH4ZIEBrtnMcNxt/dwF8vG6yWSQ/v6ONJvq1oiGC3cSiKDFAYq9XkQv2leo+/Kndx4AceMsKH3fEn0Yn7eCQ68ckKyVyNNqjGdrcjqArlRX/jwlPgUPJexDN8OVv6DZ+g39FnXwCt58ivm2fZvUw+u1O0utWSCjukmKu3tbALVc7snBY+XIyZhl2cFZtq/sbaxTqwLQ7iQDwG/XeuMQ4w8eZibclBfWo4vBYfXg+CzdpZ7E/cemJU+eFDSHa4lpp4tYHm624qjcK0dZbAVdBVn1bU++0PwObHfWKvZTBR61nmX+1H18Qps4KfacSsfu0VTcLqMicVrfS/LEREF4cbCsXwiT2au/EZTrZ3xoRNGgLU5y7+NtjNeuq1/EyDu4HJwrbYGFRlBb0RQy0W5cnFqa7q5UoRk7JpqbMEM2VJhorSuNbabA=
X-Forefront-Antispam-Report: CIP:216.228.112.36;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid05.nvidia.com;CAT:NONE;SFS:(4636009)(396003)(39860400002)(136003)(376002)(346002)(36840700001)(54906003)(16576012)(316002)(8936002)(107886003)(336012)(6916009)(5660300002)(2616005)(36906005)(16526019)(8676002)(86362001)(426003)(186003)(70206006)(70586007)(31696002)(26005)(83380400001)(36860700001)(36756003)(2906002)(82310400003)(32650700002)(82740400003)(53546011)(356005)(478600001)(4326008)(31686004)(7636003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 15:39:21.9347
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a62c8525-e7b4-4e28-4aba-08d968a7acfa
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.36];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT031.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3828
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org


On 8/26/21 8:35 AM, Andy Shevchenko wrote:
> On Wed, Aug 25, 2021 at 7:48 PM Daniel Dadap <ddadap@nvidia.com> wrote:
>> On 8/25/21 4:05 AM, Andy Shevchenko wrote:
>>> On Wed, Aug 25, 2021 at 1:09 AM Daniel Dadap <ddadap@nvidia.com> wrote:
> ...
>
>>>> +struct wmaa_args {
>>>> +       u32 set;
>>>> +       u32 val;
>>>> +       u32 ret;
>>>> +       u32 ignored[3];
>>>> +};
>>> I guess this structure deserves a kernel doc.
>> Do you have a recommended location? From a quick skim I didn't see any
>> document in Documentation/ that seemed most appropriate to add this to.
> It's in a form of the comment on top of the data structure
>
> /**
>   * struct wmaa_args ....
>   * ...
>   */
>
> ...


Ah, of course. Sorry for misunderstanding.


>>>> +       WARN_ON(ret != 0);
>>> Why?
>> To differentiate a 0 because the level is actually 0 versus a 0 because
>> there was an error. The backlight device API doesn't seem to have a way
>> to report errors.
> I meant why do you need WARN_ON() here? This kind of stuff must be justified.


Thanks, I see what you mean now. I'll change it to a dev_warn() or maybe 
even a dev_err(), since if the ACPI call does fail there probably is 
something quite amiss.
