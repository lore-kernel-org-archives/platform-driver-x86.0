Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27AB717C68
	for <platform-driver-x86@vger.kernel.org>; Fri, 10 May 2024 19:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715370021; cv=none; b=Ht4gNU8t1bJBdyvxGRmOszNEOBJZ+v0mQRFOe6XhmwrzAOjjs9eqZrfE3hHwshC4+73M+PJXeNsSOPXyyu3QjEq8dSY0f7asPlTt0PT7V91PrfaALKWI2kXPt62A2EKDY7CbfEnu1ZFTY6TbadCgN/R74R1EMOAFB33vG8PHNBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715370021; c=relaxed/simple;
	bh=vR9GXpxIyWmWeQFuFmTI54JGcbN8ZNXVwA4TlthlC8E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VjTv6oGrus27/Yu4uThxbV/yq4ON5gZUl68fZPfct4dUoUFXJaLY3Cj+Z+PGIF+nHGFokG+9IgN/BQtH7xWRXUuzvaZ/O+SxPFkk5Uq/8YWE3LAWdbAkl3jYaa1Vtbqzcflk0OUDOOBWLCCwbULZ90bjbgIMoS05yVCOHdoE8+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ho+0K/Ck; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ho+0K/Ck"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715370019;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=How134udp+0mahanPBFr+KTwm3NjkoR9C19eOkG+Ac0=;
	b=ho+0K/CkL5B4PW/kwll9qDVfRybdTENOcGM4SVYaz4coT7lKg9BRrnt1GFc+cF9Yaqexjg
	CZ6LidrGoB/6siUuVlnNHP4MYLpikhomYyRsGOfFd9pdtxwuSk2WjcxbTXEKUDWBA0MhV8
	289Peuk27S8HzIsWk098UpETTJBoIdE=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-610-Vic9BR1mNcusrdP14gkRAA-1; Fri,
 10 May 2024 15:40:15 -0400
X-MC-Unique: Vic9BR1mNcusrdP14gkRAA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2AEE23806720;
	Fri, 10 May 2024 19:40:15 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.42])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 94EB8491032;
	Fri, 10 May 2024 19:40:13 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	Kate Hsuan <hpa@redhat.com>,
	Sebastian Reichel <sre@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	linux-leds@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH 0/3] power: supply: power-supply-leds: Add activate() callback to triggers
Date: Fri, 10 May 2024 21:40:09 +0200
Message-ID: <20240510194012.138192-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10

Hi All,

This series adds an activate callback to the power-supply LED triggers to
ensure that power-supply LEDs get the correct initial value when the LED
gets registered after the power_supply has been registered.

Patches 1-2 do some refactoring / prep work and patch 3 adds the actual
activate callback.

This series applies on top of "[PATCH v9 6/7] power: supply: power-supply-leds:
Add charging_orange_full_green trigger for RGB LED":
https://lore.kernel.org/all/20240504164105.114017-7-hdegoede@redhat.com/

Regards,

Hans


Hans de Goede (3):
  power: supply: power-supply-leds: Add
    power_supply_[un]register_led_trigger()
  power: supply: power-supply-leds: Share trig pointer for online and
    charging_full
  power: supply: power-supply-leds: Add activate() callback to triggers

 drivers/power/supply/power_supply_leds.c | 176 +++++++++++++----------
 include/linux/power_supply.h             |   9 +-
 2 files changed, 101 insertions(+), 84 deletions(-)

-- 
2.44.0

