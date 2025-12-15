Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8ABC326D4F;
	Mon, 15 Dec 2025 19:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765828798; cv=none; b=WDcneqI3ygRSLIFw3UMyIlyKk8/x88FbDIf+eAP5heElY5ufz1LGVM1ezNCnl/pd703gLRE7qrH9ULht+f6f+kglcMvpN0SyjwN5mbdsfIE1B4WLbW8WS9sQY2WVtdDVJm6DKH+Hjt3P9sTDdtrsUWmEL3rrvFF3GWE+Wsn9ldE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765828798; c=relaxed/simple;
	bh=rzbucZYnky/1nbE1DeqbtEEVZh2TnDWbV7YyMAwHnnk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p68/q2zA32AboUJWTXidHJlIIXB1DSCrxic6kebJ1FIFCBsstIIFGx0p5N9rlzgTvmrnHgL3w6aLQvOMFcmhpB98Mc0YBhyVMelVIMLunJOb3X/HtQfcjOPK7YGhVXv7ECVpLgA1UiWViQVb+qqaCId3+6f9/GZu4S1LWzTtn38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=wV+ZMidI; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="wV+ZMidI"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=EYARaPVdzWHViObkEV/LsWXSgjvbNOKQU0+Tdo+jwlk=; b=wV+ZMidIPfxlaNoHpfeQqxmv+e
	SEQknuMjrxzmpn/HBc0PHr+vttYUHQCusXBt4AqJiT7zNX9kCkzlaWjAONspcoeHPVGTH8FNqxDKs
	tGJdkMx0XsShXVtlEQtPfgXajZdfvjQtbWbLRBDvY+4ic88mLds/cPQG2houWL5oUbFFU6M10KVbO
	pIdkozseNtNMg8eFqkMwmmtmdKKAcOqdExG82hP14Q/5NhzB5pZHPmUmSwofn1EF5RIF14QCo5939
	D+EsV90JhI7HzgbAJCJ92Z7cDVeF/bJlnlfU5cLSCfDy1HzhcbasPH1E5N+nKFO2q/F4GnA0UM5Df
	szk4I3Pg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVEjU-00000004CVh-3IDp;
	Mon, 15 Dec 2025 19:59:48 +0000
Message-ID: <272b0029-66ce-40b3-8f87-a24eee06f844@infradead.org>
Date: Mon, 15 Dec 2025 11:59:43 -0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/intel/vsec: correct kernel-doc comments
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
 "David E. Box" <david.e.box@linux.intel.com>,
 Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org
References: <20251214201959.2195863-1-rdunlap@infradead.org>
 <cac479ad-e258-fb20-8005-3155e4a7f901@linux.intel.com>
 <c6198da4-c596-4ed7-b4a4-f43046cca34c@infradead.org>
 <0a353eb3-094c-5c34-89e8-20e0678c1f94@linux.intel.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <0a353eb3-094c-5c34-89e8-20e0678c1f94@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 12/15/25 11:21 AM, Ilpo Järvinen wrote:
> On Mon, 15 Dec 2025, Randy Dunlap wrote:
> 
>> Hi Ilpo,
>>
>> On 12/15/25 6:10 AM, Ilpo Järvinen wrote:
>>> On Sun, 14 Dec 2025, Randy Dunlap wrote:
>>>
>>>> Fix kernel-doc warnings in intel_vsec.h to eliminate all kernel-doc
>>>> warnings:
>>>>
>>>> Warning: include/linux/intel_vsec.h:92 struct member 'read_telem' not
>>>>  described in 'pmt_callbacks'
>>>> Warning: include/linux/intel_vsec.h:146 expecting prototype for struct
>>>>  intel_sec_device.  Prototype was for struct intel_vsec_device instead
>>>> Warning: include/linux/intel_vsec.h:146 struct member 'priv_data_size'
>>>>  not described in 'intel_vsec_device'
>>>>
>>>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>>>> ---
>>>> Cc: David E. Box <david.e.box@linux.intel.com>
>>>> Cc: Hans de Goede <hansg@kernel.org>
>>>> Cc: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
>>>> Cc: platform-driver-x86@vger.kernel.org
>>>> ---
>>>>  include/linux/intel_vsec.h |    7 ++++---
>>>>  1 file changed, 4 insertions(+), 3 deletions(-)
>>>>
>>>> --- linux-next-20251201.orig/include/linux/intel_vsec.h
>>>> +++ linux-next-20251201/include/linux/intel_vsec.h
>>>> @@ -80,8 +80,8 @@ enum intel_vsec_quirks {
>>>>  
>>>>  /**
>>>>   * struct pmt_callbacks - Callback infrastructure for PMT devices
>>>> - * ->read_telem() when specified, called by client driver to access PMT data (instead
>>>> - * of direct copy).
>>>> + * @read_telem: when specified, called by client driver to access PMT
>>>> + * data (instead of direct copy).
>>>>   * @pdev:  PCI device reference for the callback's use
>>>>   * @guid:  ID of data to acccss
>>>>   * @data:  buffer for the data to be copied
>>>
>>> Is it correct for kerneldoc to have the rest as @pdev, @guid, etc.,
>>> they are parameters to the callback, not members of this struct?
>>
>> No, it's not correct. We get away with it in several kernel source files
>> because scripts/kernel-doc doesn't check/notice that.
>>
>> Would you prefer to have them there but without the leading '@' sign?
>> Or completely delete those lines?
>> IMO they are useful/informative, so I would rather not delete them.
> 
> Can we use some * * formatting trick to them as well as remove the @. I'm 
> not sure how kernel doc deals with formatting * * within the parameters 
> paragraph but if it works like in return formatting, I guess that would 
> seem like the most useful approach.
> 
> If it doesn't work, then just remove @, I think.

[testing]

The struct members are not formatted like Returns: formatting.

a. If I just drop the at-sign, the struct member descriptions all run
together, no breaks between them. Not acceptable IMO.

b. If I use "* *" before each struct member, the struct member
descriptions still run together but there is a "*" separator
character between them.

c. If I end each struct member description with a '.' (just one
leading '*'), the struct member descriptions run together but
there is an ending '.' between them.

d. If I use "* @member" for each struct member, kernel-doc seems
to ignore those lines completely. No output is produced for those
lines.

So I think we are down to using "* *" for each struct member or
using "* member: Description." so that there is a separator between
each struct member description. Do you have a preference?

Example for b:

       read_telem  when  specified,  called by client driver to access PMT data
                   (instead of direct copy).  * pdev:  PCI device reference for
                   the callback's use * guid:  ID of data  to  acccss  *  data:
                   buffer  for  the  data to be copied * off:   offset into the
                   requested buffer * count: size of buffer

Example for c:

       read_telem  when  specified,  called by client driver to access PMT data
                   (instead of direct copy).  pdev:  PCI device  reference  for
                   the  callback's  use.   guid:   ID of data to acccss.  data:
                   Buffer for the data to be copied.  off:    Offset  into  the
                   requested buffer.  count: Size of buffer.

Or we could just drop the patch if you don't care for any of these.

thanks.
-- 
~Randy

