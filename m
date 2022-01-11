Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 888DCC433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue, 11 Jan 2022 19:34:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235945AbiAKTea (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 11 Jan 2022 14:34:30 -0500
Received: from mail1.bemta35.messagelabs.com ([67.219.250.113]:51545 "EHLO
        mail1.bemta35.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235731AbiAKTe3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 11 Jan 2022 14:34:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com;
        s=Selector; t=1641929669; i=@lenovo.com;
        bh=BqcA2l2VN5q1Va084uVY5l3XsGuqCqPqk8CKbx+vlAQ=;
        h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
         In-Reply-To:Content-Type:Content-Transfer-Encoding;
        b=I/VjEt0EHAAHJyL6tHo3c1gtR3XB9Nq/DTsaNeeeLG/iHF9dMMwk9wacs0r2N9fUF
         Z2bj5D9Hey10H9QiEBI+BIb9/gCtH4yi+IIE4Nv81IM3y1I7Kbyn7yMnAHEHntbyPF
         ZvZUUnqihFDBItps2FpirASN2gzj3u1LzZrCGNnNguNBEcnke7j8knDiDHeraxJxP8
         a/DPlRD757qzWz9E/PDTQy81OtORwFPWL4npxA4oKT/PO4MpZc9FneniMuKLHliBLz
         4jHeys0QbZ8clF/Cisikr1RDq5JCoCOHWCIP2uv/dySyp8PPU7+/ZnzDvHWnxSQvI/
         L8d/XdvkO1DBA==
Received: from [100.114.96.117] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-5.bemta.az-a.us-west-2.aws.ess.symcld.net id 08/F4-05076-5CBDDD16; Tue, 11 Jan 2022 19:34:29 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrPJsWRWlGSWpSXmKPExsWSoS9loHv09t1
  Eg0mTOCze7vvFYvHm+HQmi9mHbSxW73nB7MDicfnWOmaP3Qs+M3m833eVzePzJrkAlijWzLyk
  /IoE1oyPl1vYCl4IVrROS2xgvMXXxcjFwSiwlFniyubfLBDOIlaJ2W++QDmdTBKT591jB3GEB
  BYySeye8pmpi5ETyDnEJPGuNRUkISFwnFGi+9A6JoiqTkaJH69OsUA4E5kkmm/1skC0PGGUOH
  OBD8J+wCjR/6McxOYVsJX48X8ncxcjBweLgKrExlY3iLCgxMmZT1hAwqIC4RLXZqWAhIUF8iT
  uX1nHCmIzC4hL3HoyH+wgEYFyic7OQ+wQcU2JZ20djBCbiiUObNgPVsMmoC2xZcsvNhCbU8BO
  YunhPaww9a3bf0P1yktsfzuHGaJXWeJX/3mwyySA4q9fgJVLCCRI9Px7xAZhS0pcu3mBHcKWl
  Th6dg4LRLmvxNHzphCmrsTm/wIQFTkSL889hapWk9h3+R7zBEa9WUjenYXkr1lIbpuF5LYFjC
  yrGK2SijLTM0pyEzNzdA0NDHQNDU10Lc10TQz0Eqt0E/VKi3XLU4tLdI30EsuL9VKLi/WKK3O
  Tc1L08lJLNjECU1JKUYLGDsae/p96hxglOZiURHkZL99NFOJLyk+pzEgszogvKs1JLT7EKMPB
  oSTBu/QWUE6wKDU9tSItMweYHmHSEhw8SiK8p24CpXmLCxJzizPTIVKnGO05Jrycu4iZo6tnI
  ZC8+X4JkJx0ZPd2ZiGWvPy8VClx3kyQqQIgbRmleXBDYen8EqOslDAvIwMDgxBPQWpRbmYJqv
  wrRnEORiVh3pUgy3ky80rgdr8COosJ6KxkjtsgZ5UkIqSkGpjyt9tEKDZ/v9liprJTV0CqrD/
  EJemXOAvf4lMb+8Uj0sXiD7dIv/JpytXw+mR39W7vJ+u+jVOC3prXyK/KWvHrW88y4bJrt24J
  F60s+sP62HnioVD36J5UIQE7B4N7Bcxt3MvCb0quU5eNfFJ6vjtajbd51/JdlYsf8pUK/ziRk
  NWvclzkmdSLkC0yy/6de36z5uFZ5iN9WtN+fOixsnq1g98m+OkkD0nuHI6D5XekUoRvfD/81n
  /dHtYQFrWN9StU5d5aC+1+MWVa6AmWeVW/n/Pltc5RfCni5Op5fY3PhxtzRf9Y579TeJZvwiB
  2+EzLaj9Jp0UetWcUWjYf39CUWGzw09kqK2Tf+lnH0pVYijMSDbWYi4oTAYH9YEViBAAA
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-11.tower-655.messagelabs.com!1641929667!29639!1
X-Originating-IP: [104.47.26.48]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25135 invoked from network); 11 Jan 2022 19:34:28 -0000
Received: from mail-psaapc01lp2048.outbound.protection.outlook.com (HELO APC01-PSA-obe.outbound.protection.outlook.com) (104.47.26.48)
  by server-11.tower-655.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 11 Jan 2022 19:34:28 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MVJcROua5Wm3dEoZNx/Jrw18gCNLwqoqY9/TTONSMda6/ERcJjY0R3I8qK6RrnHUd5otcLMDZXD/UoDMjbbFMGwvBEySlUkZiYnsTkeoxCLpPl7QLCVMde2kGHtrQoxx+tlzIVkk8NkxTRWOvIcKUEKZAXBFI490o9xE8IjJkqxImex4LCQ++HrtbV6RMM/+HwGD19EMmYza6g0hgGsRtINdSjBgx/v+fesObY0NxZRDlk9NGTXGFHMpXUkMhpcvk/uZU16BiynymSm4DegLkMUxAtwEze0iTvDHgkiyrDCXX5x7KaQx+9IWV1AMVbSk19mbycArhZMqh7IhJ+t3Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BqcA2l2VN5q1Va084uVY5l3XsGuqCqPqk8CKbx+vlAQ=;
 b=HyRddMC395Wcgaxk3Wwmdd25Jw62jLqzBe85pK08pAjiFdPgoHmFhuhZqMc0RLVR3UwSfoJnnuO7y8m55YMD2ptCCdOY4beiRvWUcykIe52hMkVQg39bVlsaYTRw8Qw/6jPDm/iWIN7fhAFFK78qZ/k41VN5iDyeGaMQOHTNHoxTgC4KmSqRAsGPQAlwzyUUTsN9TBNBWECdP0eDbVgpdZrkvy0/tT4PML8jE8m5+eXu2VHAjpuoLiDHTgu8mvPyquLgIy8zN0tjjqC/4ttszG05CKK6hjRYaD/jHOGb2AVPyGV7TFJ5x4SlCw7lkekq8VnuErJ1NurS4UjEqOFjZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 104.232.225.7) smtp.rcpttodomain=redhat.com smtp.mailfrom=lenovo.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=lenovo.com;
 dkim=none (message not signed); arc=none
Received: from PS1PR01CA0001.apcprd01.prod.exchangelabs.com
 (2603:1096:300:75::13) by TYZPR03MB5312.apcprd03.prod.outlook.com
 (2603:1096:405:7::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.4; Tue, 11 Jan
 2022 19:34:25 +0000
Received: from HK2APC01FT058.eop-APC01.prod.protection.outlook.com
 (2603:1096:300:75:cafe::c4) by PS1PR01CA0001.outlook.office365.com
 (2603:1096:300:75::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9 via Frontend
 Transport; Tue, 11 Jan 2022 19:34:25 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 104.232.225.7) smtp.mailfrom=lenovo.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=lenovo.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 lenovo.com discourages use of 104.232.225.7 as permitted sender)
Received: from mail.lenovo.com (104.232.225.7) by
 HK2APC01FT058.mail.protection.outlook.com (10.152.249.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4867.9 via Frontend Transport; Tue, 11 Jan 2022 19:34:24 +0000
Received: from reswpmail01.lenovo.com (10.62.32.20) by mail.lenovo.com
 (10.62.123.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.20; Tue, 11 Jan
 2022 14:34:22 -0500
Received: from [10.38.60.38] (10.38.60.38) by reswpmail01.lenovo.com
 (10.62.32.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.20; Tue, 11 Jan
 2022 14:34:22 -0500
Message-ID: <861b7611-63d6-d15c-0aef-2082590aa5b9@lenovo.com>
Date:   Tue, 11 Jan 2022 14:34:20 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [External] Re: [PATCH] Update whitelisted ThinkPad models with
 dual fan support in thinkpad_acpi
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>,
        David Dreschner <david@dreschner.net>,
        <ibm-acpi-devel@lists.sourceforge.net>
CC:     <platform-driver-x86@vger.kernel.org>
References: <ec04aa1e-1ac3-edbc-ac08-eec15ec5c952@dreschner.net>
 <aceddce7-6c43-967c-fadd-fa307068e916@redhat.com>
From:   Mark Pearson <markpearson@lenovo.com>
In-Reply-To: <aceddce7-6c43-967c-fadd-fa307068e916@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.38.60.38]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail01.lenovo.com (10.62.32.20)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fb7d8c9e-7fdf-4e49-c915-08d9d5396020
X-MS-TrafficTypeDiagnostic: TYZPR03MB5312:EE_
X-Microsoft-Antispam-PRVS: <TYZPR03MB531286E8BFECED139AA84695C5519@TYZPR03MB5312.apcprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NHg52eCZENTq3n84y9Q0usfPLmAjNSO+DMxEdPpCxT841mW0HTTE1GZazmk6vx62n9z4J5YqPcZmSmI6HidrI8JEAk7iErOfvdwo/EhVzIKX4FGJ3P9S7jIvR89V7b7SuMG0uBZzr+eQhMHucAvrKwjoxFOhWsT6Ne+c0jcEt2cgJ6ERI2HNYy/mxSze7wy4CCsGOvwymZRgtZuPM+Wn5wFRyrxJdxImwKTD4LlZP3mlfBObVvbuDhEpP3xh06IBkEkCyrRKqEZyZyXd00oshqCbfwCp9PBJNjEBXLOW3qyflz+F+kJFCHwfV72AYyK9aEdJ/DEShfs3dDTP4R0F7jXtSFpDkpW297kAGKo34lfTWE4fgv1SBcnmUZ4cGN9Tkv04WtZv7gz48U5waI83ooNUEhJvnMRsVjCZEJC8XB/1xlqyK2F7jR76ZY3RdvaA393yljdc+0XfAHrRj7YypTGzMhOVwo1A0CtjuGhMYKA+pym3soY0Oq8IPKbgWeig040QL1E7/rdNsufKBQWcHSnkRXVV3FcyEa9Aams6sdbRPcTew29xntVTGFppLYrkIwsS1JEeAursHAjYuWm1biQ/YApertm6Z+02iFJsO/B0d4i3ZYQGKNDs/+ef60zS2bBwXc/oiIoceocqy004xOmiHvldAmBsG6Hlc5MR6o2Q3iD05cVLH/Thq6aFrcrH1pEgX/hnoss5t1pk6At5XTlqPeEiGQ/uGcte/9v8fpzY2KrKgLqmPpdZEcTzxUgtT9kEqa/NKtuUOD0X6G1orTRRjpCrh/6w26hVm4tW/4yvT/R4pcsDtjHkC0o6G4DebMJp+0BQ/ALPl+lf64c+dPqa7vVIL1fbVETRtzViC2WKvv1mOmW2ERzFlFCpdOLa5QMyMRLEy7sS8eew5C1/fw==
X-Forefront-Antispam-Report: CIP:104.232.225.7;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.lenovo.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700002)(70206006)(70586007)(2616005)(336012)(316002)(16526019)(86362001)(26005)(186003)(508600001)(4326008)(426003)(36906005)(31696002)(966005)(81166007)(356005)(53546011)(83380400001)(2906002)(8676002)(8936002)(16576012)(40460700001)(47076005)(82310400004)(110136005)(15650500001)(36860700001)(82960400001)(36756003)(31686004)(5660300002)(3940600001)(36900700001)(43740500002)(20210929001);DIR:OUT;SFP:1102;
X-OriginatorOrg: lenovo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2022 19:34:24.7405
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb7d8c9e-7fdf-4e49-c915-08d9d5396020
X-MS-Exchange-CrossTenant-Id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5c7d0b28-bdf8-410c-aa93-4df372b16203;Ip=[104.232.225.7];Helo=[mail.lenovo.com]
X-MS-Exchange-CrossTenant-AuthSource: HK2APC01FT058.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB5312
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Hans

On 2022-01-11 06:09, Hans de Goede wrote:
> Hi David,
> 
> On 1/4/22 04:41, David Dreschner wrote:
>> Hey guys,
>>
>> the attached patch updates the list of whitelisted ThinkPad models with dual fan support.
>>
>> The changes were tested on my ThinkPad T15g Gen 2. According to Lenovo, the BIOS version is the same for the P15 Gen 2 and the P17 Gen 2 ( https://pcsupport.lenovo.com/us/en/downloads/ds551321-bios-update-utility-bootable-cd-for-windows-10-64-bit-thinkpad-p15-gen-2-p17-gen-2-t15g-gen-2 ).
>>
>> I also added the P15v Gen 2 and T15p Gen 2 to the whitelist based on the BIOS version listed on the Lenovo homepage ( https://pcsupport.lenovo.com/us/en/downloads/ds551356-bios-update-utility-bootable-cd-for-windows-10-64-bit-thinkpad-p15v-gen-2-t15p-gen-2 ). The first generation had two fans and where covered by the whitelist entry for the P15 Gen 2. As the second generation has two fans, too, I made that change for completeness.
>>
>> To apply the changes before it's merged in the mainline linux kernel, I made a little dkms patch: https://github.com/dreschner/thinkpad_acpi-dual-fan-patch>> 
> Thank you for your patch submission.
> 
> If I understand things correctly then you've only tested the addition of the:
> 
> TPACPI_Q_LNV3('N', '3', '7', TPACPI_FAN_2CTL),  /* P15 / P17 / T15g (2nd gen) */
> 
> quirk, correct? In that case we really only want to add that quirk, we don't
> want to go and add untested quirks. But perhaps Mark from Lenovo can confirm
> that this quirk:
> 
> TPACPI_Q_LNV3('N', '3', '8', TPACPI_FAN_2CTL),  /* P15v / T15p (2nd gen) */
> 
> also is correct and that those models really have 2 fans, Mark ?
> 
> Mark, more in general can you perhaps talk to the firmware team and ask
> if there is a better way to detect if there are 2 fans in a thinkpad then
> maintaining a quirk table for this ?
> 

Yeah - I saw the patch and wondered the same. I will look into that
(LO-1498 for my internal tracking)

We recently fixed this for the P1G4 and I asked for that to be extended
to the other platforms and I don't think it was done :( If you don't mind
holding off for a couple of days (while the patch gets cleaned up) I'll
see if I can get confirmation in the short term of which platforms are
impacted (LO-1499)

Thanks
Mark

