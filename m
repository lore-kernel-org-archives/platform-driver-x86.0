Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F07211EF0A2
	for <platform-driver-x86@vger.kernel.org>; Wed, 30 Oct 2024 14:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730297821; cv=none; b=AJoi++9HtTaSCURTCBouBXKdhsblzuIPH1Bd5H5YQuwHQn4NFCzkV4Z8lqactv/G2YHgau3yiVMbi5oGXNsmfy3vaXSWeQYeKjNmJByZiG/qza5RwbwlA5+Pb1qmadSc3QhuzZS2mYMCeBsrT+0NlHR742g9QbLd84uAat1f77k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730297821; c=relaxed/simple;
	bh=emBaMnXHFsEFJaNPDftsqZ+5Gk4w9RSC62uoAF8ptfE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ALhxouU60JHz6B921AOAseTIOnUWZwU18Axy9BokT6qEa8d/ZNyWqAYkitlRAN3XExg5dEbw3Z16I2AhhgBhNtt/c3KExnI3+yGYMkW836w2yTsA+BtLUKYFVOP+TILsFHrAJgcq36gNjXR982Eausye0pgVDduh/rj3CICdFDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PjsTfcPs; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PjsTfcPs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730297817;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2kVt6Jf0mlrFlKgj91AyuwPJLKq+gBRTfZHaemWVr3Y=;
	b=PjsTfcPsPCOvLEXK29jefo6FnWqVARhzh02DLyoYsVqr2sDZDHEMn2jVZRGVe4VKpTTXCa
	1DbldhzAzcH7vOPxAGrUCE1nLVcu2ucls6+ENQRzP/7WmvCijoyJ3doCc9hqEYPoRpCcC/
	tXqrHBswpwtq9ULjQmT4PC5ET2ktraw=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-275-ea5GD1rOM_6DyfVwffBzMA-1; Wed, 30 Oct 2024 10:16:56 -0400
X-MC-Unique: ea5GD1rOM_6DyfVwffBzMA-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a99fc3e2285so424214766b.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 30 Oct 2024 07:16:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730297815; x=1730902615;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2kVt6Jf0mlrFlKgj91AyuwPJLKq+gBRTfZHaemWVr3Y=;
        b=GEe7zN3UT+JprT9L3AVqZLwvssJhuLnrN8DWCr9sckucV9/9KWrFQxZTmDhv1SrtiQ
         +rQXL8FVvZXSAZRnHW6EDDof+XCz7CBwvV6TMUeH2IUp7vf03WwKb4x2JSk1MkPYtl+q
         IxY5EJntqeEM4JVaZX+bXuhhuo0Lh5Nwx2INdfw4t5sxK49hqyg9lYhfanc5Ll9d9U4v
         zE+nLO9gefybPaUW3WjhoJPMX0HzkPtlwloPWspCzU0ZeIFczinayFIwmjKzAIoITKoy
         KDpX5Atua5jmENwZL0t/ENM+0YHEtWoMmfyTHQj/1OlO+/9dZwueBW7qevW4mBSnWJGa
         muiA==
X-Forwarded-Encrypted: i=1; AJvYcCXe0olxmCKKC9Vca7mW4sdnfslur6TdAvrVSijO5Ws1Kq4DP1Dn/GyoTfb3pmCDM9JrOtMbFfemTpZCJPOJ+nRh98Im@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5RUaKWy7GfV3uFIaxjP8bLVhrzfilPQPOn+i0Pc4pBwy4Ykwl
	nLkdOjl1qYxcZOZd0epjMkYYvT9KvGnrYvoOpE4yWQvIiGXz2oK4z8PHxB4RVGitOo1blcM93Fx
	hwY+zhfT3ovSWGym2MkGYN+V2jdSqN8C1b5aJJko3BAVSRIJtEijkQO170507RcXQgdvjXO4=
X-Received: by 2002:a17:907:9611:b0:a9a:eca:f7c4 with SMTP id a640c23a62f3a-a9de6199b4bmr1567151966b.54.1730297815177;
        Wed, 30 Oct 2024 07:16:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERlYVhvULgkJGMdtzuVMS0R74v+lxpi11wCzSuhqdKM6DR//Na3xUdI0tEKUGJ/zSd+AHpHQ==
X-Received: by 2002:a17:907:9611:b0:a9a:eca:f7c4 with SMTP id a640c23a62f3a-a9de6199b4bmr1567148666b.54.1730297814701;
        Wed, 30 Oct 2024 07:16:54 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1f2994ddsm567904766b.110.2024.10.30.07.16.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Oct 2024 07:16:54 -0700 (PDT)
Message-ID: <5bee1158-537f-4fb2-bde3-e86b5dce3fee@redhat.com>
Date: Wed, 30 Oct 2024 15:16:53 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/amd/hsmp: mark hsmp_msg_desc_table[] as
 maybe_unused
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Arnd Bergmann <arnd@kernel.org>, Suma Hegde <suma.hegde@amd.com>
Cc: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Carlos Bilbao <carlos.bilbao.osdev@gmail.com>, "H. Peter Anvin"
 <hpa@zytor.com>, Randy Dunlap <rdunlap@infradead.org>,
 Bjorn Helgaas <bhelgaas@google.com>, platform-driver-x86@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
References: <20241028163553.2452486-1-arnd@kernel.org>
 <8aa437c2-43be-4ecf-88c4-f733b1e7f243@linux.intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <8aa437c2-43be-4ecf-88c4-f733b1e7f243@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 29-Oct-24 1:55 PM, Ilpo Järvinen wrote:
> On Mon, 28 Oct 2024, Arnd Bergmann wrote:
> 
> + Hans
> 
>> From: Arnd Bergmann <arnd@arndb.de>
>>
>> After the file got split, there are now W=1 warnings for users that
>> include it without referencing hsmp_msg_desc_table:
>>
>> In file included from arch/x86/include/asm/amd_hsmp.h:6,
>>                  from drivers/platform/x86/amd/hsmp/plat.c:12:
>> arch/x86/include/uapi/asm/amd_hsmp.h:91:35: error: 'hsmp_msg_desc_table' defined but not used [-Werror=unused-const-variable=]
>>    91 | static const struct hsmp_msg_desc hsmp_msg_desc_table[] = {
>>       |                                   ^~~~~~~~~~~~~~~~~~~
>>
>> Mark it as __attribute__((maybe_unused)) to shut up the warning but
>> keep it in the file in case it is used from userland. The __maybe_unused
>> shorthand unfurtunately isn't available in userspace, so this has to
> 
> unfortunately
> 
>> be the long form.
>>
>> Fixes: e47c018a0ee6 ("platform/x86/amd/hsmp: Move platform device specific code to plat.c")
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>> ---
>> Ideally this array wouldn't be part of the UAPI at all, since it is
>> not really a interface, but it's hard to know what part  of the header
>> is actually used outside of the kernel.
> 
> Sadly this slipped through during review even if it was brought up by 
> somebody back then. The (rather weak) reasoning for having it as a part of 
> UAPI was seemingly accepted uncontested :-(.
> 
>> ---
>>  arch/x86/include/uapi/asm/amd_hsmp.h | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/x86/include/uapi/asm/amd_hsmp.h b/arch/x86/include/uapi/asm/amd_hsmp.h
>> index e5d182c7373c..4a7cace06204 100644
>> --- a/arch/x86/include/uapi/asm/amd_hsmp.h
>> +++ b/arch/x86/include/uapi/asm/amd_hsmp.h
>> @@ -88,7 +88,8 @@ struct hsmp_msg_desc {
>>   *
>>   * Not supported messages would return -ENOMSG.
>>   */
>> -static const struct hsmp_msg_desc hsmp_msg_desc_table[] = {
>> +static const struct hsmp_msg_desc hsmp_msg_desc_table[]
>> +				__attribute__((unused)) = {
> 
> It seems that the main goal why it was put into UAPI was "to give the user 
> some reference about proper num_args and response_size for each message":
> 
> https://lore.kernel.org/all/CAPhsuW5V0BJT+YSwv1U=hRG0k9zBWXeRd=E1n4U5hvcnwEV3mQ@mail.gmail.com/
> 
> Are we actually expecting userspace to benefit from this in C form?
> Suma? Hans?

I can see how having this available in the uapi header as documentation
of sorts is somewhat useful.

OTOH I do agree that this array should probably not be used by userspace.

And there is only 1 way to find out if it is actually used (which I do not
expect) and that is to just drop it and find out (and to be willing to
revert the change if it breaks things).

So we can either move the array in its entirety to the c-code consuming it,
which I think would be best; or we can go with Arnd's patch + add

#ifdef __KERNEL__ 

around the array so that it is there for people reading the header, but
it is no longer exposed as uapi.

Regards,

Hans






> 
>>  	/* RESERVED */
>>  	{0, 0, HSMP_RSVD},
> 
> 

