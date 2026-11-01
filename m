Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793507337;
	b=EAC8oTB2rnnYLWw0vjxMRUNwuVzTTgRM+J+26LEhKQoaZ6HrB0dqziSJ+Vnx5vBde43F
	 wwnSp6GcxydJx6Q11cgBQh9WVNwiPgai+gqnfROUoEbI7kCD1WBAruvt5DnCXJjkHNECY
	 yb5dq/BuaA4iZjMYbgSTrSvA3Eu4I8kmLU3wJIq7ywjue8GdEiovdAmzP7eblb8rbnV6z
	 yneI1I7ZHO4JnG4X8iDuC46lZIyNREk4rt+oLqCcn5HIRSO1weWmaJklMoxg1Hxb47NHQ
	 RcKI6txW7asKFgxGDYvPAg6S3zQFjaFY4ekjEeKDtoXGGy9/pV1x7cojBdzkFO2DtPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793507337;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=vIgwG3A4Xi+B0aPU2gi4TdOrPPpgK+2Hob+9YvGomNk=;
	b=ODL/Z+xiyxe0qCtAXjHJG/I+sPhlXhyJ/+QhE96qp7aHHyS0GLNDbFD4srE9AycYgm9b
	 IYElszwRVRPENWfvatI6JNjHMKbEiy0T1wOKi7w6AYXVmXaBnjHpVWdqq4IR8r4uK+2Du
	 J0QYVHcaWoPiWlzyzLS4/eCd0s3LIGEg2L5tMmt9jXDhZZGoxGq/85UJApzOQBoRl61YH
	 7aXXjbpRMiyQCk4NGoXJrK7pLWbhQSKXP4A+2Suln7pyw/eYrWXvfI58TEW75TasiSKqa
	 qyK9u7BTfnLqi4lWZu8nE+sTIl8+yhUOB8GSpgMLLeWGLfE7gL3jHqql660WbsBD+3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="c//C8HL2";
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC68A606A324
	for <platform-driver-x86@vger.kernel.org>; Sun,  1 Nov 2026 04:28:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC68A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c//C8HL2
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cd62c570b5dso1176803a12.2
        for <platform-driver-x86@vger.kernel.org>; Sat, 31 Oct 2026 21:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793507336; x=1794112136; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vIgwG3A4Xi+B0aPU2gi4TdOrPPpgK+2Hob+9YvGomNk=;
        b=c//C8HL2Vl+J0cOkKFXeURf2zy6PS/BqLTy7p/DbqeiOTaUTcbX0SBY4UaJurwYuFF
         c7PrKphOVzH4qu5RCSDc81w5cZmqDt5yya6OmkZxYApabpcjNVq2Fc/5HwI3bwIHd1JW
         pkDcaXCxyDAjtdyblOTsQXU/pAwvIGqZY7i4fSJT5GhXMIqeIY/bHCCbAMS7gIHkex2x
         TdsLtQlRBjLZaPTHeztoAOj8eyy+7twJQZTvKaUm7LmxiKn5859Ucba7opq0wZx8ajp+
         6iDUlyX9Hq+qGXV+uH8+cO82n47qUgQ8SFOOpyoSVxVADOEz4+oij0kcYDWuPvS5MG0X
         LhCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793507336; x=1794112136;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vIgwG3A4Xi+B0aPU2gi4TdOrPPpgK+2Hob+9YvGomNk=;
        b=UCieP1gn+XlrQ/iQfvznV5J+6gc1BJ8xOYllAupSmBZI+hDJKrJ4IizJrbwpXsgr5p
         C+EYBn7szdhEwyjMBuxUfZNkCdBDAyTtHiEgO+sQtrUukJSSuq4162VT8aUVksE2+s0w
         UosmnNKyIqm5aqtKm2N0cfj8WGRq0nqUdTnPW1+ee93+KllE43pLbSxILUwvWD9pdlzw
         VWvhoGXM4ip7x2FdksJNGJgIUe0L9ouyHYv3rVTe8/v9dfF4/RO6wrOWABPOeCq/sgTs
         6l7aNadY9rcCM3iSnObG0Diy7EjSp9u7upuB7ZmtmfF+BTVMcIRQHHQy7oBKlwb/3Ghk
         DqxA==
X-Forwarded-Encrypted: i=1; AKwUvBy1lolZdRS+/GjcMXZo2dUHcrh4M03CQFl+8bw0W8LIMP0UZshO2o3L3nOwVTk/dZGkyu+VMpiJR8GMTNFE0frNsGMP@vger.kernel.org
X-Gm-Message-State: APuU4Z+U+vnjRfEeNmTb1NGcMBxGrot3ORDPpWAvPYQuvEcj5d6WpK2F
	xWorF0LBUnO5KXSpftNj2HOARKR1f+LEpe3dNl8L4jc0VuavQ+3UtwsU
X-Gm-Gg: AYBFou2RUIkCjzZiGe79B+NdfDES+6MtwTaqvC9nOAfnxwiN9NFFUU3pnVS29Wz/8d0
	INZ0BMdQ3W3i6klC4Q6s5cgbq8t++o8MxjXX4y+hpSvJpGoOS8NGvvqGSH6+UBgPFpLjqJK4ar1
	ceXBg7kYzK0WIYM/oJAjKuTKzfpva0gvpkTw4LRmYl1WawBxQpWKizUXpdgUozbhW3eba0UZO3A
	U41wfaW/xTGrx5zcQlclba3q4VgcVFM1fkqOL2ByA7r41wP/Rv/Xv/XLmibC49ii0PUi3NNlth+
	5Z+SG55hcqJRRsIXhcvNQbeb4uG7PaM6jd9oUzBb5R5ktp+YolN5tnYeszb/5LNxlhwoPgyE+FV
	QlhxUIkTow0h2XKcGff3EFyyag7QBrLHyV+DmP8A2RFFoBFDDwEtNI5Jp9oA4SacESN1g+QAqyZ
	D2aQXDIGSGkTdj04yJSiW5tiu5gCMYrAVnPlY/iM6T1+jGFLMPQwigcJAqoT4XX8jrfmf50As5t
	ZGtB9RgwVcB0D9q0CQeihZPP82ipvevulfDNA4+5xzMLZZm5+nQyZhfXMeddt09h+JjxnjwZIxV
	/A3RDIBaTU9q5KTxNGy9ZP13662Iq15F9RzxehdLDtLkqW4=
X-Received: by 2002:a17:90b:3194:b0:3ae:a4fe:7ad4 with SMTP id 98e67ed59e1d1-3aea4fe7dd4mr1663954a91.2.1793507335992;
        Sat, 31 Oct 2026 21:28:55 -0700 (PDT)
Received: from ?IPV6:2408:8210:2436:950:5b1:370f:dc22:b6ab? ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e9db612sm13787149a91.17.2026.10.31.21.28.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Oct 2026 21:28:55 -0700 (PDT)
Message-ID: <f8970847-89c1-4c5c-bb15-2181f1c8f7b5@gmail.com>
Date: Sun, 1 Nov 2026 12:28:50 +0800
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 0/6] Merge redmi-wmi into bitland-mifs-wmi
To: Arsenova <7z0423arsenova@proton.me>
Cc: Ilya Gladyshev <ilya.gladyshev@linux.dev>, Armin Wolf <W_Armin@gmx.de>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org
References: <20261031204357.157958-1-7z0423arsenova@proton.me>
Content-Language: en-US
From: Mingyou Chen <qby140326@gmail.com>
In-Reply-To: <20261031204357.157958-1-7z0423arsenova@proton.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/1/26 04:45, Arsenova wrote:
> Hi Mingyou,
>
> In the v15 cover letter you say you have no Redmi device and that
> tests are welcome. I have a Redmi G 2022 (board TM2135, BIOS
> RMGAD6T0P1313, Arch Linux, kernel 7.2.11) and can test this series
> on it, and later versions as they come.
>
> On October 23 I sent you and Armin a report that bitland-mifs-wmi
> does not work properly on this model, with details from the
> firmware's ASL. It arrived during the merge window, so it may well
> have been missed:
>
>    https://lore.kernel.org/platform-driver-x86/OT2JfRLDi6yHShYvywRZoFBYdW-TUgdKqKtahRM5b0cZxNo6eGZHnO5dKf4oYFaEtZhEsqU-Q-2OFe0D-qToJMVUrS5_d2aa2Q5LD50ISIc=@proton.me/
>
> Reading v15 (I have not run it yet), the quirks table seems to cover
> most of that:
>
>    - skip_ac_type_check avoids the AC type query (0x1300), which on
>      TM2135 returns a bare Integer 0xE000 and makes "performance"
>      fail with -ENODATA;
>    - accepting function == 0 in Set replies matches what I see here:
>      the EC switches mode, but the reply carries function 0;
>    - handling event 0x16 as WMI_EVENT_PERFORMANCE_PLAN_ALT covers the
>      mode change events this firmware sends.
>
> What TM2135 would still need is a DMI entry with its own profile
> table, because its firmware uses 1 = balanced, 2 = quiet and
> 3 = performance instead of the default values.
>
> If that is useful, I can:
>
>    1. test v15 on this machine and send you the results, including
>       the Fn mode hotkey events; and
>    2. send a patch on top of the series that adds the TM2135 DMI
>       entry and profile table. I would base it on the base-commit
>       from your cover letter (9d3475065167) unless you prefer
>       another tree.
>
> Please tell me whether you would rather fold the entry into your
> series or have it sent separately.
>
> Thanks,
> Arsenova

Hi,

Feel free to test the patch series on your machine.

Here's an example quirk of your machine.

static const struct bitland_profile_entry tm2135_profile_entries[] = {
     { PLATFORM_PROFILE_LOW_POWER,         0x02 },
     { PLATFORM_PROFILE_BALANCED,         0x01 },
     { PLATFORM_PROFILE_BALANCED_PERFORMANCE, 0x03 },
     { PLATFORM_PROFILE_PERFORMANCE,          0x04 },
};

static const struct bitland_mifs_quirks tm2135_quirks = {
     .profile_entries = tm2135_profile_entries,
     .num_profile_entries = ARRAY_SIZE(tm2135_profile_entries),
     .return_code_at_end  = false,
     .skip_ac_type_check = true,
};


static const struct dmi_system_id bitland_mifs_dmi_table[] = {
     {
         .matches = {
             /* if this doesn't match your DMI info, change it manually. */
             DMI_EXACT_MATCH(DMI_SYS_VENDOR, "TIMI"),
             DMI_EXACT_MATCH(DMI_BOARD_NAME, "TM2135"),
         },
         .driver_data = (void *)&tm2135_quirks,
     },
     {}
};

