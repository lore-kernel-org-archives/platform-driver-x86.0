Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A484E1C7B
	for <platform-driver-x86@vger.kernel.org>; Fri, 25 Sep 2026 16:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790352077; cv=none; b=Q4XELFcuAP2K1ZFinw3DR+scrvHqk4S22fexWj/RB7QN3+Y+XyXlGk1RNIe7IgyEgJQ7nL2Z4eyHGgA17KN32c+Vuc6LYfJKxA/M5wlopgBYrZJNkDYvFoTB9L+IhWNi3ihvOyI1JhXv+v6A4Ew8ov+Ef5+kFUrFS7waOYO8frI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790352077; c=relaxed/simple;
	bh=0vNNCvdSVgGrcLmSDMXxoRHQuvz0slwxXf+jjgYRqLA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FpiBKPVthbCsSeHSTFfkPUzNxW8SC6wfcYBH89jMBkEAfxrzqzc38hr9i9JyPMoSRVRvfp325PAueOFKdBf3NzDDkD/YYEHaOQkK0d6/sjdhY9JFfaGvwtNDHJiOaUElXJ6GJJnBk49OaQ72Txr+Ihtff3La2n+nuKn/hxOiJ/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=kq6bVPvF; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=cvhupZ9R; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="kq6bVPvF";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="cvhupZ9R"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 7D3527A0147;
	Fri, 25 Sep 2026 12:01:14 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Fri, 25 Sep 2026 12:01:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1790352074; x=
	1790438474; bh=1YrHGyfE6MrUCFKwutkrB/GIMYtHJpSl4TbRddcN910=; b=k
	q6bVPvFEz88nX4vdYIXi26OgXM0Cv7z6GwbLlgFcET0xz/E6y1N7mYKpPfo3kiL4
	whMmduiKRih4ubCSUB3t7OQIEe/WwaKPMwBP/EZrGuVvjgVXWgoKrk4KSD2ZbrS/
	/kz2JJcSbFzsd90wxX3gePnaL9/EOFlGLeH0grli5JUqpMKjpKcPKZBCDT7up9W3
	u6mZY0NItSGDw2t4U6bMBokJjrWOPUWkayTG2oxdH2p3d44eBkd9yejDqP1JUQT6
	90zrxvjyWf0vkJc+PaWW2t5gzXo2n3ocHiMcsuZMuW3QY4F2e8b3KwRYJLZ7fLnN
	CDl8ODUmPcR8sZAKCCdfw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1790352074; x=1790438474; bh=1
	YrHGyfE6MrUCFKwutkrB/GIMYtHJpSl4TbRddcN910=; b=cvhupZ9Rqdqgr0O/4
	ztMDWitDvqh8jaM3N7+9ld8QD1Y+nVmnL77BTkErQugBMHH64IoTyQSTzpcIIk28
	dkmm7FNLXsRER0CuQRP0G33qa5RQYF8Mupz1GY1CrOoWHnFXBaYkUgUe+bJghkWR
	vQQGgxMwkeyOn6H+YAzoNu87G5k802AXzEfQ09rgerw9dSCB7VumDg1fViiicZYw
	wlmqVXk5mofCz7W1G3P+dWwXzNlHLClQ5JJooUdRKOBbo7HOPYF+LI2D0VA18BvU
	18cvzoZtomxMMIOZ5Tp3lQJeoEIhFZuJ5rCxELGPvDDQh4s5/M+O5bJhn3Xj9MsO
	MVNew==
X-ME-Sender: <xms:ypq2amb67nvTWV6VvPrK3s7cSO_ICmnafzJuSUJVdJ_Hp4O7U2xmEQ>
    <xme:ypq2ajZfqTiV1bE8wKSWtbAeGxKMXRueCVOZD8ewDwL7mzZS0Kfnl-Lo8sgPlRfc8
    LJsdbNbwA0pccCClfsfDr0gpxnl_n7TBcFqBEW920WQOUbBN5uKZMY>
X-ME-Received: <xmr:ypq2anmcrg2r2LN_SEndh0bKP7BSbCjch1RkrwdBMljYGIxKbg7AnJv-dcVtDhPVj3_iYnng0QLTi0mGZRM>
X-ME-Proxy-Cause: dmFkZTEliJhTBRg9lQYVfrbho/aTtMDkPejvbmTmjDgNCYJvC7nGcUgZtcOKftwwdHjufo
    Ip8uoljJ1AZtBe57UI1AqDdCnpm04rh4qHP6ko6Llv+NQM8fR5QAS+LMHN1sbGanN28E+H
    Zvey9bTFefXNWOjnfEChbqb5joXAqF0MsVcRJ9hXK2K7GXvrJ/6OUdYICG7uZhZCV6Qv9T
    gTfcldajsfkQZ4+ewJcg5LSe92IUYbyDsI7p8ElE7bI+TM8HQ3CcarBNl6TqP3NeEnZVzH
    HxNaeHlFMLVci/Ip4XKXcTrD7jzQST9YVizB8W+6RwoQlRQFmq2F5pokef8oLbiitlmNst
    0+0njC0fPaE0M+s5vKXLYQXMBucpWmne/ewOSoLfuhoQO0IusyJP2OVfCh8Sj4PbWKYsQf
    KFhD0R7V0jt8VkcjrKWb/GPXvI1Bpj+b3Th6Gl6xGSbaW3NdtqsmrkDY6YT6vzMeXlJnJp
    Wo6MLomlJjkIdIXjcdLVgXB6FrDPSUZhD0SPu4+bpgX+sxgYTTkVPVNJJBoxvabi8+KYDE
    yWSomOZ+iL20j8UvTueH97zJcFVrG3oZ7D7AY0BXZTgKlPzrlLvzXgnfow5TTEk2zJu/pf
    3iTM9BU3wX+/plSSgTaOC6ZaQRitNlqBB8kmj7eDDaXt93SvuQRDOetOI8WQ
X-ME-Proxy: <xmx:ypq2am1TMcJYZVtzc3L8uT82KjCK4s0MWohnwOOsxGFckBY4s8l2bA>
    <xmx:ypq2av3DM_Eiww8TJvNSS5Hx0NXgPKByX19jvx1LV63OuP67kveVVg>
    <xmx:ypq2agqhD3uIXZILBP9eMpbpJe3GWwEnnax8uDFV8ME1uSWaD5qswg>
    <xmx:ypq2ajhirBhu9vUHtBWb18l1zMFhF372FseQwze88DsYIRNQDQlaYw>
    <xmx:ypq2as6fEKda-wBwkZSApVHBz5HcS-oobkxtGTOOP0fJrhxuytVoNXnt>
Feedback-ID: ibe194615:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 25 Sep 2026 12:01:13 -0400 (EDT)
From: Mark Pearson <mpearson-lenovo@squebb.ca>
To: mpearson-lenovo@squebb.ca
Cc: prasanth.ksr@dell.com,
	W_Armin@gmx.de,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	derekjohn.clark@gmail.com,
	Dell.Client.Kernel@dell.com,
	platform-driver-x86@vger.kernel.org
Subject: [RFC PATCH 4/7] platform/x86: think-lmi: change name and display_name to pointers
Date: Fri, 25 Sep 2026 12:00:32 -0400
Message-ID: <20260925160047.2063361-5-mpearson-lenovo@squebb.ca>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925160047.2063361-1-mpearson-lenovo@squebb.ca>
References: <mpearson-lenovo@squebb.ca>
 <20260925160047.2063361-1-mpearson-lenovo@squebb.ca>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change name and display_name fields to be pointers instead of arrays.
Update initialisation appropriately

Prepartion to make implementation common with the v2 driver.

Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
---
 drivers/platform/x86/lenovo/Makefile       |  1 +
 drivers/platform/x86/lenovo/think-lmi-v1.c | 10 ++++++++--
 drivers/platform/x86/lenovo/think-lmi.h    |  4 ++--
 3 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/lenovo/Makefile b/drivers/platform/x86/lenovo/Makefile
index c404cff99d35..1867eb95ee90 100644
--- a/drivers/platform/x86/lenovo/Makefile
+++ b/drivers/platform/x86/lenovo/Makefile
@@ -6,6 +6,7 @@
 obj-$(CONFIG_IDEAPAD_LAPTOP)	+= ideapad-laptop.o
 obj-$(CONFIG_THINKPAD_LMI)	+= think-lmi.o
 obj-$(CONFIG_THINKPAD_LMI)	+= think-lmi-v1.o
+obj-$(CONFIG_THINKPAD_LMI)	+= think-lmi-v2.o
 obj-$(CONFIG_THINKPAD_ACPI)	+= thinkpad_acpi.o
 
 lenovo-target-$(CONFIG_LENOVO_WMI_HOTKEY_UTILITIES)	+= wmi-hotkey-utilities.o
diff --git a/drivers/platform/x86/lenovo/think-lmi-v1.c b/drivers/platform/x86/lenovo/think-lmi-v1.c
index 26a62e1a709b..42b31270ca5c 100644
--- a/drivers/platform/x86/lenovo/think-lmi-v1.c
+++ b/drivers/platform/x86/lenovo/think-lmi-v1.c
@@ -1251,6 +1251,8 @@ static void tlmi_attr_setting_release(struct kobject *kobj)
 {
 	struct tlmi_attr_setting *setting = to_tlmi_attr_setting(kobj);
 
+	kfree(setting->name);
+	kfree(setting->display_name);
 	kfree(setting->possible_values);
 	kfree(setting);
 }
@@ -1517,6 +1519,8 @@ static int tlmi_sysfs_init(void)
 		/* check for duplicate or reserved values */
 		if (tlmi_validate_setting_name(tlmi_priv.attribute_kset,
 					       tlmi_priv.setting[i]->display_name) < 0) {
+			kfree(tlmi_priv.setting[i]->name);
+			kfree(tlmi_priv.setting[i]->display_name);
 			kfree(tlmi_priv.setting[i]->possible_values);
 			kfree(tlmi_priv.setting[i]);
 			tlmi_priv.setting[i] = NULL;
@@ -1678,10 +1682,10 @@ static int tlmi_analyze(struct wmi_device *wdev)
 		setting->wdev = wdev;
 		setting->index = i;
 
-		strscpy(setting->name, item);
+		setting->name = kstrdup(item, GFP_KERNEL);
 		/* It is not allowed to have '/' for file name. Convert it into '\'. */
 		strreplace(item, '/', '\\');
-		strscpy(setting->display_name, item);
+		setting->display_name = kstrdup(item, GFP_KERNEL);
 
 		/* If BIOS selections supported, load those */
 		if (tlmi_priv.can_get_bios_selections) {
@@ -1807,6 +1811,8 @@ static int tlmi_analyze(struct wmi_device *wdev)
 fail_clear_attr:
 	for (i = 0; i < TLMI_SETTINGS_COUNT; ++i) {
 		if (tlmi_priv.setting[i]) {
+			kfree(tlmi_priv.setting[i]->name);
+			kfree(tlmi_priv.setting[i]->display_name);
 			kfree(tlmi_priv.setting[i]->possible_values);
 			kfree(tlmi_priv.setting[i]);
 		}
diff --git a/drivers/platform/x86/lenovo/think-lmi.h b/drivers/platform/x86/lenovo/think-lmi.h
index 31359879629e..fd8a98c2fdaa 100644
--- a/drivers/platform/x86/lenovo/think-lmi.h
+++ b/drivers/platform/x86/lenovo/think-lmi.h
@@ -104,8 +104,8 @@ struct tlmi_attr_setting {
 	struct kobject kobj;
 	struct wmi_device *wdev;
 	int index;
-	char name[TLMI_SETTINGS_MAXLEN];
-	char display_name[TLMI_SETTINGS_MAXLEN];
+	char *name;
+	char *display_name;
 	char *possible_values;
 };
 
-- 
2.43.0

