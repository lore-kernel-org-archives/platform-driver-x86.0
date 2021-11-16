Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D256DC433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue, 16 Nov 2021 21:06:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B588561BF5
	for <platform-driver-x86@archiver.kernel.org>; Tue, 16 Nov 2021 21:06:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231961AbhKPVJW (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 16 Nov 2021 16:09:22 -0500
Received: from mail1.bemta24.messagelabs.com ([67.219.250.116]:21670 "EHLO
        mail1.bemta24.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229899AbhKPVJU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 16 Nov 2021 16:09:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com;
        s=Selector; t=1637096782; i=@lenovo.com;
        bh=D3Obeq7p4lx90VfpbBGFHli+y6gclWYEXrt1Thf9/tw=;
        h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
         In-Reply-To:Content-Type:Content-Transfer-Encoding;
        b=TrP1MbrpDmKON0CpMb9RExQlncyct+QZEbOdbPPU+ZzsMzOL1lFDkOyFKClORtKKV
         5gHtU9u2ekW0d/tBLNBsX1NZuwxop+DSl1dn44qBeEiDxgGOMGpQmL+zcHGw2+vnoY
         NuB5Wus4cXU+9J8Ao4hnImWeEsJ/Iun5jzDoo7/mtomFt1tnBX42tk+kDK/YcDDPNE
         fc7RIa0kfFEVW027RyY2B3RpDCsHLOx4ZDoMJZetKU88Iafm58MyCMvKn4jP0mK/mn
         cT0nR2UslqUOaUqeMMlguKZhbo5SUKe1Ow+MU5EQUVsYPLW6Mi2EZvRhduXVhbgSu7
         MsUzyaZR2yf8Q==
Received: from [100.112.134.194] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-5.bemta.az-b.us-west-2.aws.symcld.net id 32/47-02012-E4D14916; Tue, 16 Nov 2021 21:06:22 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEJsWRWlGSWpSXmKPExsWSoV9jqesnOyX
  R4Od2fos3x6czWXzumMxisXrPC2YHZo95JwM93u+7yubxeZNcAHMUa2ZeUn5FAmtG35Fm1oKN
  shUPnr5ibmA8J97FyMXBKLCUWeLtldfMEM4iVom1bS8YIZxOJolF3TPZQBwhgSVMEmeubGbvY
  uQEcg4zSazaYghiSwgcZ5ToXuUOUdTJKLF76w+ojglMEhtuPGGFcJ4wSpzaP5sFwnnAKPH35z
  yglRwcvAK2Emdn2oKMYhFQldi1bykTiM0rIChxcuYTFpASUYFwiYY7xSCmsECuxIIPXiAVzAL
  iEreezAerFhFQl5ja0cMGEXeWmNQygQ3iUKCDGg5zgthsAtoSW7b8AotzCthJLN57gBmiXlOi
  dftvdghbXmL72znMEL3KEr/6z4MdKQEUb5jJCfFvgkTPv0dsELakxLWbF9ghbFmJo2fnsEDYv
  hJLPhxlgWjVkli0NwginCMxbeFXdoiwusT99f4TGPVmIfl2FpK/ZiG5bRaS2xYwsqxitEgqyk
  zPKMlNzMzRNTQw0DU0NNI1NDYBsi31Eqt0k/RKi3XLU4tLdI30EsuL9Yorc5NzUvTyUks2MQK
  TT0pBW+4Oxo1vPugdYpTkYFIS5RV7ODlRiC8pP6UyI7E4I76oNCe1+BCjDAeHkgTvAq4piUKC
  RanpqRVpmTnARAiTluDgURLhZZACSvMWFyTmFmemQ6ROMepyTHg5dxGzEEtefl6qlDjvfWmgI
  gGQoozSPLgRsKR8iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5Iw71GQVTyZeSVwm14BHcEEdI
  Ts5ckgR5QkIqSkGpj0gtzzRZL0W8S+zJhnpXvL61tV2PrWVeu8DrEyb1ap+XxCa86ntY31h5O
  by/+5sm+R7+33iD97/Xjgyfbdny9lBT9kSRZQWnNfqj9tovejLVPVbXXfBT+7c2Vi9QpZzzmK
  QQ07MwvOxc9YPXfnjIJDe5+oW+xxejnpx2yT/udsZ/ds+KM/YWNDHZOd1ebI0MlB634LmaxOk
  DET5z6Sc997v+CF2PQJeiUrjV5eKDh9wriVccOkp+zNzm5/tgtVXajU0rp/aOMH/YlNy4VWZd
  7L6Fu7xsL+14zGRg1xxpMxTOqS6W9+dlyZZ+f/W4RBRtlA26+9yNbMQ+J548z5i7Y1JDAun5R
  42O0Ns491Z6gSS3FGoqEWc1FxIgCgP+XjRQQAAA==
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-20.tower-355.messagelabs.com!1637096781!44957!1
X-Originating-IP: [104.47.124.57]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16076 invoked from network); 16 Nov 2021 21:06:22 -0000
Received: from mail-hk2apc01lp2057.outbound.protection.outlook.com (HELO APC01-HK2-obe.outbound.protection.outlook.com) (104.47.124.57)
  by server-20.tower-355.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 16 Nov 2021 21:06:22 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GgONoyFwG+Sqfa3L8vEX2Swqu5QOPCLK82mww82UmoflKML91j8l8sWH4jdveqPdVUj88r/kbWTLNDRPnSbctkYH+lqCT54Eg4luYDentpkukMg7y0DzU2tB3t5MyyD2qIa2LorLam3z7HAJfzy8a+Q9FcDf14oz8GOxcA/im/TbQNEu3aYP+/HEvW3CtfvY8jv1jS15aFY2o2hkC/hLds/YSjUgTgIcocQxcjSBfjCRlz9/Wj5CQ5pWH32aH7yRgHNyHKeZALkt4/qQIuFTg0D0zJ/tG95rF8Jr8JpYbW3SjJTV5SyG+5uxDNDnzdwgvG7fOADr8aAKRWCPjzy0jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D3Obeq7p4lx90VfpbBGFHli+y6gclWYEXrt1Thf9/tw=;
 b=FgrtPSEjC/9AvidNoRi29UeIQifnr78gL9UocMlP9MOudv2fKvMoy7b2x03AfDsQpSRqoC6IykMN6/n7EWo9tl1XhRGjUflQAzTcjIq5nZZQYrcSszaft22lH25HK/xrGYmc4KLnbrWRmi8LHJ8PMQTvLj6MeBKp3KIuj9qIT5lZ7neRxNT+iTqpXF4XmExE8a3Cv52x3Ad11QzNFoAocUsVrbE68OLok6ucyZsBEa4v0CVIkJZLF29gMCUQdZrDlSNdwbWUlSI025sTndpKtORpFH881IIgeh3xRpJOO2DCYnpvqu9STAedOWNzIeVeeNSdqcr9PAcj9F4eGeMm9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 104.232.225.6) smtp.rcpttodomain=redhat.com smtp.mailfrom=lenovo.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=lenovo.com;
 dkim=none (message not signed); arc=none
Received: from PS2PR01CA0034.apcprd01.prod.exchangelabs.com
 (2603:1096:300:58::22) by TY2PR03MB3549.apcprd03.prod.outlook.com
 (2603:1096:404:36::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Tue, 16 Nov
 2021 21:06:19 +0000
Received: from PSAAPC01FT060.eop-APC01.prod.protection.outlook.com
 (2603:1096:300:58:cafe::70) by PS2PR01CA0034.outlook.office365.com
 (2603:1096:300:58::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15 via Frontend
 Transport; Tue, 16 Nov 2021 21:06:19 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 104.232.225.6) smtp.mailfrom=lenovo.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=lenovo.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 lenovo.com discourages use of 104.232.225.6 as permitted sender)
Received: from mail.lenovo.com (104.232.225.6) by
 PSAAPC01FT060.mail.protection.outlook.com (10.13.38.170) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.19 via Frontend Transport; Tue, 16 Nov 2021 21:06:18 +0000
Received: from reswpmail01.lenovo.com (10.62.32.20) by mail.lenovo.com
 (10.62.123.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.20; Tue, 16 Nov
 2021 16:05:47 -0500
Received: from [10.38.49.20] (10.38.49.20) by reswpmail01.lenovo.com
 (10.62.32.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.20; Tue, 16 Nov
 2021 16:05:46 -0500
Message-ID: <d995857d-bdfe-2c35-f03b-1cee27139b7e@lenovo.com>
Date:   Tue, 16 Nov 2021 16:05:45 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [External] Re: [PATCH 1/2] Documentation:
 syfs-class-firmware-attributes: Lenovo Opcode support
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>
CC:     <mgross@linux.intel.com>, <platform-driver-x86@vger.kernel.org>
References: <markpearson@lenovo.com>
 <20211108232533.211693-1-markpearson@lenovo.com>
 <11f38268-098a-c674-c3cd-d020a1719fae@redhat.com>
From:   Mark Pearson <markpearson@lenovo.com>
In-Reply-To: <11f38268-098a-c674-c3cd-d020a1719fae@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.38.49.20]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail01.lenovo.com (10.62.32.20)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b720b984-b722-436e-b0e3-08d9a944efb8
X-MS-TrafficTypeDiagnostic: TY2PR03MB3549:
X-Microsoft-Antispam-PRVS: <TY2PR03MB3549CA26980B34C148448CDEC5999@TY2PR03MB3549.apcprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2qoKt/jOB9Uh1JaAe45tqDSfu3FdXd0V+F+9XXqnDgba/mgMw1Yg/KDHY3ypxcEmsrtW/+CrqEq2XvnXrKAsQCHxf4atPaBCJVnMySpCEcDsYFK/uriTW+NkDTw8mNWsXl/BliNUR84bJWyxGXkAFd4GBTXEcHWvRDHkqo+cV3iY5LO0Mp8110A5ZFj2JbRmORGfzYIQ+z4kpzFMWChFU4aIbU86AKqVHPfTairXGCiY7U7799bxQGak93j/PHKE8hsGeDE0lpgu2+QdCKM6155jI3FDehl8zfvOQARGJyEY3IctOINGSCIAF/lZJsollbsQVvcV8Ad0/mf3PxWWpbvaPVHaB/AUC/M1bBf+hzv0J2I4MD8V90UY1qEucyJZKAMWVDYTSOw7QeT3q0NQgoTOaSUeMTl9BwVgclNITf1bxG/v6mxHrd2ROTOjXw7NIpwYRPI3IuoRLIjOImJ5H98hBSgCvAZkKMnvL18hoklfbMjxR6Qp8QsI2SDU4ngxzvhkZedbP2MDQffXPmZ8UYyZOYsl86nWZlq8wiek7xxqveslijaJZ2TEEaEnGcI1zKznMFxiuZiyyNkatZwDhT6GZkWcVMD9xCLzZLJdeNvV+3gi4P0vGnSjQCHnLJ0MGXwfSKiTEHbVbMYhCoko34ESs4Uws1mxoKf5YMsLBupXWv7JJyk3jxtKUSKSPeAjHgZ8rGMLu7mkYmAKLZTGfEm3+kXhnsNw2dWwiC8dDoM4+U5xDQ/Z8T/Fd9x1nu52JBLcJyTs21vAG2EzhytuXg1w29SlbtGnVPx0Sp3ddiY=
X-Forefront-Antispam-Report: CIP:104.232.225.6;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.lenovo.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(5660300002)(83380400001)(70586007)(70206006)(54906003)(8676002)(4001150100001)(82960400001)(53546011)(356005)(47076005)(31696002)(316002)(81166007)(36906005)(86362001)(2616005)(426003)(508600001)(31686004)(4326008)(6916009)(16576012)(8936002)(36756003)(36860700001)(82310400003)(16526019)(336012)(186003)(26005)(2906002)(3940600001)(43740500002)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: lenovo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2021 21:06:18.9891
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b720b984-b722-436e-b0e3-08d9a944efb8
X-MS-Exchange-CrossTenant-Id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5c7d0b28-bdf8-410c-aa93-4df372b16203;Ip=[104.232.225.6];Helo=[mail.lenovo.com]
X-MS-Exchange-CrossTenant-AuthSource: PSAAPC01FT060.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR03MB3549
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org


Hi Hans,

Thank you for the review.

On 2021-11-16 09:00, Hans de Goede wrote:
> Hi,
> 
> On 11/9/21 00:25, Mark Pearson wrote:
>> Newer Lenovo BIOS's have an opcode GUID support interface which provides
>>  - improved password setting control
>>  - ability to set System, hard drive and NVMe passwords
>>
>> Add the support for these new passwords, and the ability to select
>> user/master mode and the drive index.
>>
>> Signed-off-by: Mark Pearson <markpearson@lenovo.com>
>> ---
>>  .../ABI/testing/sysfs-class-firmware-attributes | 17 +++++++++++++++++
>>  1 file changed, 17 insertions(+)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-class-firmware-attributes b/Documentation/ABI/testing/sysfs-class-firmware-attributes
>> index 3348bf80a37c..6af4c5cf3d47 100644
>> --- a/Documentation/ABI/testing/sysfs-class-firmware-attributes
>> +++ b/Documentation/ABI/testing/sysfs-class-firmware-attributes
>> @@ -161,6 +161,12 @@ Description:
>>  						power-on:
>>  							Representing a password required to use
>>  							the system
>> +						system-mgmt:
>> +							Representing System Management password
> 
> What is the difference between the system-mgmt password and the bios-admin one ?

Taken from the documentation but somewhat reformatted/edited for clarity

bios-admin - You are prompted to enter a valid password each time you
try to enter the BIOS menu

system-mgmt - You can enable the system management password to have the
same authority as the bios-admin password to control security related
features. You can customize the authority of the system management
password through the UEFI BIOS menu (SMP Access Control Policy)

> 
>> +						HDD:
>> +							Representing HDD password
>> +						NVMe:
>> +							Representing NVMe password
>>  
>>  		mechanism:
>>  					The means of authentication.  This attribute is mandatory.
>> @@ -185,6 +191,17 @@ Description:
>>  					A write only value that when used in tandem with
>>  					current_password will reset a system or admin password.
>>  
>> +		level:
>> +					Used with HDD and NVMe authentication to set 'user' or 'master'
>> +					privilege level
>> +					This attribute defaults to 'user' level
> 
> What is the difference between user and master levels ?

User: If a user hard disk password has been set, but no master hard disk
password has been, the user must enter the user hard disk password to
access files and applications on the hard disk drive.

Master: The master hard disk password also requires a user hard disk
password. The master hard disk password is usually set and used by a
system administrator. It enables the administrator to access any hard
disk drive in a system like a master key. The administrator sets the
master password; then assigns a user password for each computer in the
network. The user can then change the user password as desired, but the
administrator still can get access by using the master password When a
master hard disk password is set, only the administrator can remove the
user hard disk password.
> 
>> +
>> +		index:
>> +					Used with HDD and NVME authentication to set the drive index
>> +					that is being referenced (e.g hdd0, hdd1 etc)
>> +					This attribute defaults to device 0.
>> +
>> +
>>  		Note, password management is session specific. If Admin password is set,
>>  		same password must be written into current_password file (required for
>>  		password-validation) and must be cleared once the session is over.
>>
> 
> 
> Also maybe all of this needs to be moved to the Lenovo specific section for now ?
> 
> If we then get other firmware APIs to set HDD / NVMe passwords we can try to re-use this
> and move it to the generic section (assuming we can make things fit ...) 
> 
Ah - good point. I will do that

Thanks
Mark

