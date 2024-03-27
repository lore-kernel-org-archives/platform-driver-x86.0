Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D0640849
	for <platform-driver-x86@vger.kernel.org>; Wed, 27 Mar 2024 07:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711525517; cv=none; b=hyHM7s5jyuOhLP2TN0wL4sx/KlVc4juwA3gth15gppMJAAqBwo5sc3T8bDOWaHqnZhuQCV8xaKaVvOJfB1ZUo1fQJlWfrUemGQhz5TEKXCj5nat0xdSwSQQ76KZJFaZO4AczLcm0YCVVG5Odq0jhTmMLDNf7lzV83VNGPXgkj3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711525517; c=relaxed/simple;
	bh=iF0xdrHMFuoUwhEuhxHTNnxQyh6y1oAkbIqX1Vs8DNA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZB1+PN47E8sFH8IS8kAY/iEP+as1WlnczAqs8xlXrFRCrJTnZAIXwaAea2R4u+/iXBAq6TwZTZHpqPgyoKeKXgEvoEUDW96iBdsMNEvloO5tKyao6JXCsHL9Rew6mBa7y5GhTctDQ3CVhXRahwrcmB9C+JyhmtZKPVewcrp+1uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fG6NYZw/; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fG6NYZw/"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a4749eecff7so414017966b.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Mar 2024 00:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711525513; x=1712130313; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m5NKCQzn/2QzDffTEW07IH16QG8HTI+pkQvUskitTsE=;
        b=fG6NYZw/0MqGsujBBaXsuowfaiXHshIZy855zznlzNtbSR0YqSp0NvVGBvTjmSzx7B
         yOGGmkSCcevH37+QHMLZ70STtmzdHAgZNqrGs6uiLiPDAf5Hh1anCcFH1Ef2GaCoS26p
         YTZZFucB/I+kEDN08m9djJNKH2r5FpMvkLnYU9EOAGG0K0HxAOkgbH2xldD+6OjNjewM
         Et8IgTPJgO8omnUc31/fI7f084kbNcffi1nQbmKYYyt5JPxHBX+o/o1uv0C0i2nSggH0
         Yv7ntlIJYJ5eOVtfcliq1mADvZH6fx4kBhsn+XfBLIM2Wu5oupQ9e+ZvV/euyAj4KaJU
         hN8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711525513; x=1712130313;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m5NKCQzn/2QzDffTEW07IH16QG8HTI+pkQvUskitTsE=;
        b=rbrW4xwtlvZNilZyF81pUNy5Im8Z7CTbpxRhMptIPj7ZSBzvxsvhSwDCDin3nqku51
         O//zUXCXla2tdM/LY2ddoZqAEJ0N37uko2kqnM2pBvS19UafQz67pBvIiW2J1BkNTkRt
         fLOtFC3SvfcVYwMMbVFiaXBKQpNHTg8fumHDumUdHnXJBjcR+aDd2umv8dEslh8d2FJp
         skqMmpPhaNf4Okgys/400tPNHTL/OvTqh1pmLxpynnSxT4go1Rast3Doz6NjYKW00RbS
         jqTjNvMmBK82U8sPMFWs3nuRDhGd+Gxl7/IjZbcZH07Ido3/NBK27dNgaTZNlDRX+dJK
         XmFw==
X-Forwarded-Encrypted: i=1; AJvYcCVyHn7fnPdkz2JDyAw3RvylWLkhhddqj4Epj3bapz1wmNfzDD7FXrKoQNa/PLfk1vp8v+zndlNX1/I8UYY8FHZJ0l0JuJPOnR6Ra5EyxR0vJMzMWg==
X-Gm-Message-State: AOJu0Yz6KzLjmWpQkUSUKBGROvh5k1k3JjTf69OwNRhYy6TXnHJw1Ml/
	K4MapRb1gzOJrVdD6XVW0zsH7KbAflJzEDBx9xudOQWTExEW/wu+YEtn+IxR75k=
X-Google-Smtp-Source: AGHT+IHOr3eNKIkj6WAmG3XR2hyM8YRV8aLodZiJZXz+ySkbbVia28u3tOdyC5gJA5IhmTLTWUKo0w==
X-Received: by 2002:a17:907:20b2:b0:a46:617e:d3a7 with SMTP id pw18-20020a17090720b200b00a46617ed3a7mr3514861ejb.60.1711525513563;
        Wed, 27 Mar 2024 00:45:13 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.206.205])
        by smtp.gmail.com with ESMTPSA id am11-20020a170906568b00b00a474690a946sm4671745ejc.48.2024.03.27.00.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 00:45:13 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 27 Mar 2024 08:43:54 +0100
Subject: [PATCH 07/19] platform/x86/dell: drop owner assignment
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240327-b4-module-owner-acpi-v1-7-725241a2d224@linaro.org>
References: <20240327-b4-module-owner-acpi-v1-0-725241a2d224@linaro.org>
In-Reply-To: <20240327-b4-module-owner-acpi-v1-0-725241a2d224@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Robert Moore <robert.moore@intel.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
 Corentin Chary <corentin.chary@gmail.com>, 
 "Luke D. Jones" <luke@ljones.dev>, Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>, 
 Daniel Oliveira Nascimento <don@syst.com.br>, 
 =?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
 Matan Ziv-Av <matan@svgalib.org>, Mattia Dongili <malattia@linux.it>, 
 Azael Avalos <coproscefalo@gmail.com>, 
 Richard Cochran <richardcochran@gmail.com>, Jeff Sipek <jsipek@vmware.com>, 
 Ajay Kaher <akaher@vmware.com>, Alexey Makhalov <amakhalov@vmware.com>, 
 VMware PV-Drivers Reviewers <pv-drivers@vmware.com>, 
 Theodore Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Cc: linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 acpica-devel@lists.linux.dev, linux-input@vger.kernel.org, 
 netdev@vger.kernel.org, chrome-platform@lists.linux.dev, 
 platform-driver-x86@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=621;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=iF0xdrHMFuoUwhEuhxHTNnxQyh6y1oAkbIqX1Vs8DNA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmA85QjVUHx+uIE5kwIa9dA5xJiTvxpZRF8W2xE
 sSfv1aXx66JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgPOUAAKCRDBN2bmhouD
 1z96D/oCHhbLWPXTc5ahtfn3iMCFQN4Yia4pPaHg9gaCgX8S+aw83Zl8BdnGoYL19V/oCASSv9G
 eHgmKnlJf9IMBKdXtfMtGRLU8LOo8Vb8kEstQ4FU4OGMlMuiGixztmLBbsqmwJxxYNj5/e+DtGt
 MZ8IA2eUXrDSwZgYhgD5HxJfvOi5Fb9e4QFyMrs1dENelbbdbvNXE8+k1FHYslXNMRfCxvWlIoW
 ROe519F6aJ0KVsnWTAKjA1pmeGBnI/XTmP1dEChPfICl70+UcbezHYm/lxC5rkFmX+Hsg6U3P0K
 CpmYEYNjEXjIgDPN37vfXL4OdVUBToF3R9R+M2CaopV+uLVIfV/wZyjMBi08TQMIBPOjLNHWEUI
 rzjo8OqzjzuT2skUOBZE4ZybD3Zu6srVgn55Eq5cBan/vtp6xMLqf62nquw06N9/2HshM3Pxhtn
 PFzrmu2cJ2jKI9OiBchbzg9SbLMw6vU37rTO57NT9XYuUZ4WIxzNlfkY1D1oaxyZ5un2gG+IxBJ
 S+XXQW6E2iK5FfNW7Wd3V98YBTUJg5g4CZCQNFyXGQ7tidMI5qGyVnbOw8xIjlHcfqmNxYTjeZH
 AfIwab4tDsnmi2zou5mWV1JM2K/dsyQd9uAR7Yk3oyTyS+8VbgeT3J74NRSHEIfzsVkyCdWpqbU
 6gfA4Re855JqLdw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

ACPI bus core already sets the .owner, so driver does not need to.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/platform/x86/dell/dell-rbtn.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/platform/x86/dell/dell-rbtn.c b/drivers/platform/x86/dell/dell-rbtn.c
index c8fcb537fd65..a415c432d4c3 100644
--- a/drivers/platform/x86/dell/dell-rbtn.c
+++ b/drivers/platform/x86/dell/dell-rbtn.c
@@ -295,7 +295,6 @@ static struct acpi_driver rbtn_driver = {
 		.remove = rbtn_remove,
 		.notify = rbtn_notify,
 	},
-	.owner = THIS_MODULE,
 };
 
 

-- 
2.34.1

