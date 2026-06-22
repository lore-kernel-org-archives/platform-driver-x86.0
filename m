Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0DCA34DB6D;
	Mon, 22 Jun 2026 20:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782161127; cv=none; b=Btzb0Uz4igWdPtrmjszEvSb82nZWDnYoz+XDMQRMN827uGMLLgvSvFum4Q0XzA81Q/wCC9AaiRA2grs5ehtGj8lyeuPSWKVX3XD8fSCktYnkJJUlQPcyM2/Ckzt+a/VEnbsNNqT6mTAeSs7dHVri5Hk3EGP4KwNTn5QvUKvjyKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782161127; c=relaxed/simple;
	bh=tIvjJaeJ00TgdkhkNeg13JiByFka3YLuEzOxcBrD1WM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LRTczL9zEJJ5cjo0lQ+vrb4WOxyb3nMMK1VFT2HA0i6x8XndayAqfaEAZiss0ipaXIWJuvPc9jim2fA/S/sLirOzcLX3Gp43CjnhajyYkzln070vthAY2hheeFVFGxXHiqcrxU5qs0eucdKMa9bdpq839aIoKXUb4+FdDzmMdPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=tZREKQx9; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="tZREKQx9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1782161123; x=1782765923; i=w_armin@gmx.de;
	bh=1htjPRdaqEQq1mGkWOQtvMXL7wYtReVNzXpBP7PdEU0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=tZREKQx9SUPZkqXPGS2jBK3wyWT3rg5lgxepCHucWdqVLNpY1PxunQyupYwSZ6xO
	 umPDOTLp0Dscg2O+xgBQYWr5PKLz5CXxqUWq812uyfcL3wslN98RqYszHkkdNr+Xa
	 TifUWX54gcFGzY1VTtzvCHU+ESUDHqXhn78JISLu8nx6IFxStcjuDT0acmi1N/LCS
	 xYalfYyL54SfaiUgfHge9bIM8j0BDKZlENyQqGhW7T7bt8bEWz/iUfqESTsOMqcXv
	 VKjFK5WvRFynZJp7SFrJKAiO3G/Cbiu0LcDInbKT+W9FSVxylM2D4oAiCawftqzFA
	 DI9BoKzz7GgNduUteg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MdvqW-1xCT7F0ims-00cLCe; Mon, 22
 Jun 2026 22:45:23 +0200
Message-ID: <12f6446b-2f5a-4c9a-8f89-93b8db94b818@gmx.de>
Date: Mon, 22 Jun 2026 22:45:08 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Re [PATCH v3] wmi/core: fix use-after-free in wmi_add_device()
To: yahia <yahia.a.abdrabou@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <f0cf19db-7ef0-41f7-884f-92002627e147@gmx.de>
 <20260622202514.41504-1-yahia.a.abdrabou@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260622202514.41504-1-yahia.a.abdrabou@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:xelB/bzDcAXGRI+7A2nGbk+hFnBTDi9LaT58gZcvkALWDQtPcMN
 VKicjf2rU3ppVfAKiBtN9AEmnnkG0IWIM1In1O2XD3UNSZBzoq8pTzn1Wlj2AlJ7diRD4+9
 B9DOOF+vWhjnxMjGg6ldhxqrAftAbq4ZU8OoKT1eSlA7p3PkKpdC0gpi/8s3o2ktq8T7wQj
 YDHvLaaydmG3HEGPhYVTg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:MbNPcU/hyu8=;sjBZsjnX7uwxvkW5c7ANzs8wlWp
 uislggQA4Bdc6EdPFANblGEZaBUmwmPs/SqrkqNQWVqf4o/kUoNFPez3o23L63YKKLeFEu6Ro
 0wNZZE0dRY2AL319J3JemKhrXTSFGVtuHwPeTcEktGaueigAeX24ZCXbhXyUBzV5TiPjhoXjz
 GHnF5TArdiVT6Tusk2YsI7OKkFgEzsFaexwVn/q0TIossNenwC12C2+iUDpJb+bFSajDlWhub
 TA1DO4pJKN9ut6PCrnTx1IbHaJDBwwvRM4UVQMzlJF3puGWrAFy0C0xaYsuQ0lBnbf166jBx1
 yArPlo93cBPb25hInWwHCpD+M6iZkMh/OrVO9UBkHDzbTg5d/lygZneOpHU0Q35zOignRS/UE
 2Gd0f/Vf06mStzZctvhXSsvzt+J+wGe3czyaXLbi4wjHfQr7ON4O9M2pDK1pCzvZZ7pJy47d/
 BFhKd/u7PzU+SkoonAR1sMtYGPuK5Fr1IJOEUWahmUirbvIwA9C4WRkAL8Sg5XmkwkjAORjdN
 bIU8ByKfhJ+ObawrAZRp3LKGPk40FsUvU52oK7Z09+qIxEnKdMrrqz9tg/oaula5+behYX8RO
 6FjSv/nsPRlSAIpW974775bAoOaMo7QkoqYFn2Ygtq1RkbR6IY1Vgb7XTnIll2YSE8zKFEhLb
 TaoZxpaZw6UX8Aslrux1vbc/oUZ+Vaiy+/Jkr43wNZK73N1OH8fUgnvLeUaWj9YX+zubiyME3
 IagkeK/pZazHL013dmlPRbQaL6aHLKX1W/PcCrf34FvVWZIFjMSgWFHF1lEvSemMWzSy73KrY
 kEL/wdP5GYRRY0F4fp0LJffznEGrk04ALbjZSfrxSFL0XyYcDJxWQ7RjG1ySQcp6dhFHX6KDJ
 ovhsbXxY2hosleMuH6+mm/Lqrfr81sP4vyMpDiFquNrXYVG8yiGSFSKkYYqyAXuB8ZGlY/zFx
 E4ar4Nbp2HWkucnd/qqrjS0fqm/hXCndrYYI3ojl8+sKh+4unlMbVr0HPEMLN5SD3PxjzsSUE
 BWPIc9OK43wGr7wheJNFePo2y1lwfKwPZ0YTZGF1Je+Y4gjKZMtcgZZ7a81U867kXJHhjox35
 mr4VZXvFsz0QdrDgWYAn1saSTsGYfiifJfDwN6BsUEL4RZHBxAMOEhc3ZhI9d/Rt+6rukjijd
 qNlwvanVwOkYFcY3ow7OptTUz6kN9hdCxfUum8narNb4TrKSHsu4j2+aE+0TnenjJWIcsLPjm
 jDYgm9c+PI3GkWqn5PrVOFGEn5c2EInpJxIaepCqQmsVfLN6ZMcEY9isMrUQKCHhcv4LVnS0d
 oM+xmjg6dbwh6W/Z1rmFMQFZBQSNNlcBvHbGxDKF18QQKHgKHJpotBZdpDkexXMYaUzTQXtzz
 gEPlNNVVivRvt4Zs72M0rmRCLwaPw0jnM9esG2m/PLS1N6+rMOp9JeTTlNYPbc/MwM7zZXr0o
 iYxgyrCB63PylUL5FRvGSI2MVuov352pTLVDT+6ltXgpj2kcW+VuZK2KzTdHL0dpwFX0Xv5z+
 5G0TLVWAHG4ZsglamxLSflf8wjcao9qajp1+wzTFTT3cF+9xCnlo4e44NkvX/TSxvK1/Mu/Wf
 bPRsB7fcOLLzinY10+GXyaxxEq3d0YfkXcrB0kJveIIxO2m6rF4ywQvFXUTL2YJ4BgQTEY3yO
 oBBdHDXJHfh9MKeS1J/q2XxvzYitc5Iy/H7bZbjBYBy9jli/e315bvHXYTjei8U9XNSZSeD3m
 ZTsogXE1kUkv+OmnY+EM5Wwkgjet07uJB5V6yfcgf/fe7p8UWuB1XI+bX/2gQA7sSqVWPavLC
 aEvHDY3jLsmEqy3uoKtVRu7A6680ePSBcdAzZm9yNAgGs0SKxWwg2j2REdpvSfvkRs9YPp/6Y
 I0Urcmtv72xf8YHVozV/PALrUwGpm6FZZv/iCuaDTnpWwXarBALsymj2YraALQQQFlmQzFayu
 dq4DFmdQ8Z7oT+DOaTX/3GZwrWnhpjFU6HeuTgVNcTTppnCfd9dzTYnJPwIBHLH4LHXWKT5YN
 vG9SDnxnkmaH44DQMEOXWv33hUMaRIR9MvJa9kbS9Z77oHQBEnCHxexasbJdO/msr/nP345RJ
 9eLr3Dn/YZ9ZJkU2ZhqRr2NkaG6VRHN2J830KNZPK/pYXxT6VQ6+DmjW1jyOnoRAkEeDN/SFP
 ps5KwTzaVpHB6LBb6j+XNtLvvpLPxuikgx5vN7WL7HimXevEytoVXzsaDov0ZCEarKg9YUVnr
 E/+OMfMllc22qWa+bwL1yyVdXS6wcIuXGR0o25W1vg0OQ/JQb7VYzG1RAEXbs8qG+Pv1Xzzex
 TSUFZkXX04AAkjXgbXMrFlVqSkiM4OB/SL98gRPHMYR5aOpDnk+wcpC7GtFc7We2aEL3q4Zoo
 Fz7vFvl8B4m36QkOKWmuokhICnbYt34ZAT4eefzbpAqYb2K5/ISZCsfGSkdURDt2SoeBf2hE7
 +Ixwf8BbKp6nQYN15+KYjrpdL2pP4K+CWtlCBb9Z4lPJ2sH3+yd0YdG6T6Cn/ekvGf6fQZGix
 eo+qNQYbi1wsuxgPwX1ZRkxh2AEv9ZNHPQ8mN7FOVq5SFI4LIgQ4o/yfRcgihjG4vSSA0zwNy
 FmCJL5O6VAIBLcpwDFpSdLL0cswsNUbmslHCjWaUBkS0h+LWR5H4mGtLhDQ/kCMMY41CiN+8N
 16FfbWfRquw5iogFRSLwZX9EYVDVaRvmUhvoW+AnsfNXeFgoK9r7/JOby18bTHnHOqgCKd/FC
 PHoRA/7LOsc+ZAO7aasa7lo9bMznqdRzXuiPv3yedJLUQ9eh+x+n5Aa0fq4dWev6h4AyPvQP6
 QlAb7gHjE4hUuVpgiolYalqOx7AVc48Lln3tjGFWD1uDB74aIzMfNhjzihYaTe6kn2EFqvahM
 OF4Euw6MZOIkY2J/tk7GIH6YjUUwt4KM5vK+8V/278/TAf/FG/xymrMTP6e/KiVCYEA442fxr
 oOsQSHCcaSbSwCgobx3F9EuaWxCOfY4hp+zqSI5R9ZDUkOS9FSUD4JsxlQnCLyKS2WlVykvrU
 g0zct1+eti9smTz7Dv5N4jxk2ZSgr9dB8TM/9f9qd+wplqhlBwbkQEweqIcwsLVjI06WyA11F
 3KqVO2SN2R403lKWuD4XBAkyHeYQbKgT7KdFjH0SH/L0bSvgNii87VUvuvq51WEAv7LgrQJvG
 BadD2QTR+YFgD9UtXB4QdNVaTfmDx66UYdFMzyB+pqiY0woftMGWYmm7Zr9Sd8f6DUjCFqih+
 talmSjlL0RzIKM21vMkebIcxQVEfkQsk7zt9+dySVPLRtw942f+ptpFmCPGf6mwI0T9zCudLJ
 zsc/QGakNxlqcZm+DXXO4Yr43R8XUKmpjfLjWbngTKurAUJkQuMDQvCjcmkRVPI7QQ8EF+LR9
 YpYNNL6MlbryyHcrjWzevy9+UW3fpP7FUQ828Y8/JL9kRJybyl1+ZdYQe3RB3MuyMvH41bCrx
 b8UNKOiFphCnIXs4JbK627ts//39Hk0tswqE8WWT8MjYktZCuHMsEVO2L0vgGUXmdhIkaOcDr
 V1IMKXjMZx3FRse/o0Qd7RakLgLcwYDXhJC5wnse15Vv8Mxg6tfZKxjEj3ERYH6Ovq9osRG0L
 d1jV+syo2PkomMv6ZEUshFExpmTLvbGKQOp2ntNsWeRuVXUE4KmMbzZoK9nSbC71bS/vsQSMI
 wKdbtwnlDbSp/DDDyaMn42p6EBVme/H2Xz2HGo6qOqbXwjdN1ehriwLd1lm8f+X9Eu7RWXK9Z
 vAAvzmDpCMRy1TMOCEKg7AmdsdA7y2khFnklQW38JX7ajK61E8MbS8hjgovPP7UuBET5PisRF
 Q2zDIHzqyrBCrzs9fgrH1TCUIfi3Bk6dIrq0pfcsKaUgipcuKumnhsZnjgVm1/Upc7rRb/HSe
 Uo8PPVksLk0CNBGKeusK5daGs+mLfn5mbhdF9rE0qYnLrGZTTx+Zcqtn7mLJezh7Bx7x3hl7C
 lXkeuGOcEc6WJSqNTa4Lx+UmMkFabIfsxi1kY12og0rGDIUF4GkDypXlYE9oHbm/k6ZEn1kxv
 5OLk00YXb1XuQAZOOLV03SPdi+ddEuIUszS+a1JPIrDJuu9uLXWopRy4VVc1T8XxBq5x+bJ2N
 yIu5CoL64+QypA09+aE7jAPA5b72Ntu+yDD4j+JIazNwzut/XkPdHNbqQY9fHrOtGCbOb/x8L
 Jja4vn5OaGr24qlRSy4WaMO7C8lUqFV1gJ3yme62/EQ1m65P3J+VKERb0+IAN7Kl6nMeXQoIK
 4NupWJyRu8wRzOHZqWeuoy9hp2YjIctiYQqvV7VxKbIEMrQR408iVEkRA6vPy0mtt64ELtM65
 jM87Uabmg940EHhmSmXefxcRKdTxwfMTZhQUQyAW3O28Kk8ozAbvC18mOOlcOIry6BmpcuaGa
 64zmc8pfg9sEYj/TiiQrVU+AY4GHpt2fqABfSGOzkH2+iDm68VHfv+zEvShjQgrdIO/gHKeKV
 B6xzieqN9rX9V+mRffQ/zZ24Vrby1Ubw1NIpTm8pfS8WGjOb8qpLlqq0AaIjNPAODTjMfZcre
 KvW0l8QLpui9iSqlUWaqcdVxgThuG6We9lVN9rwo8cFGuEqUzrvCmr65tcbaUpNrCGP4Danwd
 +Wy/e05gpiTBTHcWLANfiDxR/FrrZlAK7EH51HqEe6C8d9wdFK8NJRAAFVHNa3XM7iJuEt9wg
 n8iZ8Ab1mWwAbE5pC5pfqWW894a+a6IjO5vX0myYY5jwdMWWceLDUtEdYa+vgI25VPiqOWYGU
 a+/FrSsRdiSv3dM002zkMVfxhd19i93TNXj5I4niUTeyCesxmupwgRi2/L1nEI5CEvpIeVKi8
 LGYiFOX7/Bx3mtXtNuLlYU6tfX2s8C+8BWfUu/5Gyw9R3jxkeunqmw0JB+YdnhQvq5VPEETt0
 MFf/ml7AmpRZ86DYRFL/83JNhXbNHkbT+aTpiebw3MqVIwTDw7qEFHac3mTSPfUX5fyc1M68f
 02fnQRLwPpK5f/EcnVcnpGVjIQrKaQl5vYqd6nFML7OO0V5dZJyZsfV+C6tvPYy9hHGRzO7Z7
 h5BBLya3KHspSvxbc1dMpdkbAzocdw2th2R9F96cTxfCMNd/dd5kdwcZ8UmDvudo51OscirQL
 OvqC9CBx8RSKHSVdn6EbO0Pc8u/jOIQxqVyTyfmAqeenMPDsURMxYf5gcG4QwDJqMuYPD/5Lt
 OMceAhQAFgAeJbY6It0eop0l8O2bCbyou3+3MoQhVWggCgKzeqnQoWrQUi96zDXYu8A4vmYCy
 IYb2aTV+NM92LXL/WcQ7cuZPmoQGYdxL4Ttu5XGfz4z2Pcwc5JjJ6Cm2CI88WuBuxjvJm5Yy2
 HHWoagAvh+WpmhmkQCV1cJAJV+Wpk7ESNvWbsX6NoTk3O6h7YdLQ6TXUPl+7OMmjpQ66Q1z3M
 Fs4x0P+UznLF3kphJzqsREzZqsSZI4TcmdUck9Vqk37vOZrcpR65NxptR7fG8nbJAlb2OvCDC
 29QhNiA+aPJRc4o+bgY5pDRDdKdrTDYZbnQFZVFUalnNRw3Z9ofXDNQfqZZHsMAJgO6bzxm72
 V4COTwCJSACLeXEpixxx34eplOM=

Am 22.06.26 um 22:25 schrieb yahia:

> Hi Armin,
>
> As per the documentation, The automatic cleanup is only
> triggered if the supplier probes or unbinds
>
>        Similarly, when the device link is added from supplier's ``->probe`` callback,
>        ``DL_FLAG_AUTOREMOVE_SUPPLIER`` causes the device link to be automatically
>        purged when the supplier fails to probe or later unbinds.
>
> To my understanding, the cleanup won't activate
> here because we don't unbind pdev nor does the
> probe fail.
>
> Best regards,
> yahia

True, but the associated wdev will be kept alive by the device link reference.
The cleanup will then happen when the platform driver unbinds.

So IMHO no UAF is taking place here, but we could optimize this by dropping
the flag to let the driver core to delete the device link earlier.

Thanks,
Armin Wolf

