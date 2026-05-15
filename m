Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8CC047D93B
	for <platform-driver-x86@vger.kernel.org>; Fri, 15 May 2026 13:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778852943; cv=pass; b=HY2gUFxojTdpUXBXEekCZOvEMR6/7m0DrXA6+Tu0Wt67XLlJmTsYL5uTJEsf8kxyasDYJmyqV8ahyRjVZSt1Rd4ifUVR6A/5po6xXlV5XM1l3o8POAR/HnY8Iw7OEz7m0U0QLsqHhp8Vrp11FvvZiad8rmK8CvmvlqjiHWGg56I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778852943; c=relaxed/simple;
	bh=gYAodV8oMYU+CF7b19xZXpfqhSr57A8cp9TR7N7eScQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=RGYE8LdeSGNnnRFaQt6te/G+v1CisHucSls00t10/cVqiUf2ohkElKvPs44aWBHGdaBa1Pum0PZl+X4WUDDtRKsILppOWBPzgPzKCnjYoOlXvrJY0m0LlGuV7rUV/ExRTenthj4p5/LgdbVhV1JLXvnKbzW1w4mwDlc18NAaeY0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g5lzd9+/; arc=pass smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g5lzd9+/"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7dcd54a8d17so1026091a34.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 15 May 2026 06:48:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778852936; cv=none;
        d=google.com; s=arc-20240605;
        b=keKiX6JhxnrMq8CA/GDObH4A6nd7yMlE2p6zq/tJ7cuT0YwmaTeqPXAp74kLarftrh
         HL8H78JqeutlFduKqb6KXIV5zK0nRNhMBbBl2cqz5rq+kextxn9cxIR4sL56F5EGlj+y
         GU8UYCmARRWr3QfwoU6lp0dGWH2RU0nC0leIbuZ5nuczdf/31uqAYP18MDBU09YhOfCo
         1fA9V0KKd2YadoauqaMZggDfGOaeeYzjdgry/3ANSkyYkIYDIp1aRcfEWhfUgMzHRlHr
         N8la0I2pG+MwjNcrUTcKiehz8r7HY2yqLNmwFCnW3/3W2Lsm57P0nm4pJCuY+FSGuVBt
         o+rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=gYAodV8oMYU+CF7b19xZXpfqhSr57A8cp9TR7N7eScQ=;
        fh=LAtpHtVR30q6rinFeyskR7Ff9QyURHB8q3bpp5R7hcA=;
        b=afkV8Z0YH2VMe5WKs0O30P6Vf/3SFV7b+iiOyzxkcn8dEPnviGIMCbTYJeE5PpsxPd
         HGnDAXkjd3kv1vMlqR8WfMIpjmSzXU/jGE3Mp56nIkndoKGmbpdaWdD/KVQiriIs1Bws
         mifh+9IOfKFg2bGZLWq2u68eL2AcOarFGfAngTPKRHGuNGP+vTA1nf5tS756VLkw8ZdX
         kXqSD4sHzCBHSbotmofPIGUIAdWEOdFIoPLaZTnljz7stuKLfO8XxaeBj184CqoRAtwe
         KGsDKmR/LtpZ8wKHG9s8f0fM88ChSanrZmGxEXa2NuxuIo7FxlvgVRpcGdoII3sd6GSK
         UCGQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778852936; x=1779457736; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gYAodV8oMYU+CF7b19xZXpfqhSr57A8cp9TR7N7eScQ=;
        b=g5lzd9+/EprXQ/UHnxkmxzJTU74n3N2145uMFjglo9SDuTZqplgxeylk4plnbvfQFC
         6XjoK7vgtUOT511rwk3DjW6qsCyuUGv4zUY15fV8BxJ9XHCmRZ0LlvX5xWhmbu/Pc8P2
         yG1lv9kWsGqTGptxMjp/RXxceAMENb9oSOXFanqozrNy+oFReONvKkYZvbjHwdX7RqH5
         00vMQRxXamOS7gLaUK1dG9TC3dHlCtx+6Yvv2dpwrkI0JFE6ag6wMQmagt6eI+pCt9S0
         BSKLWYgr8VhvIheoZBkXJcxpbdKssutNwx+1F0iC6H6qfJkam7IC9bGhDULp/bCOfFjg
         bQdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778852936; x=1779457736;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gYAodV8oMYU+CF7b19xZXpfqhSr57A8cp9TR7N7eScQ=;
        b=irXrDBwJBZQwIcKC6F+/pMU6jnKDwYgRL6MjSIJrqNNvSd7+Z7RGaBVs3rmPki2TmY
         eRrkdlABR1aI7TihmNKfZZJRsLXJW3i+VWSusU+m+MbtrHNlhD9jp14PDnRX4633ze+S
         fQizya0/VB401Zoffw2kMibGjzHg9YMCz+MgHug3vIUnSFrFpX0twf232xp0lI9+vDbB
         l1JxGH5NDsHBxzm0NjAJqLh0GNYVTnw4UICKZ52tmTfHwuBDKikuxZj+ZL2BJsGkqO//
         10SMx1yGXljmhCzTB1RBTTuyLpXyk/9XfsRIxuppwMkBpO6pZVtmfodnkvUNz7g8OhC8
         VHsA==
X-Gm-Message-State: AOJu0YwtQ6qugVOo91JKqbCGPQK85gP2y638eZrmozEZUfx/aTE3wu0F
	qzBRRPdGZLNIRrT7KmJCwzSmPvR8ZJ9wBJQQ8HW1c6RIaHpNnWnrqW7uhcoNpf7NxQg7lgbHboM
	S/7QYk8siz+gNKTvQ+rHb7rbVAeueHxxCZXJL
X-Gm-Gg: Acq92OHxpcJMCzFnDuMxPbXHXJlaAOaK5Kylq58Ofjo9ATOgXxIHRqaFQdtgMbyPrhu
	REHQ8QyTniVxsvzplAon+jEwEoAJYqvQ+9KRZ159D1TNfURUHzb7va1aeKOcEJgSd63SpsAle0n
	W9JAsrI9onaFHL+LapV6XEHTBCTzv4Y4h4lpVswMRNy4ATc94V2m3DnQhZOqOEZWy2ZE32ZfJ4L
	2TrV1n2VZZ4Gs0EuYFXqetOkNvdZvQ06d+KlHfJQjRJRumGaAR2vpKGPedH1ppyNE206wedOtxg
	1cXFwKdAaEQujCo9CqT33eKdwbDmKsbvCafxfmJYAh18mNCAS+HrLzD2PX8iz3QGBnSxPL7+INj
	D/h7dWQ==
X-Received: by 2002:a05:6830:4128:b0:7d7:e695:93b8 with SMTP id
 46e09a7af769-7e4f2ba7f21mr1343444a34.5.1778852936127; Fri, 15 May 2026
 06:48:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Bogdan Nicolae <bogdan.nicolae@gmail.com>
Date: Fri, 15 May 2026 08:45:41 -0500
X-Gm-Features: AVHnY4KRxn4_5spg3ZAx76kIJ0Mz6aoEks4FncT_60yirbLi6_XrLV1fXr4RbEA
Message-ID: <CA+ORkNSkzcFwfXhKKN7yFGvUujJKtvOC8jTPYyy0fhFtWUcDuQ@mail.gmail.com>
Subject: [Linux Kernel 7.0.7] [hp_wmi] EC layout for board 8C9C unsupported
To: platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

With a recent kernel upgrade (7.0.7-arch1-1 #1 SMP PREEMPT_DYNAMIC
Thu, 14 May 2026 14:26:22 +0000 x86_64 GNU/Linux) I am noticing the
following line in dmesg:
hp_wmi: Unknown EC layout for board 8C9C. Thermal profile readback
will be disabled. Please report this to
platform-driver-x86@vger.kernel.org

As instructed, I am reporting it in hope it will be supported in the
future. Please let me know if you need further information.

Kind regards,
Bogdan Nicolae
