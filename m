Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794223695;
	b=L/qYfcTObNIWhrXf1iV+1c5glTBq+SjHHFpeiW+nc3XkQQ1mqPBu5XnpD5Hxx5XQvVEK
	 mSXtlpp0k9fV2rbo30oz6pByPjOgA3UkotmMwd63mXsvqqTXZqwBrbcIuqLJyuNlPZUlS
	 qeou2WGFArSRPQbuR0O2VPJdvWztwDFpPYvefofNFL1WdJm7NbRNusS5a+6SHUfj6DXSl
	 lofmrAR+lh6hALI15QjeRYR5s5dCFNMAk1mxdVL5D22lRUlF1f+h1IafVcGa3IN786phv
	 iyihisSwT5WWmzkStJoBIsOtv7vQ3PGGT+NRoE9Zz0PO8eE1rDTF8Kb3sLVmxZLBhXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794223695;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Content-Type:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To;
	bh=uL6RhmKuwLbd3W7zN8nw8Ct6B3sRphhKnmHsX+nCe0I=;
	b=LjE6ijyK6cp19yfyYK6q0RTMFK188sj8142HDm4j5B8rfOXtvTxP9SOpPNQFzxM/mEmZ
	 wHH1WppY4LFirsd+ci0VEdUgOHhOBIYYgW3nwZaDQGhpjkwtxUaQ6YWiJ80FC2qnTqL0W
	 z61iQ9PC13tsB5aPrIA/dFOe3uiOlZz4iFH8Q0WhPan+rdJVIZ+p9EkvGTuGiDbrAczKA
	 oPm+bZtDfRLLzk1IQdx5mjQveJvl+gJU9bHdvJJFrjHOxACTsrVzMHQfGCp86BCcZIbEM
	 PRwfPFprxXc2g8+lCVI6a6eeCZ3jSHvsAX9p5yBgPKp0QLaQeUDwsWi5KFCz17NW5Ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oKnkAGRG;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A273A606A31C
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Nov 2026 11:28:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A273A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oKnkAGRG
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cd6acc50b8dso224473a12.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 Nov 2026 03:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794223693; x=1794828493; darn=vger.kernel.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uL6RhmKuwLbd3W7zN8nw8Ct6B3sRphhKnmHsX+nCe0I=;
        b=oKnkAGRGCJSIK7Bru1zHgSOtI5Wv4TT7YwLx3ru+VIPkzZEq8ivBjEpPv1MLvpuJrf
         686jfiX5V9Zwo9/MXj9/74013S156UqWGvMwM9HELMMWy8cB20Ztsd9aZkKhZeCnu4y9
         6Fo400XowQk2Pp0fl/Uxz0V+Gf3K2oMMd+E98HZM1Eqg3fyrnSZKrnSjo/tXVv3d6MxA
         oLF7Sru54kas1Exyr9QoV6zhUrh+4nNP/GuznEmjnjaYOFSRaN80ZzUsbfPMdLFavxDg
         rrKQsGqrFqfAKhn1BqIVwtlgkC8RX+SWOA2MKHLba1ENUk9HiHRXRa9ec/+TPB2vbfRY
         dg6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794223693; x=1794828493;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uL6RhmKuwLbd3W7zN8nw8Ct6B3sRphhKnmHsX+nCe0I=;
        b=wavzu0hQcvMV5F3IC2fnpA5/e0ZRfUHbAoyN1ywyNqYnfAGecrGPdeC3EFzyngomsb
         Ob0X+86HFZKLut+Hm9LcU41csdhTyFcPUgJLkgUchxtncO4LVdKc+qP/QdmUK6uOb9AE
         Er1mgyjWvHisPj/deg211seDzN53D50B8Yhr/9Q4W2upLu3p33L10gkZ+dxrit+tgNWT
         qbHEQS/hx0TnDJtYbEZ3ANlcUVyMfg5LeBTUn4RdiICEjbMYu6robKq+ZjYLovqDAWIB
         FaL0vUCLwyYDw2A7j3g5lwSF2gxJuz4zsESdYMGkLqWE+OqGDx49y+bd1dDAxPSg+iF3
         SNPg==
X-Gm-Message-State: APuU4Z9gwMtc4PAZ0Yg/sW4ubNYxe1WZ4wf4BDVyyqICtahC0LLd6S6+
	viSq1L9zrR3m2U2wLFtabnIq/uPd3zbvE/e+D+8naOazsU8lo4ZFFwRX
X-Gm-Gg: AYBFou0wFI0biwKvTqWtcOClAVViy1OQpqo2gc9LHwxDt3abJI9xfYYdiwJKIXFtGYU
	DHuGsXxXpU74oQ02skwDJ2/zkTqPSzwX8mwcLfoiKZgN7QlwgmnFRScj6QX1rWgxz5jT6ZZOvom
	VLs1D9CvvmYz9KnGSpfiDx+OtWPRc9eF/k7i4vDnE0ver//vQb/z8MbdSMd7t44kNvMIoECG/CJ
	OI9OYHZx17vXKU47adQmNsMMJztbxUeSOtbq93RLG2Qdpk4CuD01C+gRtWuxa+1htWbIQzRXuEx
	43bdHYY/fxFW3wmo38Ka4l90KMDH3+cWzPF9Gi7m164o8KDZp2OD8hBczcVgBdfs26kt4Ru++LS
	UQbvTEfO9zQLmSslGZVbUn9MGWbAWTLLf4ipZJ4CeQdK1gtTR5sFC9K1u7dFXtXsBkC+E48M8IL
	btNLSybogQ7+l0D+rnz2YY1JzU7aHoYIFbHkrjOxSFTYj0Cf/VWKcH4cgvxitYv7BUFhbxrzG8l
	dpxwMWvTLZg+wunPAQnuSnCfrIkraTX+vt2O4/COJnfwJKDLZZwb4JtjtgsoQFruVoKrft+EWj8
	gf2aIG5kUVb5RGQ0vAIU4qSCcr67GN8jF7Zl2Q6FI99ZdiK6j8ypI9MEEDGn1i2umMkn
X-Received: by 2002:a17:90a:d60d:b0:3ab:1b1c:8a70 with SMTP id 98e67ed59e1d1-3b12d3fc0a3mr3218214a91.38.1794223693512;
        Mon, 09 Nov 2026 03:28:13 -0800 (PST)
Received: from ?IPV6:2408:8210:2436:950:53cf:9f18:268:d90e? ([20.89.137.63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1057b17f8sm10509800a91.1.2026.11.09.03.28.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 03:28:12 -0800 (PST)
Content-Type: multipart/mixed; boundary="------------eEY0seXdnSNL6YyQVbiaaKUv"
Message-ID: <08e0f238-4330-418b-ae3b-fa7ce0f6ef62@gmail.com>
Date: Mon, 9 Nov 2026 19:28:09 +0800
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
Subject: Re: [REGRESSION] platform/x86: bitland-mifs-wmi: platform profiles
 cannot be changed on USB-C-only RedmiBook Pro 15 (TM2017)
To: =?UTF-8?B?0J7Qu9C10LMg0KDRi9Cx0LDQu9C+0LI=?= <rybalov.oleg.dev@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com,
 regressions@leemhuis.info, regressions@lists.linux.dev, shlyapugin@gmail.com
References: <CA+Kibh6FHk-QgmPsi4spmQ5MHGvt05xYHuRiiMMQdPP+31Z70A@mail.gmail.com>
 <f718e7cd-24f1-428b-b9f7-28bb1a923a11@gmail.com>
 <CA+Kibh6T9tPKwhSF2X5Jwoo8OUoieypuAyM4GBKVujUDWgpr-g@mail.gmail.com>
Content-Language: en-US
From: Mingyou Chen <qby140326@gmail.com>
In-Reply-To: <CA+Kibh6T9tPKwhSF2X5Jwoo8OUoieypuAyM4GBKVujUDWgpr-g@mail.gmail.com>

This is a multi-part message in MIME format.
--------------eEY0seXdnSNL6YyQVbiaaKUv
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/9/26 18:43, Олег Рыбалов wrote:
> Hi,
>
> Attached is the compressed acpidump output from the TM2209 board.
> The MSDM table is stripped since it carries the Windows activation
> key; everything else is untouched.
>
> Thanks for the reply-all tip, using reply-all now.

Hi,

Here's your quirk (inside the email attachments).

Please apply it on top of my patch series in this email: 
https://lore.kernel.org/r/20261028112742.674847-1-qby140326@gmail.com

--------------eEY0seXdnSNL6YyQVbiaaKUv
Content-Type: text/x-patch; charset=UTF-8; name="TM2209-quirk.patch"
Content-Disposition: attachment; filename="TM2209-quirk.patch"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGxhdGZvcm0veDg2L2JpdGxhbmQtbWlmcy13bWkuYyBi
L2RyaXZlcnMvcGxhdGZvcm0veDg2L2JpdGxhbmQtbWlmcy13bWkuYwppbmRleCBhNDMxZDNm
ZWY3NzQuLjY0MGQ0OTJkNDZiNSAxMDA2NDQKLS0tIGEvZHJpdmVycy9wbGF0Zm9ybS94ODYv
Yml0bGFuZC1taWZzLXdtaS5jCisrKyBiL2RyaXZlcnMvcGxhdGZvcm0veDg2L2JpdGxhbmQt
bWlmcy13bWkuYwpAQCAtMTEzLDcgKzExMywyNSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGJp
dGxhbmRfbWlmc19xdWlya3MgZGVmYXVsdF9xdWlya3MgPSB7CiAJLm51bV9wcm9maWxlX2Vu
dHJpZXMgPSBBUlJBWV9TSVpFKGRlZmF1bHRfcHJvZmlsZV9lbnRyaWVzKSwKIH07CiAKK3N0
YXRpYyBjb25zdCBzdHJ1Y3QgYml0bGFuZF9wcm9maWxlX2VudHJ5IHRtMjIwOV9wcm9maWxl
X2VudHJpZXNbXSA9IHsKKwl7IFBMQVRGT1JNX1BST0ZJTEVfTE9XX1BPV0VSLCAgIDIgfSwK
Kwl7IFBMQVRGT1JNX1BST0ZJTEVfQkFMQU5DRUQsICAgIDEgfSwKKwl7IFBMQVRGT1JNX1BS
T0ZJTEVfUEVSRk9STUFOQ0UsIDMgfSwKK307CisKK3N0YXRpYyBjb25zdCBzdHJ1Y3QgYml0
bGFuZF9taWZzX3F1aXJrcyB0bTIyMDlfcXVpcmtzID0geworCS5wcm9maWxlX2VudHJpZXMg
PSB0bTIyMDlfcHJvZmlsZV9lbnRyaWVzLAorCS5udW1fcHJvZmlsZV9lbnRyaWVzID0gQVJS
QVlfU0laRSh0bTIyMDlfcHJvZmlsZV9lbnRyaWVzKSwKK307CisKIHN0YXRpYyBjb25zdCBz
dHJ1Y3QgZG1pX3N5c3RlbV9pZCBiaXRsYW5kX21pZnNfZG1pX3RhYmxlW10gPSB7CisJewor
CQkubWF0Y2hlcyA9IHsKKwkJCURNSV9FWEFDVF9NQVRDSChETUlfU1lTX1ZFTkRPUiwgIlRJ
TUkiKSwKKwkJCURNSV9FWEFDVF9NQVRDSChETUlfUFJPRFVDVF9OQU1FLCAiVE0yMjA5Iiks
CisJCX0sCisJCS5kcml2ZXJfZGF0YSA9ICh2b2lkKikmdG0yMjA5X3F1aXJrcywKKwl9LAog
CXt9CiB9OwogCg==

--------------eEY0seXdnSNL6YyQVbiaaKUv--
