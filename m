Received: from va-2-57.ptr.blmpb.com (va-2-57.ptr.blmpb.com [209.127.231.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21252353A7F
	for <platform-driver-x86@vger.kernel.org>; Wed, 15 Jul 2026 12:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784117507; cv=none; b=DnTBOG+nNhNs3BA9DN57Rz2L0gjaNwvrROyso6z9VLXBeQbOZfJLqO3dXkdIDGwwU0VAi+5KkuUciYdTgHnfgXimQBN2ICGdTtaQBD7vwnc8AuznjEbO4GDFTXHmtNkck9GG785OgnSNOgnXjbM2p0ttIh9QR6s9ZdnFFWtI2YI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784117507; c=relaxed/simple;
	bh=VpUBem712z3NXz3COfafygGDJ5mgQrVlvVKf4u2bfis=;
	h=To:Cc:From:Content-Type:References:Message-Id:Mime-Version:
	 Subject:Date:In-Reply-To; b=EbeR21ncYXkDAYK5YGVHZKA4vuXNW1a2OpDIgguqNvsLiSW82hYKDRdLUiJKQmgLHrw2irAHYXO0ZIEbdsA0+jIP074kdxtBXDe28YXfHnBIvJsPjvPcBwIs1Ue7XGqd4p0sndSqw4Y+a+y2vMUVNZO2vELkJKLcaaPe9hGc3E4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=liuxiaozhen.dev; spf=pass smtp.mailfrom=liuxiaozhen.dev; dkim=pass (2048-bit key) header.d=liuxiaozhen.dev header.i=@liuxiaozhen.dev header.b=HcSQF0wN; arc=none smtp.client-ip=209.127.231.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=liuxiaozhen.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=liuxiaozhen.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=liuxiaozhen.dev header.i=@liuxiaozhen.dev header.b="HcSQF0wN"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2602171341; d=liuxiaozhen.dev; t=1784117499;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=WYTY9SMuDdaHYO+63+P8lWpfvYuIcHXN/knKmBxFJ+Q=;
 b=HcSQF0wN0qhzWkxA7jCRMcU0UtBonLoIsL+lxqIH6kInzT7usJfib1cv4C4fM1NTGL5EpI
 /5W3nLXw/ELkaLktpROa8kooQvhHlUfbxn/Rk1AOmyhMN4xGqJKJRCtoMpaT/eWrMbNq90
 nDylSuTLS68h50Olu18aYEKEOwpl6CPM8j/BBjD1WmN6ZCbHdPjDuXdRRZAnMDRxjen3K3
 FMhbBqPIjw+aq8AjOP+L/qca75sizAyLZ/5t9RDEjws3oDMBM6COnAb4TeYwYNmojPsMDZ
 2I+5/7SsFwY60Ewp1pMt2GSWHo6IRKk3I/v994wQgRO78uVk3JucjB5mjmtUXQ==
To: "Derek J. Clark" <derekjohn.clark@gmail.com>, 
	"Sean Rhodes" <sean@starlabs.systems>, <tzungbi@kernel.org>
Cc: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>, 
	<corentin.chary@gmail.com>, <luke@ljones.dev>, <denis.benato@linux.dev>, 
	<prasanth.ksr@dell.com>, <jorge.lopez2@hp.com>, 
	<mpearson-lenovo@squebb.ca>, <josh@joshuagrisham.com>, 
	<briannorris@chromium.org>, <jwerner@chromium.org>, 
	<tzimmermann@suse.de>, <javierm@redhat.com>, <kees@kernel.org>, 
	<u.kleine-koenig@baylibre.com>, <mst@redhat.com>, 
	<chenhuacai@kernel.org>, <wenst@chromium.org>, 
	<florian.fainelli@broadcom.com>, <titouan.ameline@gmail.com>, 
	<linux-kernel@vger.kernel.org>, <platform-driver-x86@vger.kernel.org>, 
	<Dell.Client.Kernel@dell.com>, <chrome-platform@lists.linux.dev>, 
	<oliver@liuxiaozhen.dev>
From: "Oliver Lin" <oliver@liuxiaozhen.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <20260713054526.2902319-1-sean@starlabs.systems> <20260713081317.2954586-1-sean@starlabs.systems> <20260713081317.2954586-2-sean@starlabs.systems> <01401869-C099-407E-8175-174FE8EDF701@gmail.com>
Message-Id: <f1b0a036-909f-429e-8a12-f5fd9aa73c28@liuxiaozhen.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Received: from [198.18.0.0] ([23.151.104.71]) by smtp.feishu.cn with ESMTPS; Wed, 15 Jul 2026 20:11:36 +0800
X-Original-From: Oliver Lin <oliver@liuxiaozhen.dev>
Content-Language: en-US
Subject: Re: [PATCH v6 1/3] firmware: Move firmware attributes class helper
Date: Wed, 15 Jul 2026 20:11:28 +0800
In-Reply-To: <01401869-C099-407E-8175-174FE8EDF701@gmail.com>
User-Agent: Mozilla Thunderbird
X-Lms-Return-Path: <lba+26a5778f9+972fa0+vger.kernel.org+oliver@liuxiaozhen.dev>

Hi Sean,

I tested this patch as part of the full v6 series on the following systems:

- Lenovo ThinkPad P15 Gen 1
- Lenovo ThinkPad P50s

On both systems, think-lmi continued to register successfully after 
applying the series.

I compared the firmware-attributes sysfs tree, exposed file list, and 
all readable attribute values against the unpatched kernel:

- ThinkPad P15 Gen 1: 107 files, no differences
- ThinkPad P50s: 294 files, no differences

Reboot and suspend/resume completed successfully on both systems, and 
the ThinkLMI attributes remained available after resume. Full poweroff 
was also tested successfully on the P50s.

No new relevant kernel warnings, Oopses, or call traces were observed.

Tested-by: Oliver Lin <oliver@liuxiaozhen.dev>

Best regards,
Oliver
