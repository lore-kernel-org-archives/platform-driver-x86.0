From: Kyle Evans <kvans32@gmail.com>
Subject: Re: [PATCHv3] hp-wmi: limit hotkey enable
Date: Thu, 10 Sep 2015 14:47:21 -0500
Message-ID: <55F1DE49.60405@gmail.com>
References: <1438959360-20901-1-git-send-email-kvans32@gmail.com> <20150828184228.GA64484@vmdeb7> <55E1CF30.10501@gmail.com> <20150906180339.GC90062@vmdeb7> <55EF2913.2090902@gmail.com> <20150908202232.GD90062@vmdeb7> <55F09762.3070101@gmail.com> <20150910030330.GE90062@vmdeb7> <55F1B391.7020601@gmail.com> <20150910174658.GD113820@vmdeb7>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qg0-f52.google.com ([209.85.192.52]:35266 "EHLO
	mail-qg0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752829AbbIJTr1 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 10 Sep 2015 15:47:27 -0400
Received: by qgt47 with SMTP id 47so45027590qgt.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 10 Sep 2015 12:47:27 -0700 (PDT)
In-Reply-To: <20150910174658.GD113820@vmdeb7>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, Rafael Wysocki <rjw@rjwysocki.net>

On 09/10/2015 12:46 PM, Darren Hart wrote:
> On Thu, Sep 10, 2015 at 11:45:05AM -0500, Kyle Evans wrote:
>>  From 0e2c0ae37e1fbc326c54a60b2845eb0c7566d389 Mon Sep 17 00:00:00 2001
>> From: Kyle Evans <kvans32@gmail.com>
>> Date: Tue, 1 Sep 2015 18:50:45 -0500
>> Subject: [PATCH] hp-wmi: limit hotkey enable
>>
>> Do not write initialize magic on systems that do not have
>> feature query 0xb. Fixes Bug #82451.
>>
>> Redefine FEATURE_QUERY to align with 0xb and FEATURE2 with 0xd
>> for code clearity.
>>
>> Add a new test function, hp_wmi_bios_2008_later() & simplify
>> hp_wmi_bios_2009_later(), which fixes a bug in cases where
>> an improper value is returned. May also fix Bug #69131.
>>
>> Signed-off-by: Kyle Evans <kvans32@gmail.com>
>
> Thanks Kyle,
>
> I think this looks much better. Unfortunately, it doesn't apply to either Linus'
> master nor my for-next branch, with all 3 hunks failing even with the more
> forgiving manual patch application. Please check your base and regenerate based
> on either Linus' master (the usual approach) or my for-next branch.
>

Please try my v4 patch. It is based on 4.3-rc1.

b8889c4fc6ba03e289cec6a4d692f6f080a55e53
