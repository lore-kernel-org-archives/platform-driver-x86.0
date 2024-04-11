Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B865933F2
	for <platform-driver-x86@vger.kernel.org>; Thu, 11 Apr 2024 12:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712838643; cv=none; b=HNKV1h1bGUkJeFoBBcngJFbflO8PxR47qCm0zq/oZRgGcATeRE8dgsRKmq5hxBfjPL4s4Ls3JUN4hRXiZmv+3HgbuJ2ks6GUFBrTYG5ua4gEc860ovJ6KZhsPoB87TrGY3XihkmHcfRJCvcn2by+Zn650UYwikkOOQrmQ2vRLMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712838643; c=relaxed/simple;
	bh=m6ZmLjNtsMal/jBiy3eS3fgwccfEbHpXSv38sFCq8QE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j1jU4ySnzXZd4zyjIxuEyd3/N6Ey4LgSeyZfJwxlxnNanxhfH+lonnB1RcAMOnkK/ZHyB055oEjft0WrzyidvGHq9OR+UqB0wbGz5ebrMudbHQlJo5PaSaDCfz1zozleRWbpoiquS6tcuybnp2L0OhK3+oMVSofBZ8miEsbbrlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=g1O5XFpk; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="g1O5XFpk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712838640;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o39791NgVPOGygPt4yvbiHEMYNSCg3KIip+yEED7lns=;
	b=g1O5XFpkK8u5KQpMwzhw1K6JVuY0UPL/0XEoHwK/nDmwxjPJKoVPoDzHS3HA1xK/GM+fZR
	3Bi8CI3m0gMqk1NTOPeIEhH9kepfreGC5ZAeQUDDYHl0+2Cz9qz5sJroIkEnqFueWIxoOt
	Gz0e2vGNtSireHfsjh82PfRT42sNtgQ=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-195-KnuzxPWpP8qTgE6zoPNcMg-1; Thu, 11 Apr 2024 08:30:38 -0400
X-MC-Unique: KnuzxPWpP8qTgE6zoPNcMg-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-56e41cde4b7so3615171a12.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 11 Apr 2024 05:30:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712838637; x=1713443437;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o39791NgVPOGygPt4yvbiHEMYNSCg3KIip+yEED7lns=;
        b=UIJg5X2Vb1n6UwmIn/bPW0IGYEfBnVim7J7vxU7cNb6V6rTXTo7OZhg3ZMNwrGjt8L
         Plu/xu4cRO4bbZl9DEHDNP++uJqwnUvC0FnWptRADa9eH0NaPL+dS7sVSfTY9i3Td12y
         yNt+5sum0AmeCXzZot0VBThPG5UGHKJ/G7VJb6yHhBrOZiudbFcvXzUYEM78lndnvC8e
         1Su1h6CXzV9vaxUg9uiJLKRtdycfwGKhTjlDxE8sQjvPUlT+h8g1RpEiHmeojFUlTXHm
         y2c7Wts/ZfYWiCEas2D/Eo+exf+MN7rdclE05hl8Me6ZEQMFunc8ALqcxYHkxjOkK6cU
         MfFg==
X-Forwarded-Encrypted: i=1; AJvYcCXMsefxh2RFPUT530/Te1sJhGN/7+geFZrD+ZSuUK0PLSRn7VSzrn1Job9622ZOAhlARJBAySMdNbODNpfJLI0+WPYcLFkIdAhjIwSfJ+AyFO+73A==
X-Gm-Message-State: AOJu0YzqNPFd8yTP7XUE/mbY9RpOxNFrlhvqnMZQ9Kvfks905UInvZis
	pBw/+2rY7/plk5kAmFHOkVD70NKkc8EO3tS0VbpyCncmrqE/Doj8n5pXjwk8YZU0l0Cxvm+jPZk
	JY6bl/tTKZ+C43m1jwuVIfAUZNCSve/cP6GCK/N2wNm3QfTEavvpRPOO2ncJcbdsPiFoqF44=
X-Received: by 2002:a50:cd19:0:b0:56e:7751:ae4e with SMTP id z25-20020a50cd19000000b0056e7751ae4emr2253965edi.33.1712838637388;
        Thu, 11 Apr 2024 05:30:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEfczbrDYphsIXAmP5vXOQog7edYp3/hYYdYnPGuJW85oLkEvHop5fgUsPZglqMhlGlVlPhyg==
X-Received: by 2002:a50:cd19:0:b0:56e:7751:ae4e with SMTP id z25-20020a50cd19000000b0056e7751ae4emr2253947edi.33.1712838636991;
        Thu, 11 Apr 2024 05:30:36 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id n22-20020aa7c796000000b0056feeb85ed0sm177407eds.19.2024.04.11.05.30.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Apr 2024 05:30:36 -0700 (PDT)
Message-ID: <411e6353-16ef-455b-98fa-2d38bb7bf9bd@redhat.com>
Date: Thu, 11 Apr 2024 14:30:35 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] Input: Add trackpoint doubletap and system debug info
 keycodes
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: Peter Hutterer <peter.hutterer@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
 ibm-acpi-devel@lists.sourceforge.net,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 Nitin Joshi1 <njoshi1@lenovo.com>, Vishnu Sankar <vsankar@lenovo.com>
References: <mpearson-lenovo@squebb.ca>
 <20240324210817.192033-1-mpearson-lenovo@squebb.ca>
 <20240324210817.192033-2-mpearson-lenovo@squebb.ca>
 <ZhR-WPx7dgKxziMb@google.com>
 <f3342c0b-fb31-4323-aede-7fb02192cf44@redhat.com>
 <ZhW3Wbn4YSGFBgfS@google.com> <ZhXpZe1Gm5e4xP6r@google.com>
 <92ee5cb2-565e-413c-b968-81393a9211c4@app.fastmail.com>
 <ZhcogDESvZmUPEEf@google.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZhcogDESvZmUPEEf@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Dmitry,

On 4/11/24 2:02 AM, Dmitry Torokhov wrote:
> On Tue, Apr 09, 2024 at 10:17:05PM -0400, Mark Pearson wrote:
>> Hi Dmitry
>>
>> On Tue, Apr 9, 2024, at 9:20 PM, Dmitry Torokhov wrote:
>>> On Tue, Apr 09, 2024 at 02:47:05PM -0700, Dmitry Torokhov wrote:
>>>> On Tue, Apr 09, 2024 at 03:23:52PM +1000, Peter Hutterer wrote:
>>>>> On 09/04/2024 09:31, Dmitry Torokhov wrote:
>>>>>> Hi Mark,
>>>>>>
>>>>>> On Sun, Mar 24, 2024 at 05:07:58PM -0400, Mark Pearson wrote:
>>>>>>> Add support for new input events on Lenovo laptops that need exporting to
>>>>>>> user space.
>>>>>>>
>>>>>>> Lenovo trackpoints are adding the ability to generate a doubletap event.
>>>>>>> Add a new keycode to allow this to be used by userspace.
>>>>>>
>>>>>> What is the intended meaning of this keycode? How does it differ from
>>>>>> the driver sending BTN_LEFT press/release twice?
>>>>>>>
>>>>>>> Lenovo support is using FN+N with Windows to collect needed details for
>>>>>>> support cases. Add a keycode so that we'll be able to provide similar
>>>>>>> support on Linux.
>>>>>>
>>>>>> Is there a userspace consumer for this?
>>>>>
>>>>> Funnily enough XKB has had a keysym for this for decades but it's not
>>>>> hooked up anywhere due to the way it's pointer keys accessibility
>>>>> feature was implemented. Theory is that most of userspace just needs
>>>>> to patch the various pieces together for the new evdev code + keysym,
>>>>> it's not really any different to handling a volume key (except this
>>>>> one needs to be assignable).
>>>>
>>>> What is the keysym? If we can make them relatable to each other that
>>>> would be good. Or maybe we could find a matching usage from HID usage
>>>> tables...
>>>
>>> I was looking through the existing codes and I see:
>>>
>>> #define KEY_INFO		0x166	/* AL OEM Features/Tips/Tutorial */
>>>
>>> We also have KEY_VENDOR used in a few drivers/plafrom/x86, including
>>> thinkkpad_acpi.c and I wonder if it would be suitable for this vendor
>>> specific debug info collection application (which I honestly doubt will
>>> materialize).
>>>
>>
>> That's a somewhat disappointing note on your doubts, is that based on
>> anything? Just wondering what we've done to deserve that criticism.
> 
> Sorry, this was not meant as a criticism really, but you mentioned
> yourself that there isn't anything in the works yet, you just have some
> plans.
> 
> For such a project to succeed Lenovo needs to invest into selling
> devices with Linux as a primary operating system, and it has to be
> consumer segment (or small business, because for corporate they
> typically roll their own support channels). The case of retrofitting
> Linux onto a that device originally came with Windows OS rarely gets
> much if any response from the normal support channels.
> 
> Is this something that is actually happening?

Yes, Lenovo is actually offering Fedora as an OS choice when
ordering ThinkPads directly from their website in many countries
including when ordering as a consumer.

And unlike other vendor's Linux preloads which often use a kernel
with downstream laptop specific changes these laptops are running
unmodified Fedora kernels, which themselves are almost pristine
upstream kernels.

Lenovo (Mark) has been really good the last couple of years in
making sure that their hw just works with mainline kernels without
any downstream vendor specific patches.

>> That aside, I guess KEY_INFO or KEY_VENDOR could be a good fit (I
>> personally don't think KEY_CONFIG matches well), but I would be
>> worried about clashing with existing functionality.

Using KEY_INFO / KEY_VENDOR works for me too. So maybe we should
just go with one of those 2 ?

Regards,

Hans



