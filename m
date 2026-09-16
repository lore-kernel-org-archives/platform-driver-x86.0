Received: from mta0.migadu.com (out-59.mta0.migadu.com [91.218.175.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D636377A8D
	for <platform-driver-x86@vger.kernel.org>; Wed, 16 Sep 2026 15:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.59
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789573341; cv=none; b=EiouQWZ6XPE4i0C4pSBE+cuk3/jkLSOS4tQcA3K7kgffHrtGOm++Ois9/7F7A6QHOg0Z8Wsp69ALMJCmy0rDHynJ0FhbYdeeE/Co93McsudgsKDKh3CFRjKMlX8sEUOcfDDPWr55ktg4AYO4bZfMY+S77rSJ+8ui3FkKgKMtxYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789573341; c=relaxed/simple;
	bh=oOstyTYjz1I8+csLyNOMelhDhYsc/ertqiEN+KDuRYI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gkY/DOEhOakBt6H0stDdiE6DSBY9FESxfg5C0QqFzK0RGaITigZrAA6EmFoR2CkGO/CYV9iucL0PR2VHUrS5pIWpQLrJrw3SpJ7G1v2Bg9UvZ/Mvu6hm2p//cFR/psrH/Sme7RWuCYO1z8m+/xaNfFBr2k973WRODdB1cfpLUzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=S03yl/MC; arc=none smtp.client-ip=91.218.175.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="S03yl/MC"
X-Envelope-To: platform-driver-x86@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=oOstyTYjz1I8+csLyNOMelhDhYsc/ertqiEN+KDuRYI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789573337; v=1; x=1790178137;
 b=S03yl/MCOOfvudbzF9n155tAjYEuB1d/2Kbl4202KOPcXGktrGpWlYTjkHH/L7/qhG1IhtZW
 eB4lyD6P4VzBqonaoUayRDXsDbO2CXm2HwvspaBtfLUoqmt16KfJ9mu6vLxIeawz2w+quWZKnyG
 muWgDW2DVTp6TkH5tLL7Z/rE=
X-Envelope-To: platform-driver-x86@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 049d7e770a5cc259;
	Wed, 16 Sep 2026 15:42:17 +0000
X-Mizu-Trace-ID: 049d7e770a5cc259
X-Migadu-Flow: FLOW_OUT
From: Denis Benato <denis.benato@linux.dev>
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Hans de Goede" <hansg@kernel.org>,
	"Corentin Chary" <corentin.chary@gmail.com>,
	"Luke Jones" <luke@ljones.dev>,
	"busybox11" <busybox11th@gmail.com>,
	"Denis Benato" <benato.denis96@gmail.com>,
	Denis Benato <denis.benato@linux.dev>
Subject: [PATCH v1 0/2] platform/x86: asus-armoury: reorganize visibility and extend dgpu_disable
Date: Wed, 16 Sep 2026 15:42:08 +0000
Message-ID: <20260916154210.181441-1-denis.benato@linux.dev>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This patchset reorganizes the visibility of attribute groups in the Asus
Armoury driver and extends the dGPU disable functionality with a fallback
DEVID for the ProArt H7606 series.

This good idea comes from Ilpo and this patchset is the result of our
productive exchange (link below).

The original author of the patch has stated that he/she wants to remain
anonymous, and asked me to respect that, therefore I will only reuse
the DEVID information from that patch and the commit text as everything
else has become irrelevant anyway after the reorganization of the driver.

Link: https://lore.kernel.org/all/20260810-asus_armoury_dgpu_new_devid-v1-1-0a5c845414e4@gmail.com/

Denis Benato (2):
  platform/x86: asus-armoury: let attribute groups decide their own
    visibility
  platform/x86: asus-armoury: add dGPU disable fallback DEVID for ProArt
    H7606 series

 drivers/platform/x86/asus-armoury.c        | 113 +++++++++++++--------
 drivers/platform/x86/asus-armoury.h        |  55 ++++++++++
 include/linux/platform_data/x86/asus-wmi.h |   3 +
 3 files changed, 128 insertions(+), 43 deletions(-)

-- 
2.47.3

