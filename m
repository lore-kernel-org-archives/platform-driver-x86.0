Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3930229BD85
	for <platform-driver-x86@vger.kernel.org>; Thu, 27 Nov 2025 13:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764251365; cv=none; b=AsgCK6r3jgyBeQO4C8enUgaKr+De22Ph4ysqVOiRcb4mhfzC1JF6jtwYmDWTFPutVNckrNxAb6ox2GVdVvKYFobrw9/37WkcDBHrXBTdvIa/KWfUw/hlpfPQTeWqbejTa0agLkVugwz1cpL6KV1tiINtohx/a5RWmBDbKf/j9nM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764251365; c=relaxed/simple;
	bh=djx46A/t4g9tFTNKTkwprP+1rBHg+hljQCYzR5C8ROA=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WSll3G85bwQuDnCWuaLl0CLUxM7DSz0ITFBDsTUyghbrwskY4og+Z+q1zElePXtj3ds3PNvuiw7HspqgvPFWwuWAXZnieKDEvCOB+WqZntwy91YEA2Dsc64miXsIzk1CUsIMSHdtEw8j48Fz+48+xWmUByHG/J+XqxLgaiBSbsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=uLj1JFNa; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="uLj1JFNa"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5969c5af23bso947469e87.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 27 Nov 2025 05:49:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1764251360; x=1764856160; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=djx46A/t4g9tFTNKTkwprP+1rBHg+hljQCYzR5C8ROA=;
        b=uLj1JFNaKbDfbxo09KGuxHCMyfKejpCJ1WTapAbhCouqWGf7nWZMdnozs59WqDSOOe
         pKh+xItKdnpSkz+ie4zbDtWnGqjhIUj5iJcN4GZc3r9OWWFjUDbtmIDFnDxS7kQs52N5
         o7zRwL9XMpj0ovWUukkXhdxO+Oom/eQ0xP1Bqhns1G3+RLZvbuTMbuE9wi0OoxAuFS/a
         PPG6CyfX81DIu4rzuUmZ0n2d7PklxBj89vNtazQQpqPzyAkP9MVXbw8pmaXbiQRlQAok
         Je2FL5kvoXJ0r70ZgvakShfVpiV4HBUa4RGJc9S0isAgm4GJ9jVZ2ODpt7XqWEIKhhNw
         jhPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764251360; x=1764856160;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=djx46A/t4g9tFTNKTkwprP+1rBHg+hljQCYzR5C8ROA=;
        b=KcBbL3FNNcjyQlNWVO79S3MbgO6gzSVXZwd6SI3+EaJ31JvBPi1BNZwxx11zdhjLiM
         kMyUKOjqfy7xHi3ic7dA+4eaTsIsysmv2oN7lopKCIwzCY5lLnns++Wd5fsqYD+Jq/aC
         ytPEYfr14bYTgK2CB8Ql77ykSFGKmmNF4IFR+vY4mXMNgc+dK0z0Q7gqeE+zNhexFeGy
         wwq7ZxdieQiNEnDdJn+SqUXpTJdW2LUd1f+RLR2/2Wl3viNUW42BEQxhBp4nv9Hlbfw6
         iRJ3USjAIZbBa/CgAS1yS51gBl7F/2KSTYox5osXW67eJ+m9scc8SPLOBD/Yx4zi+6TZ
         GgNA==
X-Forwarded-Encrypted: i=1; AJvYcCUFhXqGhvtDlDeGmYjpfZ0Vy6yZxwCcZtjMpLj5luns32FVn1NgioP58XYVvPiwckaVcqZgZVaUUf3iqLuFwWRG/RNy@vger.kernel.org
X-Gm-Message-State: AOJu0YzOAHtsYyYR6PI1qvTqJSaydMnx+AlvkOrXhfcKhyq33BgzPGmv
	zA7PRVBLE24Myvk80UPodyW37q/u9PfGTdcqmmQmA+mP16cmv0hddMeJaRN+Qe7KcSlbvWosHQe
	t8+omwSAql9JdjMb18SdiFY1ZrrfPacXMhnZ6knYs8A==
X-Gm-Gg: ASbGncviRizPjMEniDv7QDfoL+Hv1PjDssPswn54U5AloXP1d9CCqBsL7L0EdQs+hvx
	qGvWfLfbHSwIGqgn9639/cKKLKxzhU9H/YiL1NKbrDSP+FxZRCyKGcXorq1m1nxH0ZFuOfiFpQA
	Z0rhWOdsrEMIrzCsCtVe82G05fx4QiwoskvB+hHfcCcOyC4leOPB/RsR1D9Pm3PZK9Q1u5PLUXy
	KA1soRqgOAFmMjYSMX/6c/rQYeRQl4E2azugrKQo48dB0d1vFjazZpf0EZ51D1cF83+sxsa7eq+
	nAUyxe/BkGpeoS6dq6hOZzWORvA=
X-Google-Smtp-Source: AGHT+IH+CDUfKujPpotwtmLcmyLVWHWVuqtFgSXM/kqLIDQE6VNVNZAmDKJw5gKN9s8jiNvQgCQtNi8buZoDHFa0ulg=
X-Received: by 2002:a05:6512:800c:20b0:596:a540:c95f with SMTP id
 2adb3069b0e04-596a540cb59mr5729287e87.19.1764251360301; Thu, 27 Nov 2025
 05:49:20 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Nov 2025 05:49:19 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Nov 2025 05:49:19 -0800
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <20251125-pci-m2-e-v2-9-32826de07cc5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251125-pci-m2-e-v2-0-32826de07cc5@oss.qualcomm.com> <20251125-pci-m2-e-v2-9-32826de07cc5@oss.qualcomm.com>
Date: Thu, 27 Nov 2025 05:49:19 -0800
X-Gm-Features: AWmQ_bmLrPADj6DoaQnC1ZJGmDNpk5NRcjPDulR-pWqLbapX0f-JV3TGd0Beet4
Message-ID: <CAMRc=McQO4OKra4S+goHsrq75HJbO1U=pfOg_8RrGFxNwy_-pw@mail.gmail.com>
Subject: Re: [PATCH v2 09/10] Bluetooth: hci_qca: Add support for WCN7850 PCIe
 M.2 card
To: manivannan.sadhasivam@oss.qualcomm.com
Cc: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>, 
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
	linux-pm@vger.kernel.org, Stephan Gerhold <stephan.gerhold@linaro.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Rob Herring <robh@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"

On Tue, 25 Nov 2025 15:45:13 +0100, Manivannan Sadhasivam via B4 Relay
<devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org> said:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
>
> The WCN7850 PCIe M.2 card connected to the UART controller exposes the
> 'WCN7850' serdev device and is controlled using the pwrseq framework.
>
> Hence, add support for it in the driver. It reuses the existing
> 'qca_soc_data_wcn7850' driver data.
>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
