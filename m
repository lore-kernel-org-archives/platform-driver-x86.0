Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E98F63B2D39;
	Wed,  7 Oct 2026 20:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791405343; cv=none; b=ecFQZ+0r/LwRiVuvgOGEiN1Ao9W3S1kDx6f7tKKU9ChbPY55nv5si5Y2HGrUDhVsUshirbv5kkEUv/HcX+D4oe924WzavmCrMiyO18uINpHrKWIMSSRXVhtMZWrvV74WSbA6fTraz9t7j7h9IMFxZy0+UyDvdlXASKez6i9B/aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791405343; c=relaxed/simple;
	bh=Z5trrKXGDechhVMsoKyQYiqVqYM8irvY2AItU+AI8b0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=IjvpytH093NIjmSeZaarxZlhq8szMeTDpNW3L5KFGn+r5HAeLMGDrg/a9vMDxLXa9izcNgU6WmBAud/MrZGuyh31tC9a4zf9I3LXbCMbrfUv43G5B6QljP4BUa4j7LO0Et/zLb6KSp66NEhe0lPQm57Dx40pzSq++SIeLmqYCzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fjolCalW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fjolCalW"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 881D2C2BCC7;
	Wed,  7 Oct 2026 20:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791405342;
	bh=Z5trrKXGDechhVMsoKyQYiqVqYM8irvY2AItU+AI8b0=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=fjolCalWa/LOKaYY3T34SkdpSY9ETxX0BksiSgHhtcwEyjM+9KIGy2hOd4yofz7/y
	 yXNpurOyRoYCT199Lw6bJbSrChu0wyWlFfCVjdL5uoBb5tx2GPINvONtUnoCVun/qB
	 R9tcRgRlp4av12cr/Yk1XHaHIJNzQzqsxjsOXJGj3yVPYjIOzAG0vzjJR2+AboDg+U
	 C3mM2/forNWEctmVscb2M9LHKlsGCePOvD5cwa1lrjVC84+cLULUEyvRL2VXYhKlyk
	 3p8uphrhSMZCVdZjpyfh3/oDyLVt00nErauU4/51oni1WzANFWroQQ3JtHFRUelf1d
	 oPvfDHqckgnBg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64C77CA6004;
	Wed,  7 Oct 2026 20:35:42 +0000 (UTC)
From: =?utf-8?q?Mert_Erdo=C4=9Fan_via_B4_Relay?= <devnull+mrterdo75.gmail.com@kernel.org>
Date: Wed, 07 Oct 2026 23:35:03 +0300
Subject: [PATCH] platform/x86: hp-wmi: Add Victus 16-d1xxx board 8A26
 support
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261007-hp-wmi-victus-8a26-v1-1-8a256ac14908@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMMQ6DMAxA0asgz1hyMgToVRADpKYxUgHFQCuh3
 L2Bjm/4/wTlKKzwKE6IfIjKMmeYsgAf+vnFKM9ssGSdIaowrPh5Cx7it12x7q1DYxomIj9w7SC
 Ha+RRvve07f7WfZjYb9cJUvoBh3CvX3YAAAA=
X-Change-ID: 20261007-hp-wmi-victus-8a26-119e000cbe86
To: Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Mert_Erdo=C4=9Fan?= <mrterdo75@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791405341; l=2869;
 i=mrterdo75@gmail.com; s=20261007; h=from:subject:message-id;
 bh=dLoxRrqavWxvmS0maWbHvPatI1qsUwE9imsXIYBNjdw=;
 b=ywgIXX4bRkk1nCLlF3MAIcXwJ2UzYUbj024tGzKFE15SyMuSSZjrprCNZoEnBP+gq/6dDzrbf
 JGXWLats0JvBUYP1ES8XmxIt28AFszM9DURrRT3EZhF/y4nnoRxjWgi
X-Developer-Key: i=mrterdo75@gmail.com; a=ed25519;
 pk=bUOfewdT6wnBK6cWdxYDgGaI8ee0+BwtzPbg982vJP8=
X-Endpoint-Received: by B4 Relay for mrterdo75@gmail.com/20261007 with
 auth_id=1127
X-Original-From: =?utf-8?q?Mert_Erdo=C4=9Fan?= <mrterdo75@gmail.com>
Reply-To: mrterdo75@gmail.com

From: Mert Erdoğan <mrterdo75@gmail.com>

The Victus 16-d1xxx ships with at least two DMI board names. 8A25 is
already listed in victus_thermal_profile_boards, but 8A26 is not, so
on those machines the driver falls back to the generic thermal policy.
Selecting a platform profile then never issues the Victus performance
mode WMI call (HPWMI_SET_PERFORMANCE_MODE via HPWMI_GM), and the
firmware keeps the GPU's +15 W configurable TGP offset disabled.

Add 8A26 to the list so these machines use the same Victus thermal
profile path as 8A25.

Before this change I enabled the cTGP offset on this machine with a
userspace workaround that issues the same WMI call through acpi_call
whenever power-profiles-daemon switches profile, and I still use that
workaround on my daily kernel until this is merged.

Tested on a Victus by HP Laptop 16-d1xxx (board 8A26, BIOS F.22,
RTX 3050 Laptop GPU) running 7.2.9, with the patched hp-wmi module
built out of tree, the acpi_call workaround stopped and AC connected.
The GPU power limit reported by nvidia-smi follows the selected
profile, with the same values the acpi_call workaround produces:

  performance  75 W
  balanced     60 W
  quiet        30 W

Unplugging and replugging AC with the performance profile selected
gives 20 W on battery and 75 W again on AC, again matching the
workaround. The power source event handler reads the profile back
from the EC without errors on both transitions.

With the unpatched module and the workaround stopped, switching
between performance and balanced leaves the limit at 60 W, so the
change in behaviour comes from this patch.

victus_thermal_profile_boards is identical in for-next and in 7.2.9,
so the tested change is the same one-line change as below.

This patch was prepared with an AI coding agent (Claude Code, using
Claude Opus 5.5). It traced the driver's Victus code path and found
it sends the same WMI call as my acpi_call workaround, wrote the
change and this changelog, built the module and wrote the test
script. I ran the test on the hardware and checked the results.

Assisted-by: claude-opus-5-5
Signed-off-by: Mert Erdoğan <mrterdo75@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 387f60e88..15f1e9f63 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -234,6 +234,7 @@ static const char * const omen_timed_thermal_profile_boards[] = {
 static const char * const victus_thermal_profile_boards[] = {
 	"88F8",
 	"8A25",
+	"8A26",
 };
 
 /* DMI board-specific feature data for Omen and Victus laptops. */

---
base-commit: 98f039265e580291d5e76a11b2072541fbb1c393
change-id: 20261007-hp-wmi-victus-8a26-119e000cbe86

Best regards,
--  
Mert Erdoğan <mrterdo75@gmail.com>


