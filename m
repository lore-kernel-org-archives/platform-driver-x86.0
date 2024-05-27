Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84FCF2232A
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 May 2024 09:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716803106; cv=none; b=EAIPKHTFINNMAeOybK3LU2cdjscR3dxyxyewyVFM0BPB0rGrg2E+2MmTvqeW9QYbAuTVLRs75lfWxEwYoAbFEtPQMN4BLUphI3UfdaK95ykfa1s+WzjASbJ4SSy4GWlT5hCmJXzBLUBUmYqjJvK/3YZZmWYY0bKEG06qJiW4sj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716803106; c=relaxed/simple;
	bh=ajIlVARNWFBS45rgoX8SBynNBGEBYEQIChuIB2GNy3I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S8QnSzSX3QbECJcjLcKTobjl55MrC0WVF5kUCKSGf+BauHyOBZ7CwTLiMXMzq4CtPjjkT3TOOqeUAuZGUCHlP2LR/WSWy2HwUyIG55irobkh8tozp4wBA3krvcAx1gyP05NecebHd3G9G8Hr9fyVQIcNfVA6q24pxHp7fE4WM+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fvY+JR2H; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fvY+JR2H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716803103;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WhjE/S57Z+nhCN0PTums6H3VahAvTgzu5AGhzz61ShY=;
	b=fvY+JR2HieBDG9xEeVT8Cv55Q7uTZ3w7L8Qgf+WNXY0uPtxZvwL30r6ivrr90AVA6LM1lo
	gpMfE3pPOPWdp0qXSiOokPiTFSCliAVxsBCuhPZTfygiIh7ImAjpiEumja7RJhSa8dmCMx
	S25r/h9IjTXoD3ghw/zNMY2s98q70pk=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-687-TvYG4oK9Poq5mvK39L-JkQ-1; Mon, 27 May 2024 05:45:00 -0400
X-MC-Unique: TvYG4oK9Poq5mvK39L-JkQ-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5785fc97facso1547692a12.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 May 2024 02:44:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716803099; x=1717407899;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WhjE/S57Z+nhCN0PTums6H3VahAvTgzu5AGhzz61ShY=;
        b=bSaO9HahHLffJiyDW04RQ9HtNv0maIk55nzs/ULB6eGEQuG+/pGSb/yKddKao7KdpS
         Ee6QdX9Mib7myd9HUYaRVQNWBSepUcoBpAAlWd5NpamGaYiGWmPvpGkn5CJyNe/dDCme
         XbRlHfsgvhkBsGxnOYYVMuvdUGUjURcjc+7ZNH1dAEWburDdtDn/XCWSJ5j+NeOn2T+q
         SPGR0PSSlFbZhSattIoCzsYM4FN6YpswOiKvRuTKgTUfiaU/ZDpWrOMNe0CETGaSBOLs
         msIfCWWoFHtd6OCXQmrm1HzWum6HqjwF+bk+ifahi7ijxdBu7+RMf/1SgIofuh72u3y9
         tNfQ==
X-Gm-Message-State: AOJu0YwoJB0BHgEhkG1zcju4VM9Iim18X8IcPQKK38SEP4DKRfiOOqse
	BCYK00ZDqI5QNEO64eaTv3LWIikevEbcAkL+URgyWk7z7AdHOAxNaVuCIzL9K05R+zMeAg/VhAX
	pFVvaGuKJl1IkTno9ohl6lKzlocZrS/j79ByB0TgryZqRZIBY40Nu8n4jtMEsD6AsAS9dflM=
X-Received: by 2002:a50:d498:0:b0:578:6c3e:3b8f with SMTP id 4fb4d7f45d1cf-5786c3e4351mr3550648a12.2.1716803098936;
        Mon, 27 May 2024 02:44:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrA2Chz1TPbwyve6XSpKizwgKD3vnKanmWXLbkys51kGEJAX4y0bd9l8Y90ySjtlGPqkjSDQ==
X-Received: by 2002:a50:d498:0:b0:578:6c3e:3b8f with SMTP id 4fb4d7f45d1cf-5786c3e4351mr3550633a12.2.1716803098573;
        Mon, 27 May 2024 02:44:58 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5785238dbd7sm5563312a12.32.2024.05.27.02.44.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 May 2024 02:44:58 -0700 (PDT)
Message-ID: <87d6550c-e66a-4787-8351-df0e840d7936@redhat.com>
Date: Mon, 27 May 2024 11:44:57 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform/x86: touchscreen_dmi: Add support for setting
 touchscreen properties from cmdline
To: Randy Dunlap <rdunlap@infradead.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>
Cc: platform-driver-x86@vger.kernel.org, Gregor Riepl <onitake@gmail.com>
References: <20240523143601.47555-1-hdegoede@redhat.com>
 <613dfc89-a849-4ae4-9396-4eb631c96fb4@infradead.org>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <613dfc89-a849-4ae4-9396-4eb631c96fb4@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 5/23/24 8:58 PM, Randy Dunlap wrote:
> Hi Hans,
> 
> On 5/23/24 7:36 AM, Hans de Goede wrote:
>>
>> Cc: Gregor Riepl <onitake@gmail.com>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>> Changes in v2:
>> - Refactor ts_data / ts_data_dmi handling a bit (addressing Andy's review)
>> - Accept hex/octal numbers (addressing Andy's review)
>> - Fix ts_parse_props return value (addressing Randy's review)
>> - Use ':' as separator instead of ',', ',' is used in "vendor,option" style
>>   property names, e.g. "silead,home-button"
>> - pr_warn() on invalid syntax since init/main.c does not do this
>> ---
>> Note assuming this gets favourable review(s) in a reasonable timeframe
>> I'm thinking about maybe even adding this to 6.10 as a fix since users
>> not being able to easily test Silead touchscreen settings has been an
>> issue for quite a while now. Without the cmdline option being used this
>> is a no-op so the chance of this causing regressions is close to 0.
>> ---
>>  .../admin-guide/kernel-parameters.txt         | 22 +++++
>>  drivers/platform/x86/touchscreen_dmi.c        | 81 ++++++++++++++++++-
>>  2 files changed, 99 insertions(+), 4 deletions(-)
> 
> The __setup() function return value and the documentation look good (well, a couple of nits
> in the documentation, but no big deal).
> 
>> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
>> index 396137ee018d..7ac315a7c0c7 100644
>> --- a/Documentation/admin-guide/kernel-parameters.txt
>> +++ b/Documentation/admin-guide/kernel-parameters.txt
>> @@ -1899,6 +1899,28 @@
>>  				Format:
>>  				<bus_id>,<clkrate>
>>  
> 
> I would use:
> 
>> +	i2c_touchscreen_props= [HW,ACPI,X86]
>> +			Set device-properties for ACPI enumerated I2C attached
> 
> 			                          ACPI-enumerated I2C-attached

Thank you, I have squashed in this suggestion while merging the patch into
my review-hans branch.

Regards,

Hans


> 
>> +			touchscreen, to e.g. fix coordinates of upside-down
>> +			mounted touchscreens. If you need this option please
>> +			submit a drivers/platform/x86/touchscreen_dmi.c patch
>> +			adding a DMI quirk for this.
>> +
>> +			Format:
>> +			<ACPI_HW_ID>:<prop_name>=<val>[:prop_name=val][:...]
>> +			Where <val> is one of:
>> +			Omit "=<val>" entirely	Set a boolean device-property
>> +			Unsigned number		Set a u32 device-property
>> +			Anything else		Set a string device-property
>> +
>> +			Examples (split over multiple lines):
>> +			i2c_touchscreen_props=GDIX1001:touchscreen-inverted-x:
>> +			touchscreen-inverted-y
>> +
>> +			i2c_touchscreen_props=MSSL1680:touchscreen-size-x=1920:
>> +			touchscreen-size-y=1080:touchscreen-inverted-y:
>> +			firmware-name=gsl1680-vendor-model.fw:silead,home-button
>> +
>>  	i8042.debug	[HW] Toggle i8042 debug mode
>>  	i8042.unmask_kbd_data
>>  			[HW] Enable printing of interrupt data from the KBD port
> 
> Thanks.

