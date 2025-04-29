Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E030329C35D
	for <platform-driver-x86@vger.kernel.org>; Tue, 29 Apr 2025 02:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745893452; cv=none; b=HW6cGIODH1r0mpnYwXcl/0WCM3Ib6CLSbE/dc3bEEphjJZYHZ/ZAR/y8EOtsL11xTjB07r8DJ1ITaFsBA2w4hJ1ksEuU0mNm/shwJ/dvuHvQVCi8AN50b5eQxXIP5YhtWncPHqtiyWQz/Fd8sh19f9h5nHslmIJKld5LH+bO8Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745893452; c=relaxed/simple;
	bh=vx/evDsb8dCFNi+PycX94KWWo6wJwtYEPZ4gf01ZFmE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KHGQL02bmNUWzPNT5moARRMmdDz/1ErNsgA7uaZ8bp5ZWFmiVILPcwbVjea+neOYC10Bmf+jGeHlRS38inqn5ZaE4C8MQtnUylbX6fUoD4ntEZMT/nDZlp83/JEagcew4ZXWFi5dOYLU2TI/R+msQvobgqOp8c/jZOlsOCbJRqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=F9Jip9Sj; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F9Jip9Sj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745893449;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:  content-transfer-encoding:content-transfer-encoding;
	bh=68Cx5BY05mgGnJ3EUfNQNyn6aKA/z+OSswDzH83TEuk=;
	b=F9Jip9SjVYwji5jr/jaWHpp9Cx/cgWMfBhjpCAp/frV7/AW85I0QRmMkExiF/Bk09Uepaj
	Phq5uZLAdoP3IW39KNiSNXhUJhsk9uV5mWOK7kCHzi/WUhwKlSaP1f11bUuqo8dnt9ZeHQ
	MDxk9/oO0atNoovElULlpe+0PTdhIAs=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-626-L6aC55HNP8eQpnQZN1FVNQ-1; Mon,
 28 Apr 2025 22:24:05 -0400
X-MC-Unique: L6aC55HNP8eQpnQZN1FVNQ-1
X-Mimecast-MFC-AGG-ID: L6aC55HNP8eQpnQZN1FVNQ_1745893444
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B254F1956096;
	Tue, 29 Apr 2025 02:24:03 +0000 (UTC)
Received: from debarbos-thinkpadt14gen5.rmtusma.csb (unknown [10.22.80.82])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 05FD41800359;
	Tue, 29 Apr 2025 02:24:01 +0000 (UTC)
Date: Mon, 28 Apr 2025 22:23:59 -0400
From: Derek Barbosa <debarbos@redhat.com>
To: hmh@hmh.eng.br
Cc: hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.org
Subject: thinkpad_acpi: Unhandled HKEY event when toggling GNOME charging
 states
Message-ID: <aBA4PyT3YdKaPFdn@debarbos-thinkpadt14gen5.rmtusma.csb>
Reply-To: debarbos@redhat.com
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Hello,

When toggling the "Battery Charging" options in Gnome 48 on a 6.14 kernel the dmesg logs report the following:

[  290.214972] thinkpad_acpi: unhandled HKEY event 0x6013
[  290.214976] thinkpad_acpi: please report the conditions when this event happened to ibm-acpi-devel@lists.sourceforge.net
[  290.217964] thinkpad_acpi: unhandled HKEY event 0x6013
[  290.217967] thinkpad_acpi: please report the conditions when this event happened to ibm-acpi-devel@lists.sourceforge.net
[  291.449026] thinkpad_acpi: unhandled HKEY event 0x6013
[  291.449033] thinkpad_acpi: please report the conditions when this event happened to ibm-acpi-devel@lists.sourceforge.net
[  291.450991] thinkpad_acpi: unhandled HKEY event 0x6013
[  291.450994] thinkpad_acpi: please report the conditions when this event happened to ibm-acpi-devel@lists.sourceforge.net

This currently happens on a Lenovo ThinkPad T14 Gen 5, with an Intel Core
Ultra 7 165U × 14 CPU, Intel® Graphics (MTL) on kernel-version Linux
6.14.3-300.fc42.x86_64.

Thanks,

