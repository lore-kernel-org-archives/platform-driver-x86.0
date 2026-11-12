Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794486225;
	b=MXqOZmhBZ55gZnKRxZdh1QrVSPbzRnrIrE0XjRXVvou0k1H8L8eyIeW5+L5H47Tcbi3J
	 XoYDGLageA2Ghqeaa48zEfUvMQWLkrD6EWU1qR3IoEd5lpG9MsLGCQSMIMCIrtScOg7TK
	 GvCdjrUSOaRa37xJhrL8dcey8jGaAn7ha3NYNb320SaudoktTzYWll/vXUUa5y9NJPhX9
	 mYofpSxWRObeF41Xu70ATrwzNvcX9nFwQWliMpJFQJyRbFJboae6sqYfurW5/tkR3zQNy
	 WtQfVeXu6KcpjVMB2oNuMrcdZpzgwH5DKg0dKCP8+4BJbhuw2jchhrMNzy3CLM4dpjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794486225;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=tcIPG4+3YqX+OOpMdjytCOm0jqolCq/25POtF+O6LTw=;
	b=xVjtDoz8lJK9S1km/pqpStkZ3Y3vcvhGLVCs+PumBUkv+e62SQIikHUDHfZEah1J5o8k
	 f4IUjKp1ihGzB9t0PNlkeA/2bQQoHE6IxFzHGVm/bllY1SHcSzQOYy0N5u7ZuG4eP8FX8
	 ElJxs5WFAqqpJMUiLyJS8qyViwPhE+stq5m5klbbbuEw9+ciWnSPBXiigPQfe72gz5nD0
	 1DYdXnttrg6XBEwUc6D455BoB5wxBn1QGXHzame/jap0e37bZUqCeaXJl2jAYJ5MViRy5
	 ozkcll4QdNkqeftoD/SaT3b6lpaBes2n8rwZsjFEpZ7caiZQcNdE40LdowJNL3Rmbgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cOz5m2fS;
	arc=none smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8247F606A880
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Nov 2026 12:23:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8247F606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cOz5m2fS
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b408f2d936so6485827a12.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 12 Nov 2026 04:23:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794486224; x=1795091024; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tcIPG4+3YqX+OOpMdjytCOm0jqolCq/25POtF+O6LTw=;
        b=cOz5m2fSTQw3xNO/z09nHL23qax5v5ampFLLVEOHikCCqnbs2i4KvUSMlhukxVUZw2
         RJeTSfz1fksSqKEgdfcWRoQREV3mPELuF+omgtnZYSJrbmBP8JuXaidB4zgc/uUMunkJ
         FAWmAPfqArWPYTG8Hus+zkkKc/5A7e2gzP0J6dEsT4jBf+FvmfkPonEUBRuo6C+hZIgD
         /YqP7BDgv0TK5FS+2ItOG+e1aNDUFeySa9lWy+a2U3/SNxQmkwDQ5nyhsb1seciLEYrh
         m9LlWqALW2ol7DG4A04QpTrQDfOPGP6aI0vYCsJF3aO0R2gleMNXPbwFmhKa+vWzBwWE
         P38g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794486224; x=1795091024;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tcIPG4+3YqX+OOpMdjytCOm0jqolCq/25POtF+O6LTw=;
        b=M3PxMW2P4jFPd5Yt/57AHKj+9NzsWxUoNEWPRXSOtk3wm2wK0JEwANcHk4DWaJZnQl
         gsKtA6btyNjLCRctvdEZN4UQlFD7Mafg/rTCxLw+r9tvXaego3gJFIa8EpV+nrqCK8hU
         1HjJtfGHkrNnYOGEID0mI13ny/YqgZDwQ/t6/sTEOaeSJ36/Z2tcUeYBqFlrwXvzsKf4
         CEymIwa9Pyp0VtP3GZNAvY0R9Rw+y+UyCfg+/FdRMCaKUKRreuUrkyInM3cROykTUFbb
         sMDxLldssYz0l11wIGZA/mjFCPZpMMc8kZ4N5PQo22SVSH/gG5jNrLEGO1fuJ81Hji98
         rIpQ==
X-Forwarded-Encrypted: i=1; AL+hErE1LSEW/6BiELHxezj8q67aWNkqVCGJgciPpOog/XNux+F0MDGwHD1COq22ak8j2BkWmd7FPF3ToUwUMrYowUgW4SS5@vger.kernel.org
X-Gm-Message-State: APuU4Z/CCliA0M64zII97kkJfgxc395xNrdkCHm/lQgYVyjEKQGuIak5
	+vUtfucoV95bRoRMHFSUFKRHC1d4Y7I2neb4yQn2Dnmv67YsmHs/VzPfl0g+lA==
X-Gm-Gg: AYBFou0jDpR2ODOSoVzDgiVEEqC0oFYrlp7poZ3wSUsvUo/AL3yWa8zsJAoIS43rgwC
	Ka139C9XH24SkNPZSkVGA1urSWAdI/Us91jz4IhAI/vBIqONX9Cm6ovgiLeW8HkxtrLE5xJESbp
	I2PY1NzkjdMOOeoa7Tgn9XSGbBROHxTCKeNlAsvUYSiNC8lZcvcy33tTQr4ALEh1QZXPdSZNZu6
	cFwt7gaS3iBj9Atm2uUN0nLWbaPsRS/1K12gruxqcZz+EPEeIjiTPdVe25atB3Qu5bwhNeVjpyd
	jXniFOnzZtJsWKqW8u7ejaOCtiq270dLHcNcVqJqzLQ61to0VGje9CsED9xJK5UgTXSz0KRZm7u
	qhwmhM8vG4m0nBjNdd4wsSCG2WYAmo2zdo9oJ0WWyO0mbzUTZH/C7zJ/7MPOa+9hS518JjtIqAJ
	E25WR8/AnDXfSu+2wHpoSUHXPXDghD4BFuYTgQvKHhyo7C7ywiHi+tpJ+i3i2wKVcLCWM0+OZsr
	xXupo4ms75XMEbbPpArwg2+8Lkw7dnV0XAxlAyUSOfLhhBgtnFRtWIHsTtx3klavim9FD2fECYs
	K4QUjYlGDdsSc3OW4j+686YwuDVp4WsLWyMpsPY=
X-Received: by 2002:a05:6402:158b:b0:6b7:1c:eae0 with SMTP id 4fb4d7f45d1cf-6b7775f01b5mr4085605a12.24.1794486223563;
        Thu, 12 Nov 2026 04:23:43 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b75775fcf0sm3486965a12.0.2026.11.12.04.23.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 04:23:43 -0800 (PST)
Message-ID: <910d8bf6-f05d-4887-b21d-f28fffe8d471@gmail.com>
Date: Thu, 12 Nov 2026 13:23:41 +0100
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
Subject: Re: [PATCH] surface: aggregator: propagate -EPROBE_DEFER from
 ssam_irq_setup()
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Chris Simpson <chris@nilk.net>, Konrad Dybcio <quic_kdybcio@quicinc.com>,
 Hans de Goede <hansg@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: janussss@163.com, luzmaximilian@gmail.com,
 platform-driver-x86@vger.kernel.org
References: <7d51f80e-9552-957f-f32c-1d608042b647@linux.intel.com>
 <d0bb21cc-6d3c-4526-8204-2511da51a6ac@nilk.net>
 <2faa9857-9d55-a607-bd46-588598b64ca4@linux.intel.com>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@gmail.com>
In-Reply-To: <2faa9857-9d55-a607-bd46-588598b64ca4@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/26/26 11:42 AM, Ilpo Järvinen wrote:
> + Konrad, Hans, Andy.
> 
> On Fri, 23 Oct 2026, Chris Simpson wrote:

[...]

> I have to admit this was not exactly what I meant (I only meant to not 
> use -Exx literal in the return statement), but now that I see this v2, 
> I'm not saying your approach is wrong either (I'm left unsure).
> 
> Are there some legimate cases where error other than -EDEFER_PROBE should 
> end up into this else like it previously did? The return on error was 
> removed by b27622f13172 ("platform/surface: Add OF support") so I assume 
> there was some good reason for that but the commit message isn't helpful 
> at all... :-(
> 
> Konrad, you did that change, can you explain the reason why the return was 
> removed from the error path?

I believe that might have simply been oversight.

I tested the v2 and it still works on the Qualcomm-based SL7.

Konrad
