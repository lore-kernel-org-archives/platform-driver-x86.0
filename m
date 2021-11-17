Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB1AAC433F5
	for <platform-driver-x86@archiver.kernel.org>; Wed, 17 Nov 2021 15:21:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A89D861BF8
	for <platform-driver-x86@archiver.kernel.org>; Wed, 17 Nov 2021 15:21:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231504AbhKQPYE (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 17 Nov 2021 10:24:04 -0500
Received: from mail1.bemta33.messagelabs.com ([67.219.247.3]:37195 "EHLO
        mail1.bemta33.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231338AbhKQPYD (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 17 Nov 2021 10:24:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com;
        s=Selector; t=1637162464; i=@lenovo.com;
        bh=HuG8wZ1KcRY2fcGV4nLxbBQZ0phdZ+Qqm3vKXuGYQmo=;
        h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
         In-Reply-To:Content-Type:Content-Transfer-Encoding;
        b=YTq9C1zAcG4ZnnPUcffTJoxBPIA0T4q43Ko+CyS5K8SB5kwcSzoCIUMi5qKf275B+
         9OIzN4RHqqnyz/dGwaFvy+iNuWWyQp6nATcv4Jd8EQY7QWiKkOlEjoPgBCdkXp69sc
         MOIDfSjsEKv5VvqAhviM5ztHPLtJ4RzK0fSFsrjkI4mJjrgnlKPqEbP8nABrSOcJZi
         qtsSbzGKhLfaSAvEp1c7g5xEdoZWqiE6+7ErxsJTAPPFLqO/U6qGJb0dkA/yOaLlOn
         AlBgMm9+MEIQ64wAlaceiOyEUfZ4dOgHi1nDQDRwd4m3MVNLUrYQkutsEkeCR9DXm5
         TikyUw/xF4+1A==
Received: from [100.114.65.29] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-3.bemta.az-a.us-east-2.aws.ess.symcld.net id 31/2C-12927-0ED15916; Wed, 17 Nov 2021 15:21:04 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCJsWRWlGSWpSXmKPExsWSoS+lr3tfdmq
  iwcfZphZvjk9nsvjcMZnFYvWeF8wOzB7zTgZ6vN93lc3j8ya5AOYo1sy8pPyKBNaMq9f2sxcc
  k6u49LGHuYHxuUQXIycHo8BSZol1c7y7GLmA7EWsEh9v3GWCcDqZJCbPu8cO4ggJzGaSaH94i
  QnCOcAk8f72VzYQR0LgOKNE96F1UJlORokfr06xgEwWEpjIJLFmQiVE4gmjxKV1s5ghnEeMEj
  vWPWcDqeIVsJXY3LYBrINFQFVifv9fZoi4oMTJmU+A4hwcogLhEg13ikFMYYFciQUfvEAqmAX
  EJW49mc8EYosIqEtM7ehhg4g7S0xqmcAGseo9o8Skm23sIAk2AW2JLVt+gRVxCthJzPrxlhmi
  QVOidftvdghbXmL72znMEA8oS/zqPw9mSwgoSDR96GGEsBMkev49YoOwJSWu3bzADmHLShw9O
  4cFwvaV6Jm2CiquJTHp6G6o+hyJ6796mUB+kQA6+v56/wmMerOQPDwLyWuzkFw3C8l1CxhZVj
  FaJRVlpmeU5CZm5ugaGhjoGhqa6JqZ6poY6iVW6SbqlRbrpiYWl+ga6SWWF+ulFhfrFVfmJue
  k6OWllmxiBCailCJHzR2Mb7780DvEKMnBpCTKG8s4NVGILyk/pTIjsTgjvqg0J7X4EKMMB4eS
  BO8EPqCcYFFqempFWmYOMCnCpCU4eJREePmBiVGIt7ggMbc4Mx0idYrRkmPCy7mLmDm6ehYCy
  UlHdm9nFmLJy89LlRLnnSYD1CAA0pBRmgc3Dpa4LzHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYF
  QS5jUCWcuTmVcCt/UV0EFMQAfJXp4MclBJIkJKqoHpwJY2F/OeO89m72Y73/tN/7mY/u5H8s6
  aUYdeVDUEpKp0vBacFRvirzJd6u7lumURm6707+Y9Vat28XDMh907ZH47/7738kJGfvLlF7FW
  n+690jbdbDn3g3rnylvNtQ+FKyzFGn9uEtp75Mpq3nW/Xk+MdpxvuUFQ4/ZxvgXh7wQtG56cM
  WlYcXD5Ph6Nix28uTPv/WqYr1GpJfLU2GuL9bZrP9f9MqiMfbvxNresL7v3myqP61lvkz7emr
  OI1T3Y6M3Om3+y5cqDT7S3czMn6X6rKjFfrcK3Vmr678WTgupnZT7byxh9+ZEnj/jzLOkJH9L
  zNK+0t6e8/uLqMe/49et/ptiKMO/b2KT1v+75SyWW4oxEQy3mouJEAIIIgiRXBAAA
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-16.tower-635.messagelabs.com!1637162462!405691!1
X-Originating-IP: [104.47.26.47]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29660 invoked from network); 17 Nov 2021 15:21:03 -0000
Received: from mail-psaapc01lp2047.outbound.protection.outlook.com (HELO APC01-PSA-obe.outbound.protection.outlook.com) (104.47.26.47)
  by server-16.tower-635.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Nov 2021 15:21:03 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iKaDsYnDUjK1G7yA8fXhJ4+dLmx1/E6yrrosJW+ATrxLXvInzGHRhDLEARnrKCKmRSYFtidez6Os/U+oUkCAVXSN3mU/dRXWkwHMoo5mt/YbjkJU1gQ+ZidqouutIXyG6CWtWey2DU5Pk51L9Oni/7hkSLmIYS/vBOsxYsu+3Tfp4pkYV5Jr0GcRxJnijLTash+40MOTESFcE3/RvZxhG3J7wIxZtMKGKM+ItpSlNCb2MNhC+IS2T1zXdzlHaUJFMlivgZlLzmOLwz4lrwRMjxUTfWepK+Ph7J3eOIlqrXtKeQ6l72oQ5ixlvbIvbHvDWTfC3CiJOAPzfKZ1Qw8d1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HuG8wZ1KcRY2fcGV4nLxbBQZ0phdZ+Qqm3vKXuGYQmo=;
 b=HaB5H8rBGqcwBsIvzhtQr0UUSIyWd/fYILP/F+q0eay+KUgY8DhrHXksz98WEFfrSFbKHAIOp2fSlInFyF9TOft+EnAMzqjI8CeJAPJBFzbcgKmN6aLE3ff8pJJQFg8mUAHYClKe2vTKAXleIcmdp5mZpyuobvQ4+mYxIGi8PPIj6Mj0wSjFUhX+tJc7WOfZlAtrU6GvJ/0fIwwLW82rGRFdwJwGAD4TNwG4vGUk1vUYbXOOqaqjTg2EnZ5rFQwXBvs8HYtu3jROXOJ3LUsBtZUY72lm3JsF1Mg6E6qUph7NnmtdFOY/iRRTO3XenOHqzxVSvVZuELd+kMcmkmiGrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 104.232.225.7) smtp.rcpttodomain=redhat.com smtp.mailfrom=lenovo.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=lenovo.com;
 dkim=none (message not signed); arc=none
Received: from SG2PR02CA0040.apcprd02.prod.outlook.com (2603:1096:3:18::28) by
 SI2PR03MB5595.apcprd03.prod.outlook.com (2603:1096:4:121::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.19; Wed, 17 Nov 2021 15:21:01 +0000
Received: from SG2APC01FT0062.eop-APC01.prod.protection.outlook.com
 (2603:1096:3:18:cafe::5e) by SG2PR02CA0040.outlook.office365.com
 (2603:1096:3:18::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Wed, 17 Nov 2021 15:21:01 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 104.232.225.7) smtp.mailfrom=lenovo.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=lenovo.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 lenovo.com discourages use of 104.232.225.7 as permitted sender)
Received: from mail.lenovo.com (104.232.225.7) by
 SG2APC01FT0062.mail.protection.outlook.com (10.13.36.171) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.19 via Frontend Transport; Wed, 17 Nov 2021 15:21:00 +0000
Received: from reswpmail01.lenovo.com (10.62.32.20) by mail.lenovo.com
 (10.62.123.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.20; Wed, 17 Nov
 2021 10:20:58 -0500
Received: from [10.38.110.13] (10.38.110.13) by reswpmail01.lenovo.com
 (10.62.32.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.20; Wed, 17 Nov
 2021 10:20:58 -0500
Message-ID: <60437371-a4aa-559b-d15a-90209fc310ae@lenovo.com>
Date:   Wed, 17 Nov 2021 10:20:57 -0500
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
 <d995857d-bdfe-2c35-f03b-1cee27139b7e@lenovo.com>
 <86e64a29-bb42-c75d-168d-df207adf785e@redhat.com>
From:   Mark Pearson <markpearson@lenovo.com>
In-Reply-To: <86e64a29-bb42-c75d-168d-df207adf785e@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.38.110.13]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail01.lenovo.com (10.62.32.20)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4d1866b3-ad8f-41cb-fe45-08d9a9dddd16
X-MS-TrafficTypeDiagnostic: SI2PR03MB5595:
X-Microsoft-Antispam-PRVS: <SI2PR03MB559589975682B52038F32EF9C59A9@SI2PR03MB5595.apcprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OOgGjxruzza4e/tubHwPP5W8uiYStvigLFve7e8Hhx6QlrrWEK13yEcinLVfiTeaVw6CV7hYfr/K2Giwb/EwuCLoBXVfPXBrvT7a6wYJh1VYtH+0vnJ+1JEzUaeXomRPZCRfSnSsNgbN63v5iMxzdNQGhc+2awFP1sq5KdSJOQbDoP65sHsTeZxfV7suDaWxxXOtYvJMuUTvK/f8lH41ifV4k74xIScK4+cKizTtHMVAYmwCJqCWbtkH+naKQ22vKBED+ZyoInCjZ5pFRdGvVCzfdTfA5tykzUI9/0U/ZtjSV2ceZRT2GAy9viUpuPd6uNyIhuVBBcoUONZ0lsEZGHr/pIY+Mjl9DJAw5XWlJCvr0J3SwJ2d0f0bPbtLiBUarbxM4cerJ1vwwDk4GoYxGsdVaEEbNvccuS8yHSPoo3ilrxTt3pRskLkPEAadzyX1nM0bZQOZlSsMalAYCPsuQRdX5R2bUWys1RD3OXPHtLCgES/3wdSGPnOutRD1L+nyfxxTv8ezKylBDvzNYSeTgRGg7FdGQmpfg5XRpypkIW1JmvbkdWrhD8pvoiE+zcynH9LbgUUg5K8ilAC5UffH9bbxLESyr7LYQSFlEjD6GXV1Tcz7Lfi1fF9s5Gekbs9EjRFX4VFEAg8jyP5VOAfmTcRMYSbxAuhIgRIgLgf0gbl/HfXad2Y05NjBPd9RHBGzesgu8/39Xk4Xcg5jfly9m0QAgphIxz/dEw0HIRdHPYM9JMdELi6urcQDCAVk0LkiDSX8kJCgByP2ajyyV/zeOfDzACI/H3rHMr66PfQ1Ge8=
X-Forefront-Antispam-Report: CIP:104.232.225.7;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.lenovo.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(356005)(8936002)(81166007)(31696002)(186003)(82960400001)(26005)(70586007)(70206006)(83380400001)(4001150100001)(47076005)(53546011)(16526019)(36860700001)(16576012)(36756003)(54906003)(86362001)(31686004)(5660300002)(82310400003)(508600001)(2906002)(4326008)(6916009)(8676002)(316002)(426003)(336012)(2616005)(36906005)(3940600001)(36900700001)(43740500002);DIR:OUT;SFP:1102;
X-OriginatorOrg: lenovo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2021 15:21:00.6407
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d1866b3-ad8f-41cb-fe45-08d9a9dddd16
X-MS-Exchange-CrossTenant-Id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5c7d0b28-bdf8-410c-aa93-4df372b16203;Ip=[104.232.225.7];Helo=[mail.lenovo.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2APC01FT0062.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB5595
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Hans,

On 2021-11-17 07:09, Hans de Goede wrote:
> Hi,
> 
> On 11/16/21 22:05, Mark Pearson wrote:
>>
>> Hi Hans,
>>
>> Thank you for the review.
>>
>> On 2021-11-16 09:00, Hans de Goede wrote:
>>> Hi,
>>>
>>> On 11/9/21 00:25, Mark Pearson wrote:
>>>> Newer Lenovo BIOS's have an opcode GUID support interface which provides
>>>>  - improved password setting control
>>>>  - ability to set System, hard drive and NVMe passwords
>>>>
>>>> Add the support for these new passwords, and the ability to select
>>>> user/master mode and the drive index.
>>>>
>>>> Signed-off-by: Mark Pearson <markpearson@lenovo.com>
>>>> ---
>>>>  .../ABI/testing/sysfs-class-firmware-attributes | 17 +++++++++++++++++
>>>>  1 file changed, 17 insertions(+)
>>>>
>>>> diff --git a/Documentation/ABI/testing/sysfs-class-firmware-attributes b/Documentation/ABI/testing/sysfs-class-firmware-attributes
>>>> index 3348bf80a37c..6af4c5cf3d47 100644
>>>> --- a/Documentation/ABI/testing/sysfs-class-firmware-attributes
>>>> +++ b/Documentation/ABI/testing/sysfs-class-firmware-attributes
>>>> @@ -161,6 +161,12 @@ Description:
>>>>  						power-on:
>>>>  							Representing a password required to use
>>>>  							the system
>>>> +						system-mgmt:
>>>> +							Representing System Management password
>>>
>>> What is the difference between the system-mgmt password and the bios-admin one ?
>>
>> Taken from the documentation but somewhat reformatted/edited for clarity
>>
>> bios-admin - You are prompted to enter a valid password each time you
>> try to enter the BIOS menu
>>
>> system-mgmt - You can enable the system management password to have the
>> same authority as the bios-admin password to control security related
>> features. You can customize the authority of the system management
>> password through the UEFI BIOS menu (SMP Access Control Policy)
> 
> Ok, so if I understand this correctly, then if both a bios-admin and
> a system-mgmt password are set then with the bios-admin option
> all options accept those on the "security settings" BIOS screen
> can be changed, and with the system-mgmt password everything can
> be changed, is that correct?
> 
Yes - that's my understanding.

> Also can you update the new text here to try and explain this
> somewhat ?
Will do

> 
> 
>>>> +						HDD:
>>>> +							Representing HDD password
>>>> +						NVMe:
>>>> +							Representing NVMe password
>>>>  
>>>>  		mechanism:
>>>>  					The means of authentication.  This attribute is mandatory.
>>>> @@ -185,6 +191,17 @@ Description:
>>>>  					A write only value that when used in tandem with
>>>>  					current_password will reset a system or admin password.
>>>>  
>>>> +		level:
>>>> +					Used with HDD and NVMe authentication to set 'user' or 'master'
>>>> +					privilege level
>>>> +					This attribute defaults to 'user' level
>>>
>>> What is the difference between user and master levels ?
>>
>> User: If a user hard disk password has been set, but no master hard disk
>> password has been, the user must enter the user hard disk password to
>> access files and applications on the hard disk drive.
>>
>> Master: The master hard disk password also requires a user hard disk
>> password. The master hard disk password is usually set and used by a
>> system administrator. It enables the administrator to access any hard
>> disk drive in a system like a master key. The administrator sets the
>> master password; then assigns a user password for each computer in the
>> network. The user can then change the user password as desired, but the
>> administrator still can get access by using the master password When a
>> master hard disk password is set, only the administrator can remove the
>> user hard disk password.
> 
> I understand, so like a master-key vs a normal key in a big office building.
Yes - good analogy
> 
> Can you update the new text here to try and explain this somewhat ?
Will do

Thanks!
Mark
