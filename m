Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513983FDBF3;
	Fri, 12 Jun 2026 16:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781282080; cv=none; b=cQ1TWXW+IKLk8z7TvDTZ404Bq0L9rErJqV2yCbFyK/k6sonBjeSUe2g7tYQrnsu19xmhS2ocjJPauVGb4T5Fv3wTVJan2c4BY11b4/vDi44pbc9Hjhz08O24oQVy+c1UhYejsjEowWtbKovxP2BsX4at/XyHT2f6gHVPUX0b7dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781282080; c=relaxed/simple;
	bh=1+6RY7660O4jQk5iYegP0uDAXlmiSiU1vxRjYpoHmdc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GwUp6UIkmY+wjCQJVHpJJZVMj1W+ws/P4T4zLrQzf7HF8be8raGIzFqqqsOowPnGjGhI5i/BWwytAc5HIMjURL+W2g5i2PJnh0WgO4T70vhcDXLiWrKhDxu1n7KsJJ69TFS2x3kWExCBJxzGnamsoFy8pblrijNTIU6EkpbBd0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=A64Awlg/; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="A64Awlg/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1781282065; x=1781886865; i=w_armin@gmx.de;
	bh=ykZ2N2Dxio0tUDItQxCqQMbOF57gENRP57Pvk5abNUg=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=A64Awlg/PWhzT51HS7j+KSMFKvocMjbqNKNR05FqqKM2ycXiZ9b/bsnJh1fOkQht
	 EQ3r+kOTmRlmGmbnjTcaYx2s15wEiv5ZJ56ZMsZBL1cN+xBv1SJ35d+xqqQty1QJi
	 w+8F5jtZ7dHGbesTbvG1IF4JhUhJz9lZBks098hMuJF+hSo/ooXnvH4Qw5xjjdl53
	 F60PEF/8tBTBZVUKCUK+ncXtzTkDG7BmWWIoVpqydlue/ipT8OEMGNjsyAyhW90r1
	 ptUZukplJbYMZGPVbu/+n6rmLYcNF7aoIZEWsFzjHZirmcOJHBuxZtLJRF0gQnEgU
	 f8J/0L3dLVdarSQZbA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M2f9h-1wVbjS17Wx-0012ZS; Fri, 12
 Jun 2026 18:34:25 +0200
Message-ID: <3d4b27d4-0c31-46d9-92bc-6c584bfdfbec@gmx.de>
Date: Fri, 12 Jun 2026 18:34:24 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] platform/x86: msi-wmi: Fix unknown wmi event messages
 on MSI Claw models
To: "Derek J. Clark" <derekjohn.clark@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Hans de Goede <hansg@kernel.org>
Cc: "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260611223920.1679438-1-derekjohn.clark@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260611223920.1679438-1-derekjohn.clark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:OYc7U+iJHzyAn/3fLVYFedRcUJ1sHE9FpxMWvb31/LPH06wWhF/
 RhZ7uj4WY5sPjVoPBg599IXq3M0H2BqgtVe2keu5m2VXPJi5+W1CYx9dBju5OTkdOuO9Vyk
 vQj2TByxgfgbP6tY4c94mtnm7Is1myV3ZQlx1p7fffuaSAait49z5euFSypyFZOjDyXUvUq
 tWZPOMErv/qkvCCTY9x2g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:3KgjRd39vQs=;4q4pnDr+stuRCvwYu1OFYkaqKFx
 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

Am 12.06.26 um 00:39 schrieb Derek J. Clark:

> MSI Claw devices produce WMI events through the MSI WMI hotkeys GUID for
> some of their buttons. When pressed, these cause spam in the kernel. The
> Claws use a GUID already supported by msi-wmi, but use an
> ACPI_TYPE_BUFFER instead of an ACPI_TYPE_INTEGER.
>
> Patch 1 reformats msi_wmi_notify() to reduce nesting by using early
> returns and a switch case in preparation for handling this new data
> type.
>
> Patch 2 adds known MSI Claw event keycodes to the keymap and support for
> ACPI_TYPE_BUFFER.

Would it be possible to turn this driver into a proper WMI driver using
.notify_new()? This would solve the whole ACPI type problem.

Thanks,
Armin Wolf

>
> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
>
> Derek J. Clark (2):
>    platform/x86: msi-wmi: Reformat msi_wmi_notify()
>    platform/x86: msi-wmi: Add MSI Claw M-Center keys
>
>   drivers/platform/x86/msi-wmi.c | 92 ++++++++++++++++++++++------------
>   1 file changed, 60 insertions(+), 32 deletions(-)
>
