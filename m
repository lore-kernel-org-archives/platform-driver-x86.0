Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=87.98.174.144
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795771478;
	b=kEh599VHscymN5IiB9VtV5DLWAnIKrCJD3DvQhf/4IuabiLpNqKoYHVhBftQdEH/smnb
	 2NZo+bj70J62sIEUgzcPGKYp39Gk4Uct3qFRS2olafRxQGOhzKh/WtdZIyX0223QFGA9K
	 fk2xL3d/yOs1rdz2G1xAiFL3U5aigQ370+sALC5QEgGRo+tIA4yNvgw5G70bCXY7NAeBw
	 RSiiCfPpq6kXXJgvnuYX+xN12oM/tiItUhjtRFomrif/js4tLFkX2y+DW20+hm5dDDxfb
	 P4y8kifpWI40tgfTsQW0XwH0Myq6J3wFCN8OHSC+FrYYnE4iCE5RuBoRCakLrMXBM0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795771478;
	h=DMARC-Filter:Received:Received:Received:X-OVh-ClientIp:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:x-ovh-tracer-id:X-VR-SPAMSTATE:
	 X-VR-SPAMSCORE:X-VR-SPAMCAUSE:DKIM-Signature;
	bh=O/40p9mPUJ9lzAMAARPW6FZcfYSAz2NfyvuBdIj3BtM=;
	b=EB52uywsBLhi4na+R3XLqRof9dsobAGkAZbwDLgOaGa2SyWk6Si9XBdYxj1+Htjj5Lc6
	 NuDgI+2MlEey+YGXKzfbrAHwMtU8BaE9HLis8mpHv8GFe0WLTFi+MbgiwFokFhSldm4WT
	 S1WLLAZhwV+wAZe6T0YMoOyuDgLNSvqyc+eB0DAhTgPAMVLpSONCC54jENO2SFU4lbGIX
	 9TlBqbsG+Hl+vSuLN2otCgq+dMMz6LkMiVg5Gpk0jOrVMujnd5mphJiXEKmiyyt7ys7N5
	 fXMsfKQoZ9rKqz0bcy1iu8XytW2yXtSApozlN7fv7RiTZFRiDC0UGB8d6SIVrRYj3VQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=3mdeb.com;
	spf=pass smtp.mailfrom=3mdeb.com;
	dkim=pass header.d=3mdeb.com header.i=@3mdeb.com header.a=rsa-sha256 header.s=ovhmo3617313-selector1 header.b=esW6lGKo;
	arc=none smtp.remote-ip=87.98.174.144
Received: from 16.mo583.mail-out.ovh.net (16.mo583.mail-out.ovh.net [87.98.174.144])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD836606A31C
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Nov 2026 09:24:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD836606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=3mdeb.com header.i=@3mdeb.com header.a=rsa-sha256 header.s=ovhmo3617313-selector1 header.b=esW6lGKo
Received: from director3.ghost.mail-out.ovh.net (unknown [10.110.58.156])
	by mo583.mail-out.ovh.net (Postfix) with ESMTP id 4jbSfq648hz5w1v
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Nov 2026 09:24:35 +0000 (UTC)
Received: from ghost-submission-7ccd8bbbb6-fkvks (unknown [10.108.42.118])
	by director3.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 8B524C0148;
	Fri, 27 Nov 2026 09:24:34 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.110])
	by ghost-submission-7ccd8bbbb6-fkvks with ESMTPSA
	id BUE8FlJMCWvH9xQAMqfShQ
	(envelope-from <michal.kopec@3mdeb.com>); Fri, 27 Nov 2026 09:24:34 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-110S00442b59f09-659f-4e85-8f3e-1b21a2cb2032,
                    D697370656FF9958A21AC54DA46BA3848F1D2CE7) smtp.auth=michal.kopec@3mdeb.com
X-OVh-ClientIp:213.192.77.249
From: =?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal.kopec@3mdeb.com>
To: =?UTF-8?q?Filip=20Go=C5=82a=C5=9B?= <filip.golas@3mdeb.com>
Cc: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Guenter Roeck <linux@roeck-us.net>,
	platform-driver-x86@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal.kopec@3mdeb.com>
Subject: Re: [PATCH v4 0/3] platform/x86: dasharo-acpi: Add fan control
Date: Fri, 27 Nov 2026 10:23:54 +0100
Message-ID: <20261127092354.2974097-1-michal.kopec@3mdeb.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261127084910.3355833-1-filip.golas@3mdeb.com>
References: <20261127084910.3355833-1-filip.golas@3mdeb.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
x-ovh-tracer-id: 5499739571757031070
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTERTqOI1oZsiv08VZZ6wCeuxaP5sraS596JdYbW3aVQtcM3PtH1n6tj0S+zKg2BSAqfZatgikFkAIKpsf6nZuyqPQhCTH73PD5KuYVAzbKN+8L8FjG14aWlZCaJNnyjZyP+7h3jXgEpL4dw2madG1XFT5o3xCYZKdcjr/nGTRt2DxLbgbQA7xx54zPn4tqxGsiGAhYPvPxy2FyLZGr4T8Y0SMg4ABcAFnYegGKJ59egup1qQX/yRqE+tZk541zUQ/L2c6FGGoGSNmjtif6Ep5FgJctMIclh4qhWfet2W+BDrk33M5sNdfIXYl+mL3vzY9mOVeBDot9ZxAwS01lqEJE9ipBpAap6tC5YF4V2FdClcdQCiqok4CiDIqW7B6om3SFjEjjPlkuwtD5whiZVY8ktB+zshOg1GbfsOB6QyNylmM4rSGpfEWlCuq1QQscZ/sAG6ZHgCn/tNgFiOLJDdsM6HpGdxQwdcvBGQnEYBeaqeIRkAgyFS1rf1fdi20UV+BEDJGfVliX/jW8g9949sIOtTNTrirl7UOnSZaazieQ1X6pYPHLO4jRPOAxIPm8mFPSVnXnfZJdpVzvywlzFLacTkfKnvXM5yWQHZL8kje5tqsxPzk3krX4wADtFbJ79AL7qlX+Cxw0dQ5EcXf2L6rT+1j0bbOWII9wTVj8oMBQV2g
DKIM-Signature: a=rsa-sha256; bh=O/40p9mPUJ9lzAMAARPW6FZcfYSAz2NfyvuBdIj3BtM=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1795771475; v=1;
 b=esW6lGKoFzk7ZX1j98FQevJ9M0+jgPnC16FBKdE6gplJzE57KcA8Yk2FMIcLy3kYe3WiJQwB
 XDaSy+v8XwXasbhSA+LhnIMv+WMOZfbdxej67uAQuDiCHsn+PclsW78FD3TfcQvGUj/kT66ayY+
 6ZL9xDl4i/jtWTdeqlqp/1AgoT5XPs/7gcj55vouaab7pGEKDJ9iX4giUEILOFvrGiV8UZUrwa/
 yQXd80zqGjOph+iCLyoyorAwxlCE/3orHQUDH4JjFo7B0d8hpusFGQ02pA3hSk3Nqzo5u28ZRbJ
 5qNd3QbfGakxuJNhrcvi65PcZyYVfi672oqaJbEdSAxWQ==

On Fri, Nov 27, 2026 at 09:49:07AM +0100, Filip Gołaś wrote:
> Add the capability to directly control fan PWM and configure the fan
> curves. The initial version of the driver only supported monitoring
> the fans.

For the series:

Reviewed-by: Michał Kopeć <michal.kopec@3mdeb.com>
