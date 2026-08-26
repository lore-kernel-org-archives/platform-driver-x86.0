Received: from mail.kekto.ru (mail.kekto.ru [188.242.149.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79A0423A85;
	Wed, 26 Aug 2026 13:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.242.149.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787751257; cv=none; b=Ca3xzbRhikiWpNZJBSw6LslCzJYjKBi3mDKM301DOwdbYEtjuzwOQt4zJ8D3aMSQ4ppiuUWe+OQUdvl8Z/nz/GPrBeIaVgog5tSZfCqut5RWgM2O/MydJ48aKONHavFIg1wJmJUwpCI5mnAABGd/anku6ZsTfeXrK0jVA+Kx77s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787751257; c=relaxed/simple;
	bh=1mcK90latnvUdNLufpBMwCi4vFTOUL0HcDw7ZPkDHVI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S8912b7i2Xc1lCorqa+yRWhvXmubatpivNVmS02RPmLhjYxgRs79DZwdsfAESyRwok2SaQ4MUfLLG967aypqPmTfd2VNzPtTzmIKIdWYZNjmu2aFNIpnhjIVorxxIlXIQcEeopn1FO8Gh08k/ggNy58u7CDrycnZftWWFzXxvAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kekto.ru; spf=pass smtp.mailfrom=kekto.ru; dkim=pass (2048-bit key) header.d=kekto.ru header.i=@kekto.ru header.b=tBPgUt71; arc=none smtp.client-ip=188.242.149.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kekto.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kekto.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kekto.ru header.i=@kekto.ru header.b="tBPgUt71"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DC9102549C;
	Wed, 26 Aug 2026 16:26:36 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kekto.ru; s=dkim;
	t=1787750797; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=Vbx+qXOFf5CyCGzdcxlTg4lCAKMp0zllWCwNtYkgiJk=;
	b=tBPgUt71cyRK9FaxPka9i8Xx9Ohen0t5Jg8XeqgBa1mHoF+LNx02DAAsEB0S/w+1UrXB2v
	fZ7JY2fYSrTjxTDgMxUTuERX5tCu7pez17sYSgJ2C3L4deDS2pb3o970FnUoRnE2omRJzM
	wC06HH1Lf+rPWVpdXnNLiS4BSZOKXHTkO37zRdfOBQp0fQnPe6AGdKjlFeqwndzLMbrqx1
	sREKBK/igT2KemzE8f4UPJpavjI8aNADtJUv0+RYPTuRci52x97bTuCK+k/oGrnIzu1j83
	DNeaV238DNdICmhxYmsv3joDkaFJacw3EueFxP3XWHvbecfpWdy7BlaW5UnTHg==
From: KentoNion <kento@kekto.ru>
To: platform-driver-x86@vger.kernel.org,
	Armin Wolf <W_Armin@gmx.de>,
	Yuming Sun <wolf109909@outlook.com>
Cc: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Mingyou Chen <qby140326@gmail.com>,
	Gladyshev Ilya <foxido@foxido.dev>,
	linux-kernel@vger.kernel.org,
	Nabil Danial <nabildanial.93@gmail.com>,
	Nika Krasnova <nika@ableh.moe>
Subject: Re: [RESEND PATCH 0/5] platform/x86: bitland-mifs-wmi: MIFS v2 firmware support (Xiaomi Book Pro 14 2026)
Date: Wed, 26 Aug 2026 16:26:37 +0300
Message-ID: <20260826132637.177773-1-kento@kekto.ru>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <e469fe6b-3293-473c-83db-529ac4502612@gmx.de>
References: <20260728180944.51356-1-wolf109909@outlook.com> <e469fe6b-3293-473c-83db-529ac4502612@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Armin,

On Thu, Jul 30, 2026 at 11:24:14 +0200, Armin Wolf wrote:
> can you share the output of "acpidump" on your machine? Missing Lid
> events usually indicate a deeper problem with the ACPI handling on a
> given machine.

Same product as 4/5 (Xiaomi Book Pro 14 2026, DMI board_name=TM2424,
SKU TM2424-77080, BIOS XMAPT4B0P0707 03/12/2026). acpidump.dat.xz is
416K, too large for vger; I can send it off-list or put it on GitHub.
Decoded DSDT excerpts below.

ECON is declared External in the DSDT and is not defined in any of
the 34 SSDTs. The only references are _STA on Q_EC, ADP1 and LID0:

    External (ECON, IntObj)

    Device (Q_EC)  /* _HID PNP0C09 */
    {
        Method (_STA, 0, NotSerialized)
        {
            If ((ECON == One))
            {
                Return (0x0F)
            }
            Return (Zero)
        }

        OperationRegion (ERAM, SystemMemory, 0xFE0B0300, 0x0100)
        /* LSTE is bit 0 at offset 0x14 of ERAM */

        Method (_GPE, 0, NotSerialized)
        {
            If (ESPI)
            {
                Local0 = 0x6E
            }
            Return (Local0)
        }

        Method (_Q0C, 0, NotSerialized)  /* lid close */
        {
            LIDS = Zero
            ^^^GFX0.CLID = Zero
            Notify (LID0, 0x80)
        }

        Method (_Q0D, 0, NotSerialized)  /* lid open */
        {
            LIDS = One
            ^^^GFX0.CLID = 0x03
            Notify (LID0, 0x80)
        }

        Device (LID0)  /* _HID PNP0C0D */
        {
            Method (_STA, 0, NotSerialized)
            {
                If ((ECON == One))
                {
                    Return (0x0F)
                }
                Return (Zero)
            }
        }
    }

So _STA would return 0 even if ECON existed and were zero, and today
it AE_NOT_FOUNDs:

  ACPI BIOS Error (bug): Could not resolve symbol
  [\_SB.PC00.LPCB.Q_EC._STA.ECON], AE_NOT_FOUND
  (same for Q_EC.ADP1._STA and Q_EC.LID0._STA)

That does not stop the boot DSDT EC or the lid button on this BIOS:

  ACPI: EC: EC started
  ACPI: \_SB_.PC00.LPCB.Q_EC: Boot DSDT EC used to handle transactions
  ACPI: EC: interrupt unblocked
  ACPI: EC: event unblocked
  ACPI: EC: GPE=0x6e
  ACPI: \_SB_.PC00.LPCB.Q_EC: EC: Used to handle transactions and events
  input: Lid Switch as .../PNP0C09:00/PNP0C0D:00/input/input0
  ACPI: button: Lid Switch [LID0]

LID0 is \_SB_.PC00.LPCB.Q_EC.LID0.
/proc/acpi/button/lid/LID0/state reads "open" (SW_LID on event0).
I have not yet captured a close/open pair under acpi_listen; I can
if that is useful.

4/5's claim that "the ACPI EC driver therefore never binds" is not
true here. Polling LSTE and evaluating _Q0C/_Q0D from bitland-mifs-wmi
would be the wrong layer. I am not putting that in the TM2424
follow-up on Mingyou's v5. The remaining bug is the missing ECON
object used by _STA.

Thanks,
Kento
