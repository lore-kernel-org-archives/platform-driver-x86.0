Received: from gwsmtp.ge.ch (smtpsw24.ge.ch [160.53.250.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E374B283CB1
	for <platform-driver-x86@vger.kernel.org>; Fri, 23 Jan 2026 07:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.53.250.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769154801; cv=none; b=Xtg+eJL4LJg0O2snow3UWKvkcwbBQBJRuu0zi+A8IUUZ7/UoKm/LY6XossYaHkALqR4GC6gY/JenObQbGZrtCVCKkvR1pB3iXPR+AP6Xgn7Fh53QSxVsNhoTL43ClVZdmqgyKCpOPEvLhqWPORJHEEonal1lHQJeEDl46P07FVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769154801; c=relaxed/simple;
	bh=snWhwxMm0Pd/krd08mnMLmoDK5+lH/YkrKOXY6391K8=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=NP6yC/vZf56l0Tt9YkNXTrvH+JIY/2fRuwbob7ME01ZIdrZdG/3bqRUc9bidM7LjkO27fyLKTxi9auVggO8LhtTaE8dJ5qhZjXOL0scqCjQKlqm5JDaYFN5dUEOk3rIR2lsseFEJlOjVTSHFX7pzt52fwuck/ssXMH8IRTZ2PPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=edu.ge.ch; spf=pass smtp.mailfrom=edu.ge.ch; dkim=pass (2048-bit key) header.d=edu.ge.ch header.i=@edu.ge.ch header.b=jYsxrUAM; arc=none smtp.client-ip=160.53.250.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=edu.ge.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=edu.ge.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=edu.ge.ch header.i=@edu.ge.ch header.b="jYsxrUAM"
From: "Devaud Olivier (EDU)" <olivier.devaud@edu.ge.ch>
To: "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>
CC: "jorge.lopez2@hp.com" <jorge.lopez2@hp.com>
Subject: sysfs-class-firmware-attributes - hp-bioscfg new_password
Thread-Index: AdyMPTP2+hjzhwYnQ5uqQX+KElBw9g==
Date: Fri, 23 Jan 2026 07:53:08 +0000
Message-ID: <7caac280ac164ecb91eaf6b7c04eac61@edu.ge.ch>
Accept-Language: fr-CH, en-US
Content-Language: fr-FR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-FEAS-BEC-Info: WlpIGw0aAQkEARIJHAEHBlJSCRoLAAEeDUhZUEhYSFhIWUhZXkguLUVaIy48WlpbWFhYWFldSFpcSAcEAR4BDRpGDA0eCR0MKA0MHUYPDUYLAEhZSFtdSBgECRwOBxoFRQwaAR4NGkUQUF4oHg8NGkYDDRoGDQRGBxoPSFhIWkhZW0hZWEZZXF1GUF5GWV9cSFBIWEhYSFpIWEhYSFhIWVFIAgcaDw1GBAcYDRJaKAAYRgsHBUhYSFtdSBgECRwOBxoFRQwaAR4NGkUQUF4oHg8NGkYDDRoGDQRGBxoPSFg=
X-SM-outgoing: yes
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; d=edu.ge.ch; s=GVA21; c=relaxed/relaxed;
 h=from:to:cc:subject:date:message-id:content-type:mime-version;
 bh=snWhwxMm0Pd/krd08mnMLmoDK5+lH/YkrKOXY6391K8=;
 b=jYsxrUAMONyISbwbuGRjTpMKVKNhG36wEvb69vOvU1kVsp7DsGvsD6HVJQwe1EV5sxZbHPqcKNAL
	z1ZFYQibbLDHkaK2L/2MBtswlI8NvV8FT/RQxFdCB8ncFW8IHy5padm29ah36/lkO4CcqpxcYlTB
	q7WBcC0zZwrJG2i2amP/jetfbe+hPKgCOsND0/qgc113K+zhMGVrf6bc2qSg2r94OsviHxX8ocau
	XRZU/nIKYvGJeMdJ0/2pFjU2A3yfDhZ1PN5ywQtU7XTCu9IiQe7MJpyltTGx+5Tr5WNq3BPvgKQv
	93Uw020CgFspNnQ7gRWh+dxJoq4R978LfuMFsA==

Dear,

I try to define a new admin password with sysfs-class-firmware-attributes f=
rom a live Linux, Clonezilla, kernel version : Debian 6.12.32-1.
I can use with success the sysfs-class-firmware-attributes to modify BIOS s=
etting, e.g.: "/sys/class/firmware-attributes/hp-bioscfg/attributes/Force C=
heck on Reboot/current_value"
- echo -n "myCurrentPassword" > "/sys/class/firmware-attributes/hp-bioscfg/=
authentication/Setup Password/current_password"
- echo -n "Enable" > "/sys/class/firmware-attributes/hp-bioscfg/attributes/=
Force Check on Reboot/current_value"
- echo -n "" > "/sys/class/firmware-attributes/hp-bioscfg/authentication/Se=
tup Password/current_password"

But I cannot define a new BIOS admin password on a laptop, HP EliteBook 840=
 G7 with the BIOS up to date. The commands used are :
- echo -n "myCurrentPassword" > "/sys/class/firmware-attributes/hp-bioscfg/=
authentication/Setup Password/current_password"
- echo -n "myNewPassword" > "/sys/class/firmware-attributes/hp-bioscfg/auth=
entication/Setup Password/new_password"

When a reboot the laptop the BIOS admin password is always "myCurrentPasswo=
rd".

There are no messages when a run the commands.

Best Regards.

Olivier D=E9vaud
Concepteur et coordinateur op=E9rationnel

R=C9PUBLIQUE ET CANTON DE GEN=C8VE
D=E9partement de l'instruction publique, de la formation et de la jeunesse =
(DIP)
Service =E9coles-m=E9dias
Rue des Gazom=E8tres 3
Case postale 241 - 1211 Gen=E8ve 8
T=E9l. +41 (0)22 388 33 15
Code d'acheminement interne=A0: B808E1/DSISEM

