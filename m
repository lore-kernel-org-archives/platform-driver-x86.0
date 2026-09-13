Received: from sender5-op-o15.zoho.com (sender5-op-o15.zoho.com [165.173.182.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82CCA37E5E9;
	Sun, 13 Sep 2026 20:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789332642; cv=pass; b=LIsYVI1PGybITG0OWtHDAvs6qx2IIzRBBm/TDdX9TJl6qdZWhr+5dJa7pdY/nvIZQmffuiZBH/wDyqMDTQ5jTEpKtGHcjre8+kCXIwlRmWgON5uZ/yORKcjq49dxHUsXsH/OZdEDADyQeeIvvVJqUXnc9Bd3aTfRDMwEZYRxfyw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789332642; c=relaxed/simple;
	bh=OAoTlJ0e/DOmFNuUR0Q+Dil5JYAx+Ys2tYgVMivrNTs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Avf4jNSpA7aQIFgiUrVjx4Em4JUgX0dPE0jw7f8HljbKz3OUNR5TgMlTNBoWvHOU2484LdTHN2IOMQgcNGaV/t9ERfaERDpcTqEfTeN7nVrLWstNISrRSiNwy8K09UvMoPdnJPC5fDu/kRVFzCiCVxKuImuoD4lfgUUZ+SXUHCk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=lpWg1lfE; arc=pass smtp.client-ip=165.173.182.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="lpWg1lfE"
ARC-Seal: i=1; a=rsa-sha256; t=1789332630; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=F0Ax5rBUVKXys3pFtc0NHqxBi0ozscDo6c2t/67X13GUiVJeOVkx7pfikHbalpd9K8tcgZamGRL3cVV3L5bKvzYUxRi0SDm5Xh44MQS1qfdKMoZK74USJrFbFdyaraFFsZBxdgJpw2ZB6Q6wsW8mclDCycU+airHYSp4+3Pf4bI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789332630; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=9fotXMfI0cS4OmWaKcl7eY1y8qx1kOWgz+wfFQG4e3A=; 
	b=W+jtMiUFrKjsqhjAlOBzJcezRkWD+5yr6zreFE8D5w31s6K/INNVxSFCb4SQrgNEzaIDdSV3O71JrN8YoXmlYcmTjDDuOU3Fk36+TQuJ89XJA3+a5Pdeh93eV/yqgT8Bo/UgpZ11QeVj5XrAf/lvW99ZYXf5iwGKc/gxYgVm2Vs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789332630;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=9fotXMfI0cS4OmWaKcl7eY1y8qx1kOWgz+wfFQG4e3A=;
	b=lpWg1lfEQKgncVS2v7D8b9As6SuoUj6fRDTKTH0/GUsACeO8sqh32riSaafdwl/d
	pLmR08iDJp82bBFqhqI52AJTY310p/2U699Qh9d96rUvTplpyIzSW6jhifIqEeAJYTk
	dShb4mgkEVVPIUQ0p36+dG5lsSxLjD8rfk+XxUmDqMmbikMQH3LxNDzZp1jdJCSIh0y
	sZ4Y4qX8V4xNnAMWgGJHFiffLmm+enk1QYZbmBRTgVBsx7sXzfioDZCFilKNrY7EFsc
	A4Ph4Frl/uoO431PUiX/QNcgMu/nyLmgdgBDCtZlOq5Bm9h5vFL2NBdu50+lHK/VCgA
	b4TTrBdVkg==
Received: by smtp.zohomail.com with SMTPS id 1789332628830702.6404180281911;
	Sun, 13 Sep 2026 13:50:28 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Subject: [PATCH 0/9] platform/x86: lenovo-wmi-{other,capdata,helpers}:
 Improve robustness on buggy firmware
Date: Mon, 14 Sep 2026 04:50:21 +0800
Message-Id: <20260914-lwmi-wmi-new-api-v1-0-7a400f2f69f8@rong.moe>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8pURTA5NESyNL3Zzy3ExdEM5LLddNLMjUTTM1NjFJMbFItDBLVAJqKyhKTcusABs
 ZHQvhF5cmZaUml4DMUaqtBQDC+J+cdAAAAA==
X-Change-ID: a504a929-lwmi-wmi-new-api-f5344d48a86a
To: Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Armin Wolf <W_Armin@gmx.de>
Cc: Charles <hanker007@gmail.com>, platform-driver-x86@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Rong Zhang <i@rong.moe>
X-Mailer: b4 0.17-dev-1f2f7
X-ZohoMailClient: External

Some devices do not support LENOVO_CAPABILITY_DATA_01 and define the
query method as a stub that returns zero buffer. Unfortunately, some
devices do not implement the stub properly, causing WMI errors
(including ACPI errors).

The current lenovo-wmi-* implementation enforces the binding between
LENOVO_CAPABILITY_DATA_00+01 and LENOVO_OTHER_MODE because of a
limitation of the device component framework. When the capdata device
bailing out due to a WMI error, lenovo-wmi-other becomes unbound and
unable to provide firmware-attributes or hwmon device for the other
functional capdata device.

Therefore, WMI errors must be non-fatal in order not to break the
assumptions made by the device component famrework.

Poison the capdata device by releasing the capability data list in this
case. After that, NULL list will be passed to lenovo-wmi-other on bind.
The latter will provide whatever is available, or unbind the components
if nothing is available.

A poisoned capdata device releases or skips allocating most resources,
e.g., the capability data list and the debugfs directory. The device
itself is only used to satisfy the component dependency of lenovo-wmi-
other and coordinate with the latter about the absence of the capability
data.

Meanwhile, for devices that properly stubs the WMI query method (but
still declares >0 instances), keeping the capability data list with
empty data is meaningless and causes lenovo-wmi-other to call
lwmi_cd*_get_data() to retrieve nonexistent capdata in vain. These
capdata devices are poisoned as well to save resources.

In order to release or skip allocating most resources for poisoned
devices, some preparatory work is done in prior. With the preparatory
work, it also skips allocating most resources for the WMI devices that
declare 0 instance.

The new WMI API is also adopted to conform to the behavior of the
Windows WMI-ACPI driver and improve robustness on various WMI ACPI
method implementation.

Finally, add myself as a LENOVO drivers maintainer as previously
suggested by Derek.

Reported-by: Charles <hanker007@gmail.com>
Link: https://msgid.link/CAKtz0s8UYRQYW_0bh=0TMx47Axm-W-muEay-r3rqUBS1NHMPVw@mail.gmail.com/
Suggested-by: Derek J. Clark <derekjohn.clark@gmail.com>
Link: https://msgid.link/782FE636-A06A-4E12-9563-786374805947@gmail.com
Signed-off-by: Rong Zhang <i@rong.moe>
---
Rong Zhang (9):
      platform/x86: lenovo-wmi-capdata: Only allocate sub-master info when necessary
      platform/x86: lenovo-wmi-capdata: Store a pointer to component info
      platform/x86: lenovo-wmi-capdata: Defer mutex initialization
      platform/x86: lenovo-wmi-{capdata,other}: Only allocate capdata list when necessary
      platform/x86: lenovo-wmi-capdata: Adopt new WMI API
      platform/x86: lenovo-wmi-capdata: Register component even on WMI error
      platform/x86: lenovo-wmi-capdata: Detect stubbed capdata device
      platform/x86: lenovo-wmi-helpers: Adopt new WMI API
      platform/x86: Add myself as LENOVO drivers maintainer

 MAINTAINERS                               |   1 +
 drivers/platform/x86/lenovo/wmi-capdata.c | 369 +++++++++++++++++++++---------
 drivers/platform/x86/lenovo/wmi-helpers.c |  61 ++---
 drivers/platform/x86/lenovo/wmi-other.c   |  11 +-
 4 files changed, 290 insertions(+), 152 deletions(-)
---
base-commit: 22098763a10d9c1340827fcf6edab66f153b27f0
change-id: a504a929-lwmi-wmi-new-api-f5344d48a86a

Thanks,
Rong

