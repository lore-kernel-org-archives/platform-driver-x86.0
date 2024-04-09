Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C85433BC
	for <platform-driver-x86@vger.kernel.org>; Tue,  9 Apr 2024 05:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712640247; cv=none; b=J+a/2QxDHFn/7jhuzAqfqCfbEIJvA9mYb1dZvmhuXVX3dwo/4AyDWzzgJxHiUk5bwdMau1IBgNAjy1x1w16YAGsU1Xxb4oAs0jk530rMXlmuq+o9u8ID1M8b7l0zPVPHv+b5aypEwdjK75A53sjbZ6ObC0JW5nEoDRq/A84GU4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712640247; c=relaxed/simple;
	bh=2yzdMPsQjZBKbu2RsG7bppQbPga9w4g4BiLWfpVbzx4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YWlMY3BzhOJaIY/kbvx0gDeCeU2bV/+sVPVg8Jl5dWFfIWdG++8PocidOG28XFBpkvPCu1utz1BCuDkkL8uNNT169C1F1Uc8vhweO4GTrcx4mpXgKmZamWec2CR3TLrZeNPedv9JxfHxgQLgKQQrP8f9vE9+rbmrYCuS9QLMHxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iJfmRZi8; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iJfmRZi8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712640244;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qdDr1Hl3PFGnhdknuMQtRh93bfh1USz5GSeKZpt2kZY=;
	b=iJfmRZi8XdBC64wDltiCuJrCJNjyAMlVwkUePbbT/yZ94lcozfbicZFNBRzHl2Ri+Lu6oz
	oDsVPhI/3o1NdysDMF+nJ3bhsHHz2NxHWLIxRWtmRmQrxC7hQSicALe1bVDRyTtE0NETzJ
	eqr23bsyygJxw7xsFBuSmI8q9eO0bpA=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-282-0UswsXOXOyWrbki-4e_jAA-1; Tue, 09 Apr 2024 01:24:01 -0400
X-MC-Unique: 0UswsXOXOyWrbki-4e_jAA-1
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2a2c4a28e43so4459054a91.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 08 Apr 2024 22:24:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712640240; x=1713245040;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qdDr1Hl3PFGnhdknuMQtRh93bfh1USz5GSeKZpt2kZY=;
        b=LGbSldHxMXadJGBoq3Sl5RO4PQhImfyQPBMe0f821j0TpPfpr3OPcq3YFJ8E35No+y
         8BSuUe0qNYOKziO+UBTLUYXTXP6RPgP2b8Fic7iQIBhYQ8oYPxSxgm+T6bactDcbkzFo
         5DI829dYrMmAZKV32nDOFEVvWMATJS7oEssmnIrImraxtFgkJonMfd1IhZWLHm5qfMgB
         5OpDEJR0NPdM8rVI4AaH3a9q+eGKIlR8Y6jD8rU6/iHrHIRbr1Y4BekiW5y6U97bBKtN
         DPc+MWWeqLxfnh8RBkEbbWkzpxaG37z0ozlCZur2EYmfO8eX3e3SnVNuouc9VUcy21Bc
         VBVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWx5Tcx7hkFbk2hAv+DLiE+cIhlmtSekvKFmHOM4PRe/mjtpQVZpZPmRSd7dPXR28mmVuwuQ0rxnJHliia5epmL2U0NI850HS9yIDVaG21JZNOcQ==
X-Gm-Message-State: AOJu0Yw98kYiURfqs/csicryLZluBa9hLp0MMjEts2ez/uVspPWZb9BZ
	XMaIFB/lPjKUIl1JBBrXDkFnGO23MX+HkpGv7Mllu5LVm05S/fFsJmUKPaQMT9gAK/K2qX7UzAd
	MZqe7e7ry1E9pI5mCCrgvSJ95OjeosSy2RJzfBg/5RS2tIsn6BLro3ZfgG6V8GyxmucgWI18=
X-Received: by 2002:a17:90a:17c6:b0:2a2:bc9d:f44f with SMTP id q64-20020a17090a17c600b002a2bc9df44fmr7783881pja.13.1712640240451;
        Mon, 08 Apr 2024 22:24:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHHaRZwSrquXWFWvjYyvbfJbti9WAgNhMn8ACwIQ4BNfAmRp+5jeTjoHsnaXWUTVhQlgYU/Dw==
X-Received: by 2002:a17:90a:17c6:b0:2a2:bc9d:f44f with SMTP id q64-20020a17090a17c600b002a2bc9df44fmr7783868pja.13.1712640240075;
        Mon, 08 Apr 2024 22:24:00 -0700 (PDT)
Received: from [192.168.1.240] (117-20-68-143.751444.bne.nbn.aussiebb.net. [117.20.68.143])
        by smtp.gmail.com with ESMTPSA id cu12-20020a17090afa8c00b002a2f6da006csm7344186pjb.52.2024.04.08.22.23.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Apr 2024 22:23:59 -0700 (PDT)
Message-ID: <f3342c0b-fb31-4323-aede-7fb02192cf44@redhat.com>
Date: Tue, 9 Apr 2024 15:23:52 +1000
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
Cc: hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com, hmh@hmh.eng.br,
 ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 njoshi1@lenovo.com, vsankar@lenovo.com
References: <mpearson-lenovo@squebb.ca>
 <20240324210817.192033-1-mpearson-lenovo@squebb.ca>
 <20240324210817.192033-2-mpearson-lenovo@squebb.ca>
 <ZhR-WPx7dgKxziMb@google.com>
Content-Language: en-US, en-AU
From: Peter Hutterer <peter.hutterer@redhat.com>
In-Reply-To: <ZhR-WPx7dgKxziMb@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/04/2024 09:31, Dmitry Torokhov wrote:
> Hi Mark,
> 
> On Sun, Mar 24, 2024 at 05:07:58PM -0400, Mark Pearson wrote:
>> Add support for new input events on Lenovo laptops that need exporting to
>> user space.
>>
>> Lenovo trackpoints are adding the ability to generate a doubletap event.
>> Add a new keycode to allow this to be used by userspace.
> 
> What is the intended meaning of this keycode? How does it differ from
> the driver sending BTN_LEFT press/release twice?
>>
>> Lenovo support is using FN+N with Windows to collect needed details for
>> support cases. Add a keycode so that we'll be able to provide similar
>> support on Linux.
> 
> Is there a userspace consumer for this?

Funnily enough XKB has had a keysym for this for decades but it's not hooked up anywhere due to the way it's pointer keys accessibility feature was implemented. Theory is that most of userspace just needs to patch the various pieces together for the new evdev code + keysym, it's not really any different to handling a volume key (except this one needs to be assignable).

Cheers,
   Peter

