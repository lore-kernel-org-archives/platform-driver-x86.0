Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795440934;
	b=lpLr52TXSGhm6QunbByg/qpibjTeegFtNZC95pZb4UMduF+UiSPaKPcZkTObUdOcKCgf
	 qshcrUZ64kqJ6a1UFt8lU2bBcyoOfgeOoGiv1QLbF4/02tC8ODgIRw0IBjOzN6wyGiftK
	 0hOVfQxHpeD4kcYcgbQlzJJrjqyRioWGJEnLCcYNo2sJvRumCjE4Unjw63fyPmx1ZVBBk
	 TQZuCRsUdpLOSdXjEdN3nhISa1m7CRnxhA+cTI+lv5k8nM7ixw4RbNkbS4j+DEjSVVWEA
	 SL0xZIVFzZQLfCAn14mVaF2WHqA+i0oFnXtL6VhmaNfQXcj9hrPP8guaW+gC0cHX3dQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795440934;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=scx32ipdmzZF2WgK72vmGUFyDo9O6eDPU6M168osIuc=;
	b=KAP618VCC/NQ5pkSBkztrv6Q4YHmgHcwQSjM1Xceem2qFXZ8JLvb7IQOQbQKz6zvhLjT
	 A7dLz6b9nCv8DLbD4if2yUmOPyFeHIh2IeOjDLxtX1iuuEQ0sDZ5uF4BGzWnz9U/IloYF
	 NWcq6noiRJqlc/I481NrrEjZQ8oByYm8WL6vrhUujK81ufGDnp7QxewggcVNODJB34WOd
	 Bsfr0JTxh5t6USftUnOpvs7JLMtw90YB8DLi0xnGazoEoQl7eE5ht9Rs1ID0k8dW84gz/
	 dsXficn5Z+5mInkXoVEnfUbLzVeeCaLhhOFxebCmwNcbwkp4BfQqffFKXdIc+4AsUhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="v/ILaTU/";
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431CE606A33F
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Nov 2026 13:35:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 431CE606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v/ILaTU/
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so28285005e9.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 23 Nov 2026 05:35:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795440933; x=1796045733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=scx32ipdmzZF2WgK72vmGUFyDo9O6eDPU6M168osIuc=;
        b=v/ILaTU/7bWg5GApb65WLg4awDJCuN4p4XNf0kXaMPqk/HUIGDI+Xbq06i9Utpmmib
         OQqr1eVnIILeeQbJEVc6ncw8bSGgj3jeChoH7Kk9A10TQi44Ww+KonrQbb+HgffZfa5x
         zFhE3RBlJLcMCY1gvOlSZpysY7c4VWE1XkPTGubFxj+AIgaXW7naxrT2vgHXIDW6ki9l
         hIOob0L9YMtximd5TaiqkDZTYXkuCXHIT/d3HUok6+HqvuFW6kipibWhKWZ+yfM/8J8J
         t5Jm4wul520REt2NLt/eRPryrwbjLY/Me7G/0vHxU5v2Lo8Si9vl/jxkpMFKhXHiltgP
         c1qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795440933; x=1796045733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=scx32ipdmzZF2WgK72vmGUFyDo9O6eDPU6M168osIuc=;
        b=LwUkczyDjTm94FQWXJ7uCvppx/VS4IJD1diihqSd1d7yaelO5HScjuTlYTKb6AEr3g
         cSq2S9uSSm5AXHfpDoRqdWV7Gr4qeO2X5MCPcSmDBhVbL8TS+SsUgXbNGe/vZG/ysCnH
         iAadK5bMjiWAbjHSm5N/te+M0A9Zczebb8zlwnJ52xG3r1wScqI5K7ArobuqzMX3C+4m
         JgNUJFFb6x7Z77GKDBjfQweKVGQRg1YAWBQl2IHoKpR64JOZ6fBC/S7k4V/XClDEyM9R
         vVmgxJGYEDmz3wwLWh8JZ4qkYYs83xu0B9AkxDuSUu8Rq6ue13kjsImApkuQS4eZUJ2+
         g9mg==
X-Forwarded-Encrypted: i=1; AL+hErHWf/FdTE0AfcwJsMZ1s9C+YLwmuVVaNadyN7xaAl8ZRD4tstU/+jskHfimfDKaAO6kXs+qcVNwylMVNjjCUuIhiKur@vger.kernel.org
X-Gm-Message-State: APuU4Z+n2uhUZS+Jwi3h5nCAhwwEpKU/+wd+2nXMMKDCyofmgDiB60tk
	achhWqsqUEE/4chsDOa9/DANLqJMljOCqKfRUU2Rq+myAA06YvqMI2tN
X-Gm-Gg: AZFdTZfiYkqiBm05j9mlkKYN7OaNuEBBs+j/L//cUJEa8PUwsTxv3lVGKRFV6z8LSVe
	mqWKRdgL/0Rab4mPRIqiIy5lI/cYc0WYHbCANBih2YHVSnRYg53rp7PECKcuIhaeZxG6xhtBf4j
	kmmSBhERWU5KUPtHrney8q9IMWH2QSJLkjlJ3U90Jn+BBOkb+pVHJml73oXpY0JYYkiL6j3pVAq
	HgJoUmgLm2uOwKhCgxnvXM1ZPxY7oc5SlF1X4ufRAsFizIohwC7Ua8+ciMhV+y0OQ0x4uoGIxyk
	OCpxan1EhnSZ9/Gflq53MiRI1CZOQgDNUKCVPT8X+2ww6+v4CU9jic2po/hxU7Ojnvk7aMxHfnr
	cd8mX/suRQDrh9kp6kkajgkOG0RMdnBh4+5qT/UhbuWSpnfKgCcCORvrJjZUyqBAVx81Q6uXqay
	jPWheN1nCAqF1kjshL18duhtzvhVtryHS04HUgW+k/KuXcP/T0f8Cwp12vLZQiy5xiUqlGbOTgz
	GobnhtgKoKR9yNy4wB0kDVKQT2J2TpL+Hw4jqGhvbRzIs34yvZ7OdjGSfvqYUDd4/k75jkhBn5z
	ukZ9DXwgikIQofwvU7zaHjIqKfp9DBOb6qMN6vNA/Ywt+5ngziKWe3o=
X-Received: by 2002:a05:600c:638e:b0:4bb:6c5e:b006 with SMTP id 5b1f17b1804b1-4bb887e265fmr224576995e9.3.1795440932435;
        Mon, 23 Nov 2026 05:35:32 -0800 (PST)
Received: from CachyOS ([176.88.126.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm504183485e9.11.2026.11.23.05.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:35:32 -0800 (PST)
From: =?UTF-8?q?Asaf=20Nuri=20Bertizlio=C4=9Flu?= <asafbertizlioglu@gmail.com>
To: jgross@suse.com
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-doc@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux@roeck-us.net,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	peterz@infradead.org,
	acme@kernel.org,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	james.clark@linaro.org,
	tony.luck@intel.com,
	ashok.raj.linux@gmail.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Subject: Re: [PATCH] msr: replace rdmsr()/wrmsr() in comments
Date: Mon, 23 Nov 2026 16:33:38 +0300
Message-ID: <20261123133338.39023-1-asafbertizlioglu@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123080822.3426355-1-jgross@suse.com>
References: <20261123080822.3426355-1-jgross@suse.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Nov 23, 2026 at 09:08:22AM +0100, Juergen Gross wrote:
> diff --git a/drivers/hwmon/coretemp.c b/drivers/hwmon/coretemp.c
> --- a/drivers/hwmon/coretemp.c
> +++ b/drivers/hwmon/coretemp.c
> @@ -67,7 +67,7 @@ enum coretemp_attr_index {
>   * @cpu_core_id: The CPU Core from which temperature values should be read
> - *		This value is passed as "id" field to rdmsr/wrmsr functions.
> + *		This value is passed as "id" field to rdmsrq/wrmsrq functions.

This sentence has been inaccurate since it was added in v3.0:
cpu_core_id is never passed to an MSR accessor. coretemp reads the
MSRs with rdmsrq_on_cpu()/rdmsrq_safe_on_cpu() on the logical CPU
(tdata->cpu), and cpu_core_id is only used for the "Core N" label,
the sysfs attribute index and sibling matching. The current driver
also does not write any MSR.

I think the sentence should be dropped rather than renamed. If you
prefer to keep this patch mechanical, I can send a separate coretemp
patch for it.

Thanks,
Asaf
