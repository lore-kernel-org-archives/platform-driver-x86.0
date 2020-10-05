Return-Path: <SRS0=eRQc=DM=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1F5EC4363A
	for <platform-driver-x86@archiver.kernel.org>; Mon,  5 Oct 2020 21:33:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A3A932080A
	for <platform-driver-x86@archiver.kernel.org>; Mon,  5 Oct 2020 21:33:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="Rvp65uOl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726604AbgJEVdV (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 5 Oct 2020 17:33:21 -0400
Received: from mx0a-002e3701.pphosted.com ([148.163.147.86]:14946 "EHLO
        mx0a-002e3701.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725616AbgJEVdU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 5 Oct 2020 17:33:20 -0400
Received: from pps.filterd (m0134421.ppops.net [127.0.0.1])
        by mx0b-002e3701.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 095LUA3I003716;
        Mon, 5 Oct 2020 21:32:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pps0720;
 bh=bPo/oilLNk8PElbv6boVEH1kRliIgPV/hpAyCnC+wBo=;
 b=Rvp65uOl0/i8WgFYk+u7G6415uExbLyRzQv8vGinW5U95bGKVqabsVoRJv6LtGoJzq7R
 WRTUp+LKckFOolZi32XubwbHhNnln8+uCpfXzyE6Jt7+Oj2s/EivA5ABxrniopcseEMo
 vMp2r1+aGozvIIvG0yoTZYT2J1XWxAbQEEUbDR77++sSPWzNmJ5XqmFa1aNIoSfb3eCc
 q3hTRLcVQMpdZ8mSjvROJBIl8BwHSnf7pB7k8P4R1qNmEyqVSnv3ELaL9/7lEmxMbF+j
 QoDiitaN1hmWqHIs7cw+O9TYRZKxcGwbt/Id0nfBpQWKe7aPUq8YYP6aenJXkL0POYfA fQ== 
Received: from g9t5009.houston.hpe.com (g9t5009.houston.hpe.com [15.241.48.73])
        by mx0b-002e3701.pphosted.com with ESMTP id 33y2nx681m-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 05 Oct 2020 21:32:41 +0000
Received: from g4t3433.houston.hpecorp.net (g4t3433.houston.hpecorp.net [16.208.49.245])
        by g9t5009.houston.hpe.com (Postfix) with ESMTP id C695358;
        Mon,  5 Oct 2020 21:32:40 +0000 (UTC)
Received: from [16.99.129.98] (unknown [16.99.129.98])
        by g4t3433.houston.hpecorp.net (Postfix) with ESMTP id 140CD46;
        Mon,  5 Oct 2020 21:32:39 +0000 (UTC)
Subject: Re: [PATCH v4 03/13] x86/platform/uv: Adjust references in UV kernel
 modules
To:     Borislav Petkov <bp@alien8.de>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, x86@kernel.org,
        Steve Wahl <steve.wahl@hpe.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Andy Lutomirski <luto@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Dimitri Sivanich <dimitri.sivanich@hpe.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Russ Anderson <russ.anderson@hpe.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Alexandre Chartre <alexandre.chartre@oracle.com>,
        Jian Cai <caij2003@gmail.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20201005203929.148656-1-mike.travis@hpe.com>
 <20201005203929.148656-4-mike.travis@hpe.com>
 <20201005211611.GK21151@zn.tnic>
From:   Mike Travis <mike.travis@hpe.com>
Message-ID: <7598f508-6c4a-f1df-f83f-2f68bc99578f@hpe.com>
Date:   Mon, 5 Oct 2020 14:32:38 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20201005211611.GK21151@zn.tnic>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-10-05_16:2020-10-05,2020-10-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 mlxscore=0 priorityscore=1501 impostorscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2010050152
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org



On 10/5/2020 2:16 PM, Borislav Petkov wrote:
> On Mon, Oct 05, 2020 at 03:39:19PM -0500, Mike Travis wrote:
>> Make a small symbol change (is_uv() ==> is_uv_sys()) to accommodate a
>> change in the uv_mmrs.h file (is_uv() is the new arch selector function).
>>
>> Signed-off-by: Mike Travis <mike.travis@hpe.com>
>> Reviewed-by: Dimitri Sivanich <dimitri.sivanich@hpe.com>
>> Reviewed-by: Steve Wahl <steve.wahl@hpe.com>
>> ---
>>   drivers/misc/sgi-xp/xp.h            | 8 ++++----
>>   drivers/misc/sgi-xp/xp_main.c       | 4 ++--
>>   drivers/misc/sgi-xp/xp_uv.c         | 6 ++++--
>>   drivers/misc/sgi-xp/xpc_main.c      | 6 +++---
>>   drivers/misc/sgi-xp/xpc_partition.c | 2 +-
>>   drivers/misc/sgi-xp/xpnet.c         | 2 +-
>>   6 files changed, 15 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/misc/sgi-xp/xp.h b/drivers/misc/sgi-xp/xp.h
>> index 06469b12aced..0af267baf031 100644
>> --- a/drivers/misc/sgi-xp/xp.h
>> +++ b/drivers/misc/sgi-xp/xp.h
>> @@ -17,11 +17,11 @@
>>   
>>   #if defined CONFIG_X86_UV || defined CONFIG_IA64_SGI_UV
>>   #include <asm/uv/uv.h>
>> -#define is_uv()		is_uv_system()
>> +#define is_uv_sys()		is_uv_system()
> 
> Do I see it correctly that you can simply use is_uv_system() directly
> instead of this macro indirection?

Yes, there was the MACRO is_uv() that conflicted with the automated 
"generate uv_mmrs.h" PERL script that also uses it that I changed.  I 
see now maybe just getting rid of the entire thing in this file might 
have been better?

