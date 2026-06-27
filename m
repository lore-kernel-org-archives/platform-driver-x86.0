Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600D526F2B0;
	Sat, 27 Jun 2026 06:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782541163; cv=none; b=RM1VAyZLlPSSmS2yNtM5Rz0h7Gd0G5FhLhb9BqMT9M6VTARNx7OACALi/CP8t5zQRMikomUpOpCT81A9cbOJ1kWTIo5wvj6Nk9AKI2AKnEJK9Ud+s1/gOYBp/MUBgXn0upjQ5EK2rTONX8+YruiVCtnBFe+L7Ib/SFAzSFZ3nao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782541163; c=relaxed/simple;
	bh=tgBqgDt/xXl3MK8coHL5LNgRnrIRVCN6lTZjM+01Xew=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type; b=hAG1j6VR/bOq0l0pRb57zQOJcxJ/pB8OgUZjpVamW/ZPM03+aFucCxlf0lFGpoSiZ8aMERSrcmc9pRDcxf08KAwjrc32EggAHUoUvokadPplxkcDOjLlWVQ1CWC3yZUXqvNawNniDqJIsETqkJ0o5C0m2QhSNjN/AZroPtHN67U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=QA5TNYrf; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="QA5TNYrf"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id C55272726B;
	Sat, 27 Jun 2026 08:19:12 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id InAeYhduMeDu; Sat, 27 Jun 2026 08:19:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1782541152; bh=tgBqgDt/xXl3MK8coHL5LNgRnrIRVCN6lTZjM+01Xew=;
	h=From:To:Cc:Subject:Date:In-Reply-To;
	b=QA5TNYrfF4FeiStwJswxzUaHEL1TskzWP8tRBZjIfxXDIdGn0Xmdyy18j/Eq1ZPxM
	 hZBwl/TMjOeMMgauZM5TJRJp/yeZwhKg7reZM/OsLYbDURwiD3MKZuQCER8DiGnRzR
	 m6g9nSHEXPC6DzEJ759CCjo0lXMS2Cm99GfGrZ7tR3loQiwagr6TTrd56eC9mPyD2Z
	 0ACMgDhcKDMXLfeRaiPN2Zy3qlnajftlgQTmC25WwIforDPc9zS/OuWqth1o0BqD9W
	 tHo9wb9xqZf2Wm/PZnuWTu7/iZIKgs5XeDbaYgqRVh2xZ2Pzlu4SkeXPF3MFObTaIf
	 MdA/1fG8RFt8A==
From: Marco Scardovi <scardracs@disroot.org>
To: ilpo.jarvinen@linux.intel.com
Cc: corentin.chary@gmail.com, denis.benato@linux.dev, hansg@kernel.org,
 linux-kernel@vger.kernel.org, luke@ljones.dev,
 platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2] platform/x86: asus-armoury: add support for G614PR
Date: Sat, 27 Jun 2026 08:18:57 +0200
Message-ID: <BGkkBwKuSFuGPnRJO3Lg1g@disroot.org>
In-Reply-To: <wwPQu_JvTXK897kIBeAj8A@disroot.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Hi Ilpo,
you around? I'd need this to be fixed to set the correct values.

Thank you,
Marco


