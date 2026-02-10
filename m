Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D31C31A555;
	Tue, 10 Feb 2026 23:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770766204; cv=none; b=oeMbvY0WlwjMcvf86tSokOmNdfBBuhDgGMl3MwrUYNtbLwTN6Exh6C3U+ePNosEbAkRfSUN8SVXiAH7J0U3ksBiyBJW5KZIRmdCScKm2Ismhc3y5GBEfFJTs3zI3+Nq6DlePr5AWPdDobcezyl/EMxK772jysrY119MPJmSX2g4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770766204; c=relaxed/simple;
	bh=j0kq0r4W7/BthKnjlKviGLoJygpEqhRkX978qR0QWn4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lC2wu/USwQe8xGqkWYPJ/m4DDX3+4cvnOzmQ3+0ymw8vp5TXHDLXEo8tz7fq327epKsL8do8L0CmeXQwD62ijEbFnktZbNA+73NrySMUTAWE3tE09UfDtDoGis3M0U/Y0CHMCFh12P+cReo5TQNqPekRvK2gLzKXIeJE1OnXMsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=T5UX64j2; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="T5UX64j2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1770766195; x=1771370995; i=w_armin@gmx.de;
	bh=7o1+zO/c/ExlhGxW48iLYDP9QL9WL9LrfWN64xLp9z0=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=T5UX64j2883kptkg3QNkBcbVIf06wm+BnH+be4Fz9ahPefNcOFl6o06ikza3wqyI
	 zqWPICuE5U89ARmPtctMtAK2PLx4hi+wT/f/CDez0N2NBcd09lPmiU2eH8X8fT+jG
	 DaSR79pCxKf7Wmx0nQsTAdv2QZl0S9KUwWkhgTXVHtpc6UpJlCTNpMCfPn8ilKqU2
	 73s+EqTgOcKyAFudwQzDxitqiospt2jlBdC7EObDbZEuAYguUVm1gvibFKJCtRuob
	 DV39xibfAdslbdidkNrcdqLRRLf/GTfeGQLH8eEfvgjhPCsDiebZ1c8InIDeJu1Cu
	 4wO3TQVK/93mRPGRJw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([93.202.242.224]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1M4s0t-1vqDlE1TJ1-00EaVw; Wed, 11 Feb 2026 00:29:55 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: wse@tuxedocomputers.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] uniwill-laptop: Input-related improvements
Date: Wed, 11 Feb 2026 00:29:41 +0100
Message-Id: <20260210232946.302936-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:iPvGQzRCMxPBeN1GBhX12BWQgXk2sRKHhabf+k4Ok5/7ttVTAdy
 xmFNi71TSapYpfrWHPzi7aRU1i08A7VVFTlgFkzXsJAhMXc/aGfAJNh3IMNPwIVTyqDivpn
 Zb3GmFB1Zq3Jg+CTPx/CIVxmIAw+kc2GAzjdL50EuJ+35bc18dnlNIMI5K2CXOrdkObwYbW
 O68yNmiskD9CpS9dfamPw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:gy6Ej15a9+c=;fevxh8mSZ4g+T8jO6+lNRwXIr0i
 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

This patch series contains a set of input-related improvements
for the uniwill-laptop driver. The first patch renames the
"fn_lock_toggle_enable" and "super_key_toggle_enable" sysfs attributes
after it was discovered that the underlying hardware works differently
than previously thought. This technically breaks user space
applications using those sysfs attributes, but AFAIK no such users
currently exist.

The next two patches fix a potential crash and an issue with the fn
lock status not being updated when using a key combination. The
remaining patches ensure that when the users changes the fn lock
status or enables/disables the super key using a key combination, a
poll notification is being issued on the appropriate sysfs attr.

Armin Wolf (5):
  platform/x86: uniwill-laptop: Rename FN lock and super key lock attrs
  platform/x86: uniwill-laptop: Fix crash on unexpected battery event
  platform/x86: uniwill-laptop: Mark FN lock status as being volatile
  platform/x86: uniwill-laptop: Handle FN lock event
  platform/x86: uniwill-laptop: Handle super key lock events

 .../ABI/testing/sysfs-driver-uniwill-laptop   |  10 +-
 drivers/platform/x86/uniwill/uniwill-acpi.c   | 109 ++++++++++++------
 2 files changed, 80 insertions(+), 39 deletions(-)

=2D-=20
2.39.5

