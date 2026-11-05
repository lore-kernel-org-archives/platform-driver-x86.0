Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793884728;
	b=gXqwWgq3VcSKK+jmUFszUd0hdBJM+bEdqbBXj0Dsm7IkNL0jeB2V/foL0aO5NW5aHIxx
	 K9mlG5ri+DLV1S/tzleEuPV2LB0rrN19JF05CVZ27dvZap+DELwaxVp9LTK6rxMUCS10Y
	 Xl7ySBd+xLThrVG+aOBpvdXZAIJVkA8lF/oE2F61B0T1kIrqxk4T4qPrPYPL3cYXDv2EF
	 voi8PdmfylGA6/jtTdzFeH48Y5NrnoSmD9ky7dJT+fAyOdFQubxPOw7R5VcKetMD+Nzy7
	 9xQlwSwbyqfviLaL1BuCEg6xXRWNQasUXLcjz8SHdciARtJYN0h6JHBs89ETvIrTzIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793884728;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=WioThaDIkfDjWG1mFEw1+dKntzJ3B48ROFrYaw5ERg0=;
	b=vz1F9+MXN1qHjJzXG3QzTVOJOARtrrYwFlPvEZwkuECn5ZvrfKzLbM5yazNG4GyeypoI
	 L9vCM4vUgbB+bSZjdSJO8/s8OAHNVDGQ4LXih7mF+ZgKoRUaHjyDHu9pwVj1HbpJRr1Hh
	 Cw3xhVgSo1YgHd3cxmfT5WIeGYaOFZ7qDxt4LnCI8uH8BpWRiipkwMt1cVQVZ6RAaqhpg
	 hEBdt7uRFd9Rw8F40ojDv6TfLor05NHtXOilts+8d4Z6Kzoc2uBcVXJjgYib8V4D2NfX/
	 Jx/ljOZkiFLZQxShbUDtJMtSp7kJgO+F44i6Gw0w7UDwUg4tgIFS6DIjzvl3h7eYouA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gVCCN+Gr;
	arc=none smtp.remote-ip=74.125.229.135
Received: from mail-dl2-f7.google.com (mail-dl2-f7.google.com [74.125.229.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72DF606A326
	for <platform-driver-x86@vger.kernel.org>; Thu,  5 Nov 2026 13:18:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D72DF606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gVCCN+Gr
Received: by mail-dl2-f7.google.com with SMTP id a92af1059eb24-139b659a45eso645219c88.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 05 Nov 2026 05:18:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793884727; x=1794489527; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WioThaDIkfDjWG1mFEw1+dKntzJ3B48ROFrYaw5ERg0=;
        b=gVCCN+Gr73v3MUVBJLbnhV1b+0LV98ng6EW/VUJDQGsV4q2ORJtsbS+lfrWX95WGId
         6FIiVlAf2bH/rqCwLCWWLVbgF7ZI1AbO1jKf++NOYwhzKHjRqkWj+UHZ3hheMXP0/evm
         kCI5gAMcbW4ytsWSdskwf1NpkDbOyZmGIobSWo5figyGBI4kH4ta0Su4JLeZ+8Pnf1iF
         XuAqVu0qxEMqO0SmRGY/JKGLTAZQWf+T/mOOnZcKUIbrmLaKqFffpbf605X6iPMy14BK
         PM9sfX4LLWDSok2QY+NkVQtcS3206z/r7Fjc8KH/TVXWNdjcCyJLbzdSj80dRlibhkiN
         yx0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793884727; x=1794489527;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WioThaDIkfDjWG1mFEw1+dKntzJ3B48ROFrYaw5ERg0=;
        b=CozaG8tfP3ZWR0pCOYIgGvS5SKEm44DJ0Wp9WtF88yLy4h33eUrPBLdNWPY8/Jz6/k
         NoP6SooHXjSlh60uN31/Jl+kNV8ogRoZHjrOQ9qdDKI+/qvqtgx4AFPRSu9BQHuXD5h9
         80QK9SF1Te1NMaEClEsi2ga8B0il7zDo90hkA2iLMwlrfj5I6wM+NFxXhay9PuDhX8Kv
         P6FWMl2Udqd75i2HLO91xLqW7DQ1/p6vc9NY8BgXzSKjLmy3M/GienTScHCs+GU5dHzM
         +ftXDjt0lo64TUwCW6ckT+49QjDSqUUPc6YEHw5ZdOK+L5aEZuqBv1FkUSdpfms/IxgX
         8oFw==
X-Forwarded-Encrypted: i=1; AKwUvBzry+x5Mz3HZ0EhFl0IXg8Jf4H1Gme79Rj5lso1s6b65Wf0hTheNrOL2SMUURIF1sj+LvsQFXedvSc7PbltvRG9uMAb@vger.kernel.org
X-Gm-Message-State: APuU4Z8W/ChQPBrIi20FOUXtCoydCvRIEa9VSFhSR/fErkMzsr9sFqWP
	AEo6N26T7MMffhs7zavxRSWziIB50D1xgucCDDQKjGgdCEjsxzK6EJ13
X-Gm-Gg: AYBFou1WWuhWy6zzgdjBRcG/h1NQMs6R9iWy/DcGk0JEcfLqxG6uFlV+k79/PiaRAhy
	iIyiu3hgZl4MG+++3x3LnrjL1w4Tn0HVlHUyEEXxcdu6fACBL9GcTK0bTjHLJ1oKQTt/5AVbRSc
	1UWeOtjOpCDkzCa8BcEm1h8qm0uxmyymxFfnDsSLwR+s1tgaen42qAFMST9WhKXTuOCoZBUjsWp
	nSvr9NSkuIcm9I5kOmCfsojssmt+OZzn5GCsje8HNExnHmNEczKgOBrSScpPx2tijRMT7hwmWaU
	YSKBKYWkWoIzaOFcQwxg0T05Mxp2jGIQWoNV2IMRlu3UoyBafU2uiltDf6sZwiDVP/brJCEg8DV
	7SIWbCbVdzAoCq6Dd1Poaa6GsvzH4VmpI1b+HnrWWWWgUJKdXefy+Gf7DnlyZWgiYlg1hARfuvZ
	4EXeUtOocq1y+3DKmTTwBqbraWspTIEpFshwLyLAaWQNbWSCHiizoNYoqAXF9L7DraDmP30dlGJ
	8i9WwFmrH5SBIU7KMe+jERMtgjTZWAhCWDVu5hziBhKxsJcnM4rN3IKxg4onQE0fe0+YroqhYay
	8JIl8yKDtFw5ra8gUJdoNQdk0X/6O2TmoqN7mcIdbTjHTalN
X-Received: by 2002:a05:7300:e9d3:20b0:369:fe81:a575 with SMTP id 5a478bee46e88-36a4243ab94mr33257991eec.35.1793884726829;
        Thu, 05 Nov 2026 05:18:46 -0800 (PST)
Received: from ThinkPad ([192.220.23.71])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d3754sm22685561eec.14.2026.11.05.05.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 05:18:46 -0800 (PST)
Date: Thu, 5 Nov 2026 21:18:14 +0800
From: Qiling Zhu <kmatzkaczor244@gmail.com>
To: Rong Zhang <i@rong.moe>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, 
	"Derek J. Clark" <derekjohn.clark@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Henrique de Moraes Holschuh <hmh@hmh.eng.br>, 
	Griffin Kroah-Hartman <griffin@kroah.com>, ibm-acpi-devel@lists.sourceforge.net, Lee Jones <lee@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Pavel Machek <pavel@kernel.org>, 
	platform-driver-x86@vger.kernel.org, vishnuocv@gmail.com, vsankar@lenovo.com
Subject: Re: [RFC PATCH v2 0/2] Add support for auto keyboard backlight
Message-ID: <aux8zfwaupCb3wey@ThinkPad>
References: <20261101100123.28749-1-kmatzkaczor244@gmail.com>
 <20261102151211.40701-1-kmatzkaczor244@gmail.com>
 <c1bfa5151bbe73977725305613842f94616a8dbb.camel@rong.moe>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c1bfa5151bbe73977725305613842f94616a8dbb.camel@rong.moe>

On Tue, Nov 03, 2026 at 02:13:55AM +0800, Rong Zhang wrote:
> Hi Qiling,
> 
> On Mon, 2026-11-02 at 23:10 +0800, Qiling Zhu wrote:
> > Hi Mark, Rong, Ilpo,
> > 
> > Thanks for the review comments on v1. This v2 addresses them and is
> > now split into a pure refactor (1/2) and the feature addition (2/2),
> > as requested.
> 
> You don't need to refresh the series in a hurry, unless you've got enough
> reviews or may miss the cycle. Asking an LLM agent to refresh the series
> is easy, but a human being needs time to review your series.
> 
> Please leave some time for others to respond.

Thanks, Rong, for the detailed review. I'll rework the series
following your suggestions and take some time to understand and
test the changes carefully.

Thanks also for pointing out that I was updating the series
too quickly. I apologize for not leaving enough time for others
to review, and I appreciate your patience in explaining this.
I'll be more mindful of the review process going forward.

And thanks to Vishnu for clarifying the Auto-mode capability
detection. I'll use MLCG bit 20 to determine whether the
Auto trigger should be registered in the next revision.

I'm very open to further suggestions or alternative approaches.
If someone has a better implementation or existing patches that
would be a better fit, I'd be equally happy to build on those
instead. My main goal is to get this support implemented properly.

Thanks again for your time and help.

Regards,
Qiling Zhu
