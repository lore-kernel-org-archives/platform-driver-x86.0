Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8806F423EBA
	for <platform-driver-x86@vger.kernel.org>; Fri, 25 Sep 2026 16:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790352071; cv=none; b=VJj8MH6qh04IVhZTAQiYVP3+5pB/S8H96qswHSNzexR1aftMy3gw0x5pLNRd35g+q9KiT7qey/82ibccVnLlQ5tVsyUndv2pX2Y4lUJZdN8Al/vs4coCU7E9rPFZeevzNHBz+nT5tmzv+O8FGX+qJi6uLCWcws1iNE5c7FxDbqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790352071; c=relaxed/simple;
	bh=PQmwCDVpXobGqLOJZbE7rLd46Sr6FvA/knCTC7pjtzY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=co8GWKotytrPaMZoxfJPXSuE65Erdm3yEVmZrU55EV1flrgG0ZRoSBHoZv+IGAgT8fj8uMXpZAZOUrSIF2GkOsIAS/ChBf376wwGUdCZ4XXMfx97B/yPO4mAvejE1VTwiOEaVpb6qMRLniEPlFVgH4eECLnHzsd8fQXtDKsVOLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=KZvZ29AZ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=M0MT2W99; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="KZvZ29AZ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="M0MT2W99"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id 5DCE71D00081;
	Fri, 25 Sep 2026 12:01:07 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Fri, 25 Sep 2026 12:01:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1790352067; x=
	1790438467; bh=XGDXLq+FYIH3fLNmc+fb2fsfFdSijk6ntZqUlLZDXmw=; b=K
	ZvZ29AZ44WtvmfUqVTSOqVPl/t0+5AXua7o21jAF6aMHvMcB+0k1SYUFTpima39c
	lhBZOi0BGJBvQui0OTOz7+s1ksSEIM+DQ0mA71xyfDP3Z8GoB127fpD7yYYYYUAw
	7lI9MhbS5bf4Gnl4GCBmkSG3FbtLhPm0TSj2fjhD64sfgMmHi0KAIhLOr8z//x15
	bcp5D7mkpfULQs9Z0X0hDYXHgM91NonBszCyD40vw4mHSaqkqPDjBYLMXWKGcy+M
	MGWde1eiEJG9kWINzTnGamS7mbzfee0Xf/XI37/TPYIJ8c1axde2FGLxdWyMRkb3
	5Spc8lnlIzT9i9Qc7t4qw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1790352067; x=1790438467; bh=X
	GDXLq+FYIH3fLNmc+fb2fsfFdSijk6ntZqUlLZDXmw=; b=M0MT2W99edo3wtR3P
	jjqZN03D8Rj/dkOMy+TGY9FtXXFSYOND4k2xbYn9uSy7UYd3E4ZZuz6z3De/T0hy
	LsLnX/qWzQBJd1SRcUaPGwFsqYPsqyas6OhMbjAlcG6cBPB7meso1otKETBWaUrK
	yBWsBQOPIRhrQJEXIxEU5kN78hfrzcivMz65ksOMfT+PK0kYZL08862dhKe85kB8
	L/uZCrUwGjOMkfZmDB36DIcsHP7e9/3UBYIyAcNhJM5ghv3SusfFTJ2K9zenrv4P
	zRaO3mU93WbIielRUjK6qQohYBnQARcdiXK7lsPxD/9YCQjNMNfhRDzzK2rJYUcm
	02Zlw==
X-ME-Sender: <xms:wpq2ar5hWzG4LlI1bPY5wih-lGafL3upDM8epALsuse0_UEdyTmfOg>
    <xme:wpq2aq5vynHt6jZ81FPcn3blIcqKP-kScDHySmOsQXB35LfmMIIWJMhyWME31QZKD
    9trYqiExgYhHCjRtDBfFmEk2lnYX8DYwVSz4CW9a5YEGqpKPKc3Xko>
X-ME-Received: <xmr:wpq2apFvLlQ00ocmJEEHN_agosvWCwMSQukYStlyWnzSWNKTVp4vNdRfAp9lOJPYmEf-584TqbMd9NWa7K8>
X-ME-Proxy-Cause: dmFkZTEliJhTBRg9lQYVfrbho/aTtMDkPejvbmTmjDgNCYJvC7nGcUgZtcOKftwwdHjufo
    Ip8uoljJ1AZtBe57UI1AqDdCnpm04rh4qHP6ko6Llv+NQM8fR5QAS+LMHN1sbGanN28E+H
    Zvey9bTFefXNWOjnfEChbqb5joXAqF0MsVcRJ9hXK2K7GXvrJ/6OUdYICG7uZhZCV6Qv9T
    gTfcldajsfkQZ4+ewJcg5LSe92IUYbyDsI7p8ElE7bI+TM8HQ3CcarBNl6TqP3NeEnZVzH
    HxNaeHlFMLVci/Ip4XKXcTrD7jzQST9YVizB8W+6RwoQlRQFmq2F5pokef8oLbiitlmNJj
    vYGQLOXH9f7X3aERw8gF0ssjBQEsPSpqLH/TwmAMHtDc7zOWz2WdZzJxjCDkfclVjTqbv2
    ZlroGNHWqCHCi1cRb08v+fVJ71wKU0bz6v8irLY3KrKTtS9DgwxtF7VYOC81yJvVWjb1Tj
    z/P9wULDMQYZGt/4WR/7A7kR/MY+WBDuMCa3rGLWqA8I+XJbRXQhA63gJSkqTFwek0piVT
    mzI3uXes/W0GoHX0TEEGFDdwG27l7nrR3FmecydQBxvkiHmBtVxQNWXKgcE8EtO79wmzLR
    p/btf0tk80rfaorL49nkbIU/VXKqpM1QXj+bPiIEI1crY32mX5zw8zikyCpA
X-ME-Proxy: <xmx:wpq2aqXEZQg74cgNVPt9QeCnwaI0u_rp44OrdGOfskc99Upqa8-TsA>
    <xmx:wpq2atVI4OLcIiRxwmfPkBHBhyThmYEmdCju87Za72y1wkRE85Q7vQ>
    <xmx:wpq2agJB_ichz0a1JC6k2lClrr8owF07sxLCcDmNq3q-eK8-3AHNww>
    <xmx:wpq2atBOn6ZWESi0bkPuUAEg-nDtDs6TLceaS1D_22gnQBToEpEcvA>
    <xmx:w5q2alMwt-qG6O6kfYxMkVE_EZPlTWkZRGwpOn7C1i-pVG3RQJj2EZXM>
Feedback-ID: ibe194615:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 25 Sep 2026 12:01:04 -0400 (EDT)
From: Mark Pearson <mpearson-lenovo@squebb.ca>
To: mpearson-lenovo@squebb.ca
Cc: prasanth.ksr@dell.com,
	W_Armin@gmx.de,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	derekjohn.clark@gmail.com,
	Dell.Client.Kernel@dell.com,
	platform-driver-x86@vger.kernel.org
Subject: [RFC PATCH 0/5] think LMI v2 driver
Date: Fri, 25 Sep 2026 12:00:28 -0400
Message-ID: <20260925160047.2063361-1-mpearson-lenovo@squebb.ca>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <mpearson-lenovo@squebb.ca>
References: <mpearson-lenovo@squebb.ca>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all - need help to determine if I'm taking a sensible approach with
this patch series.

Lenovo are introducing a new 'common' approach to WMI for the Thinkpad,
ThinkStation and ThinkCenter platforms. The aim of it is to improve the
user experience across all devices, and also to allow some future
enhancements. I've been working on the Linux driver implementation so
the new version works under Linux.

I've called the new version think-lmi v2. 

Originally I started by including the changes in the think-lmi driver.
There are enough differences in implementation between the versions that
it got messy and ugly fast. Surprisingly little commonality could be
maintained.

So I switched to creating a think-lmi-v2 driver. The original driver
becomes think-lmi-v1 and think-lmi would load either v1 or v2 depending
on what was available/preferred.

Related to this, there is some functionality in the dell-wmi driver that
I think can be common so I moved that into wmi core.

Would really appreciate any feedback on:
 - Is this a reasonable approach or is there a better way to solve this?
 - Any concerns with the changes to the Dell driver. Afraid I can't test
   those and I want to be really careful not to mess them up.

Many thanks
Mark

Mark Pearson (5):
  platform/x86: think-lmi: rename think-lmi to think-lmi-v1
  platform/x86: think-lmi: think-lmi driver to load v1 or v2
  platform/x86: wmi: Use common WMI string functions
  platform/x86: think-lmi: change name and display_name to pointers
  platform/x86: think-lmi: Initial ThinkLMI v2 driver

 drivers/platform/wmi/core.c                   |   49 +
 .../dell/dell-wmi-sysman/biosattr-interface.c |   16 +-
 .../dell/dell-wmi-sysman/dell-wmi-sysman.h    |    2 -
 .../dell-wmi-sysman/passwordattr-interface.c  |   24 +-
 .../x86/dell/dell-wmi-sysman/sysman.c         |   40 -
 drivers/platform/x86/lenovo/Makefile          |    2 +
 drivers/platform/x86/lenovo/think-lmi-v1.c    | 1857 +++++++++++++++++
 drivers/platform/x86/lenovo/think-lmi-v2.c    | 1292 ++++++++++++
 drivers/platform/x86/lenovo/think-lmi.c       | 1847 +---------------
 drivers/platform/x86/lenovo/think-lmi.h       |   69 +-
 include/linux/wmi.h                           |    3 +
 12 files changed, 3354 insertions(+), 1856 deletions(-)
 create mode 100644 drivers/platform/x86/lenovo/think-lmi-v1.c
 create mode 100644 drivers/platform/x86/lenovo/think-lmi-v2.c

-- 
2.43.0

