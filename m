Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793033510;
	b=fkmdJBphV/Co8B069rNjg2+WH6fs0pWH2wyNEqmkz0UIVHv9uKph4ucfsD8idIc+o1Q1
	 /HZ35u+R/XaQ2UxtZd3G7hc6IfKJQyyVL+2Wnx8fYHc+jMKltBQC70xmDit9v6t9i6AI2
	 6hY0cg94re02lJXA2AQScKv5j/eJXRhxGMwoXsP/draAQzXCUzWlqfl2TR7uEwYvB83b4
	 NJtX9GjztZz35C2NdJ9npNceRhMldWDvlrXtQaHsNqMrDNxziYnLoMbdDB+P5hg/YQpqU
	 DqbTHXe33SMTX94rOVIxCyCsw+HwS9CkxO+V9tyWH7bY6xs+tFWp/++tuctD3+9eUGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793033510;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=dtKLsORLC3Dq1HjST3n2TBV61E/8t4SswHGh190Oibs=;
	b=kTnL6aAN5hl4TtKj+2I22mU4Zey5LaGBxLC3zWnRZHGi6PuT1kP7tNdnkzXINv/joUGb
	 +SymtDPJBXNlayNbI4qWGKvNLbbD8xL9TG/SRqDa0wliZlIom3WWX9hLhUK36ci8kO4aO
	 +CqHtzP5F8K1qpO9NauQQtzuhd0a2kKrrVGkR5CVNILj5h13f53WJaOs10n878shsJe2v
	 XkpQ7qvhqRVl+hj0h5rWH1kjndWup8L/+NksWPzthuA+EXIOSOwtHKtu2ZPRYagrUBklh
	 smxM/dYDcBhd5zC3OgD4V6uiGhetVOnGLtokXK0vOOKrBBrP8sa0df/b+8sQAAHtopw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=o1Tq2jFD;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4548606A336
	for <platform-driver-x86@vger.kernel.org>; Mon, 26 Oct 2026 16:51:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4548606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=o1Tq2jFD
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-15943c9c005so4164115c88.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 26 Oct 2026 09:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793033509; x=1793638309; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dtKLsORLC3Dq1HjST3n2TBV61E/8t4SswHGh190Oibs=;
        b=o1Tq2jFDtS9lB7tsZu0pJlWKiAHVBa+5z75/qKJp/wcwwvvwTl8/3XanNkkXN3mUuV
         NcpFLm7VAqkfM0WFlCz5HIR3rBPSyEhYq+MvEpVbnVVBK5Cg9re0l9CC41YYfyYdUY5V
         q0vqnEDmC2E6vvs92qhclfRaJhugkNRFS1IStxLdr3OvpEtVCEHV4a15I9bnl8F5kcGW
         VNNQ1zw5WUA2oXWIaJWD4n+OZXJ+Of7lHt5JVszUHw7YoPl6uavT/WcelR2w8/QrrOEw
         /dm8nylbT1zhnZ13ZoDJcpbpVV8hBtBA/am1Z3O5xMrg5grmJb/e+6CaDn+QlZttvXaQ
         hQVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793033509; x=1793638309;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dtKLsORLC3Dq1HjST3n2TBV61E/8t4SswHGh190Oibs=;
        b=FDAAxcwNTNd0MSIX97ZgTLHBtiBDlLpoJP3jX67xfNfHFoBsuA7v6FB1RzUXcSWAc4
         Dlk2udbll9RKYSZ07f5oIU+0mg4/29hJFljnBpAPk4aUMJRI496O6/sUwNKt3lry/sYQ
         QHlg5o7puPn0qjHJMyctwkwGX0M43NOW5PHGM8HzGhWXGZBHHl1I2JeTcwgRol71vu08
         cUMHFo1XwidRi+3T+VB6OmFFrMqLxwymP7PY9RQ8GxPeMo2hRROCvMLjlSyMFjWRb3ey
         jqXy3RuCnG/RpJuoARnbGRSuTI17Q+OrFTbuRevBK34rOwl/Wlv6UD+Zb/dLkXpUWT9d
         DZOw==
X-Gm-Message-State: AFq9FYIy3LnxHosgF7dc4AoHKM9CAvWuDJiR5oXz00dzAde/aL9qQYl/
	LXjIKBhMMbKfVwM12jcf9cyeCwDzSeQVguHkDTMTLpxmjALZnywwwMjX
X-Gm-Gg: AYBFou0lVHKu7EmzC/CUN/8AL/noenxRISsTdJVE8zMbFZ7pUIeydoE6tHN5LGRNiFU
	o3nKybZidVUWZAXmIzFKKAx8sE6ElleiV4hsJBYi9BlehXRIXvoJQ/naIi2W+AK0wZoDTLfDsXN
	G8XqfiOM0Ic/9OlOYAYfrijriTvqiZkJDloqxAaLK1l5mYsGjd3URN3xG+DCAYZzoOfCPaHeoWw
	EJX85yX5su8/RaO6IHnBkHMyBx5it4Z6tEHTBAg5B+618/+Oi7yEj0jZyCL+2cRgbgv0lU6QjQA
	xWdqaWjZ5ExSA+vTCSEFqMHhBWMa9oVRn05MTdDrHBmo6csFiZs5Uxd3Krg4dUaIjyzxjQYPHHg
	yBECDBqSSGVkt0aAXUTNlDpoNwwcJHgAkJsf0oPq1pKsVmrQVdDLM6xG5KORUzThDknvatFiZKR
	SZilXHkQbllBtcjuYZ5GVPeVFxvoqW98ZN10tM3OkBdcF4RBsjKJ6hv1CZOdw7hwMdZwwJKK70Z
	AnrKnaipD59gKuNcUgjiD8f1EKII6Zc40F2Bh0KfuyGrgJPEsIWKKF1lrwUcaA+VaouvdYgt4D4
	IYHj8GExuapsa3uCYXumM5foE+c8CKzNfriPMt1VSonAhfSC
X-Received: by 2002:a05:7022:ea9c:b0:19b:39f4:88c9 with SMTP id a92af1059eb24-19b39f489a1mr7790682c88.10.1793033508532;
        Mon, 26 Oct 2026 09:51:48 -0700 (PDT)
Received: from archlinux ([2405:201:1b:2287:7185:29f7:fe15:431b])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a277b26csm29217532c88.18.2026.10.26.09.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:51:47 -0700 (PDT)
Date: Mon, 26 Oct 2026 22:21:43 +0530
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, 
	Suryansh Singh <technosfan14@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	Julien ROBIN <julien.robin28@free.fr>
Subject: Re: hp_wmi: Unknown EC layout for board 8C9C
Message-ID: <at9_5FMerTdcbJt7@archlinux>
References: <965dd816-dd66-4318-be8d-330a40209f67@free.fr>
 <asPy5Q5wNYaMzTqJ@archlinux>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <asPy5Q5wNYaMzTqJ@archlinux>

On Tue, Oct 06, 2026 at 01:30:43AM +0530, Krishna Chomal wrote:
[...]
>>But despite this personal opinion, for the 8C9C, playing an HPWMI_FAN_COUNT_GET_QUERY, and guessing the current mode is performance mode (0x01) when 0xAE register says 0x00, and differentiating balanced and low-power modes when 0xAE register value is 0x01, may probably be done by looking at victus_s_gpu_thermal_profile_get(), as prepared into platform_profile_victus_s_get_ec(): I see that Krishna Chomal had this idea. As I'm a beginner into kernel development I prefer let you decide whether it's reliable enough, and/or worth the effort.
>
>So, I was working on a series to fix this very issue, but now that you
>have brought it up, I think its a good time to ask you and Ilpo Järvinen
>if removing **ALL** EC offsets from this driver and relying on only WMI
>queries would be a good idea.

Hi Ilpo,

Gentle ping on this. Can you read this thread and share your opinions on
my proposal to make this driver EC independent?

If we agree on removing platform_profile_victus_s_get_ec(), it would
affect at least these patches:
1. https://lore.kernel.org/all/20261024-hp-wmi-rechargement-v1-1-45d9f8447f41@arnaud-ungaro.fr
2. https://lore.kernel.org/all/20261025034539.4565-1-nonameblank007@gmail.com

>Currently, the following four EC registers have been identified in this
>driver:
>1. HP_VICTUS_S_EC_THERMAL_PROFILE_OFFSET (0x59) [READ-ONLY]:
>   Used in platform_profile_victus_s_get_ec() from params->ec_tp_offset
>   Used to reverse map the thermal profile parameter and derive the real
>   hardware state.
>
>   platform_profile_victus_s_get_ec() itself is used in two places:
>   a. thermal_profile_setup() during driver init to re-apply hardware
>      state.
>      We can remove the call here and default to Balanced
>      mode like Julien had done in an earlier commit. [2]
>      I think this is fair because the official Omen Gaming Hub software
>      on Windows does the same when re-installed.
>   b. victus_s_powersource_event() - to derive actual_profile. This
>      Julien needs to confirm - if we can avoid doing an EC read by
>      directly taking active_platform_profile, since in my opinion,
>      it should be same.
>
>2. HP_OMEN_EC_THERMAL_PROFILE_OFFSET (0x95) [READ_ONLY]:
>   Used in three places:
>   a. platform_profile_victus_s_get_ec(): Already mentioned above.
>   b. platform_profile_omen_get_ec()
>   c. platform_profile_victus_get_ec()
>
>   (b) and (c) are both used in omen_powersource_event() for the same
>       reason as victus_s line as mentioned above. I think here also
>       we can fallback on the cached active_platform_profile (please
>       let me know if otherwise).
>
>3. HP_OMEN_EC_THERMAL_PROFILE_FLAGS_OFFSET (0x62) [WRITE-ONLY]
>4. HP_OMEN_EC_THERMAL_PROFILE_TIMER_OFFSET (0x63) [WRITE-ONLY]
>
>(3) and (4) are both used during set_ec path of the legacy Omen line.
>However, since I do not own this type of device, I can't comment if it
>is entirely needed or not. Interesting though, this is used in only
>three devices: omen_timed_thermal_profile_boards[]. But anyway, I will
>try to contact someone who sent these patches and see if I can get their
>acpidump for more info. I have a feeling that at least *_TIMER_OFFSET
>can be removed since the delayed_workqueue would cover its use-case,
>and obviously because (afaik) the official Omen Gaming Hub does not
>document/use any EC registers and relies on WMI queries only.
[...]
