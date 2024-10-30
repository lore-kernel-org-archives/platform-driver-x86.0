Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D721BD9F5
	for <platform-driver-x86@vger.kernel.org>; Wed, 30 Oct 2024 17:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730308630; cv=none; b=XLImAjG7X+JmOEth845O5WjK8zzSD6DTHKsiYXPN74J8DESB8BmQpiSllLox8/J4rSbDnRUBGXJ+XX28axChfcgUuhGZYS8lbflng8eOs4bZ//OEJMVXCpcdgaKW8BM/fcKuCy3/tvdg/aDEXxWxTM8jrP17P+P29TGRjziNUBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730308630; c=relaxed/simple;
	bh=46nltVUU0kiDXDIk8IL94h6z6pxgXioIhPDi+mi0xQI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JkLhn6oTlpXpbghMucM90nkypEImdy7i0jdKLT9N0Sor42ps43usdARxRmrXrmgyGtqsgjRI1ukFTNcS3u/ffb/t1uH002AldqPegP01zy+ChEqMQBZvNKSkRQtsHEiiaeyiF7u6ILRaeHQ6wYoZ+X6Yal6uKDnjol7BdDXpE70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UBPdHoXz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UBPdHoXz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730308626;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jthWpIiDTsLxtT/9u+fmdom6Br96mv699W97/kRcWoU=;
	b=UBPdHoXzRGeViQiMTfLn+G8/+RFYUBI5Vpfq/IARCPyRbqT64AE1F4V21CoTD0X8kAFm6E
	T3+aT+vCcIhfQsK/PEL6TLH2tTuQ4jilF/h5IvcJ8SbuRR1uuG36FneCXJ0MkUHjwXUEoQ
	IcljSsaEOoO01lZ5vP9Hpi9XkzQe/9Y=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-530-ijrWCuamOy-rIPhi98ECeQ-1; Wed, 30 Oct 2024 13:17:05 -0400
X-MC-Unique: ijrWCuamOy-rIPhi98ECeQ-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a9a2ccb77ceso610966b.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 30 Oct 2024 10:17:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730308624; x=1730913424;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jthWpIiDTsLxtT/9u+fmdom6Br96mv699W97/kRcWoU=;
        b=nTuByQDBcpoITwZASyIxhZGnJoqmqN/Rzc9kHpPCRewHXy6fBIuTyFIeVpYDAqmjy8
         wDqbIOz2iNEZrWNWb4chite1SYbYZcfcDIkmpgAaKPIjh+z8mk1RW4X3DnWvW8S7nmtO
         X2U+8DfggBPo5EN/zjKq4GZbOCQeoNDMmpbUvgH1NgbTsHZAYe50iFI6morWoG0+jFD8
         fQ4aLFRp4HM0Lh0o/b4P6wyIbYDtbdQsIvnwcjxbK/gMpgKqCo+2sPmtWY+wTBEILAIU
         W2s/O4MNRAxzeUyf4S750tJI+h4oHG3RXD1swjJxSvihIhQLD3tKXDukpGbwlMQNFyGn
         lC8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWyzQyRhe9ZHrZ+LSgeR2uwZqzNcHZEVqBMd3b4glrGiKT28zWLDgt/YcVB5YQVcdYYYEw+d1OwQNLlXfvDUyMRm3Zf@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi/2L3ZvKYUXo3iIdgMtUvXqoeB+V6b2QJd2cctCqsc4D+Ij5D
	s27sE/keBw+381qbtk3XExIocHQTwNKATEtOXOYQfkOu2LOn+GTs7/5rSzCSC7tv3AFibMEGY+x
	pDK6e4FxuU3qcmrSbglSZaBA3OCHUr7DA81auQRVR3wZUc4tEVQqQBVg4cin72Sm5+6daJXU=
X-Received: by 2002:a17:907:9807:b0:a99:ed0c:1d6 with SMTP id a640c23a62f3a-a9de61cf1a5mr1362301666b.49.1730308624411;
        Wed, 30 Oct 2024 10:17:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGl7jw1IfD5krLb0nF0B4bj3VPrFKAZNxpea6zbagKbm+sKUViNHamDW+vxyeNCzdVNZyq8SA==
X-Received: by 2002:a17:907:9807:b0:a99:ed0c:1d6 with SMTP id a640c23a62f3a-a9de61cf1a5mr1362299066b.49.1730308624022;
        Wed, 30 Oct 2024 10:17:04 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1f0292easm584797166b.78.2024.10.30.10.17.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Oct 2024 10:17:03 -0700 (PDT)
Message-ID: <046687d8-1e2d-435b-adcb-26897bfd29f7@redhat.com>
Date: Wed, 30 Oct 2024 18:17:02 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/amd/hsmp: mark hsmp_msg_desc_table[] as
 maybe_unused
To: Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Arnd Bergmann <arnd@kernel.org>, Suma Hegde <suma.hegde@amd.com>
Cc: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, Carlos Bilbao <carlos.bilbao.osdev@gmail.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Randy Dunlap <rdunlap@infradead.org>,
 Bjorn Helgaas <bhelgaas@google.com>, platform-driver-x86@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
References: <20241028163553.2452486-1-arnd@kernel.org>
 <8aa437c2-43be-4ecf-88c4-f733b1e7f243@linux.intel.com>
 <5bee1158-537f-4fb2-bde3-e86b5dce3fee@redhat.com>
 <a3b3aa23-3238-4117-b931-7194fc1ccc34@app.fastmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <a3b3aa23-3238-4117-b931-7194fc1ccc34@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 30-Oct-24 3:19 PM, Arnd Bergmann wrote:
> On Wed, Oct 30, 2024, at 14:16, Hans de Goede wrote:
>> On 29-Oct-24 1:55 PM, Ilpo Järvinen wrote:
>>> On Mon, 28 Oct 2024, Arnd Bergmann wrote:
>>>
>>> It seems that the main goal why it was put into UAPI was "to give the user 
>>> some reference about proper num_args and response_size for each message":
>>>
>>> https://lore.kernel.org/all/CAPhsuW5V0BJT+YSwv1U=hRG0k9zBWXeRd=E1n4U5hvcnwEV3mQ@mail.gmail.com/
>>>
>>> Are we actually expecting userspace to benefit from this in C form?
>>> Suma? Hans?
>>
>> I can see how having this available in the uapi header as documentation
>> of sorts is somewhat useful.
>>
>> OTOH I do agree that this array should probably not be used by userspace.
>>
>> And there is only 1 way to find out if it is actually used (which I do not
>> expect) and that is to just drop it and find out (and to be willing to
>> revert the change if it breaks things).
>>
>> So we can either move the array in its entirety to the c-code consuming it,
>> which I think would be best; or we can go with Arnd's patch + add
>>
>> #ifdef __KERNEL__ 
>>
>> around the array so that it is there for people reading the header, but
>> it is no longer exposed as uapi.
>>
> 
> I don't think that would work, because the 'make headers_install'
> step just removes the contents of #ifdef __KERNEL__, in this case
> you just end up with a uapi header that doesn't have the array.

Ah I did not realize that.

Ok so lets just move the definition to the .c file which actually
uses the array and then add a comment like this:

/*
 * See hsmp_msg_desc_table[] in:
 * https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/platform/x86/amd/hsmp.c
 * 
 * for some information on number of input- and output arguments
 * for the various functions.
 *
 * Please find the supported list of messages and message definition
 * in the HSMP chapter of respective family/model PPR.
 */

Note please replace hsmp.c with the .c file to which the array
is actually moving ...

Regards,

Hans

