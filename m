Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795660544;
	b=YxdparSDMF8tVp0OWDhmiub6kTUwjth0iJiYg/d5smT6vznQ6hHAZA1N8Kca9SlZ5o+7
	 5IlG+hPFjsDIl1LEX3YGOrYWzK6KyWsFRMqxN3c3MTwIvowqy4AkLs8RJSIRmiQfRj+0b
	 wUo5WhCtRkm+lQ4R7UWzXo3t9WVILVaiP1zzCzpJzkV825nEDAfzHdjx2fDFrdh14YbPE
	 FQ2nvArWJg/kiszkue8QAqw8QM1f13q19TFOI6+GdTBZTvsgJzNWS9BDf+flSrnzBLJD1
	 E071z3ajHr6MkQwgP0mz4/laR1lgI/AMLvcY2Y9PYjGycx3uRgL5R415EtaAtAQLWuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795660544;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:Mime-Version:X-Mailer:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=SYAKzX21Kh2sJO41pdYAEdjUVj8LHqXhl4mb9nrrAeQ=;
	b=Fzx63NnpH0Xd94UaZupPhBmpH7s6WOtPT8hjOaukn2gx2xRVLmINd4DcKtu8Hz+oLycz
	 BYjsDrDTqaC4DmngedL/2TGy0R+i1hBO4iBWrFlUbTZNm/TgWrafnWR7YjZxUGKoIzhYV
	 UTg6M/dTxjGsUpTamSt7IuhBKlO+BpfkoEQQMejpMduaTyYkUBGCdf/M4Sul0jmoKElP4
	 b02I/xH+spbJi4QBpTJ6DzWRdJ5R5nuUAragqdGX3hQEnf9Sx1vIgupwe0IOKHDCwjoan
	 glp21B8scj6Kj7Vel5LYYsjIJ1x9mWq1e+IhFcYDpiv8WcGDC0WA8p3jYS9Nj6/bKdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--zhenwenliang.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ftZZ7KW4;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F30606A329
	for <platform-driver-x86@vger.kernel.org>; Thu, 26 Nov 2026 02:35:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88F30606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--zhenwenliang.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ftZZ7KW4
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4cbf700ddccso4784079b6e.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2026 18:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795660543; x=1796265343; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SYAKzX21Kh2sJO41pdYAEdjUVj8LHqXhl4mb9nrrAeQ=;
        b=ftZZ7KW4GIVIpexsRtBH4kxa7zAWOML2BgAQsHtb/bfL3ud3ziDte0tfj+QiksOv2/
         d+OrfcnMpnNIxiZl5TTXIHzZnnDJgSyIWaFC1sxagz9idtlp9ER8nAffj0rqDR09/lY1
         BXsLw8VurQWCSOH2nbcXagvrdLwYaRaKMD/hTVoSZXvX8mtKOy3fJCYP4HSesc+wJiy4
         TmjTh6NY7bJcjdUQe8eeqo8r5CjLmYUF8goE+8x4Ae4wr5m1TDZ92pCovCVBWpOjHs1g
         fYNAIE8D1zVhIVk8Un3gSuG7wtFromWuueDlCnqwAPWyrthlo2fQiaNE6Kr43JAmdyQI
         8h4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795660543; x=1796265343;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SYAKzX21Kh2sJO41pdYAEdjUVj8LHqXhl4mb9nrrAeQ=;
        b=IwKZUu27FvV3TuISBm2kCXtveo8vQEW003jq2FQZB5w4M8vOdUhPVha3Pjbl44NPlr
         yv1UExadZsU5AHQPpj15Owf3XOkNtTyy+loYlohSHX+f5Y1UGRO2j3eT6s6Q6cBLSnKp
         LxLZArXY0bXgN/KC6SPkdEebsnE57oHdxaINPP5hM/k5ltQjSTmLC9XZj4eOA+eNuxGU
         9f/cQF/JFUyjq5O76a86nzEOjw0tmRBQXxQeGis6/SoHQKlosrM0hFcDyBt62DffroM5
         O6NGb6B1jnXFUKFSVekdTDC3zs+ZQ4IpoA5dcx+7C4n5SRUQNwcKOqcuPRzHCnr1UnGx
         OE/A==
X-Gm-Message-State: APuU4Z8ykO+1D13C1ED652H4WLc6jupgi+ab+q9dr2nofhWZfxtVhLz6
	Oc07E/3mV26u2yp9WjG67bbwvlGigfgRdzZ5b9rtTW+HFr2MGVWbzqpu61+4Eg7byWgZSZJNXM2
	pxs6wxtHaICNMZV5YfWNcog7G2+/SHQ==
X-Received: from ilbeu7-n1.prod.google.com ([2002:a05:6e02:2f07:10b0:524:59d2:f0f6])
 (user=zhenwenliang job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:67c7:b0:4f5:98d:d1ae with SMTP id 5614622812f47-57a0bb8d52cmr20362723b6e.55.1795660543130;
 Wed, 25 Nov 2026 18:35:43 -0800 (PST)
Date: Thu, 26 Nov 2026 02:35:42 +0000
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261126023542.4161884-1-zhenwenliang@google.com>
Subject: platform/x86: hp-bioscfg: concurrent writes to the SPM sk/kek
 attributes can free each other's key buffer
From: Zhenwen Liang <zhenwenliang@google.com>
To: Jorge Lopez <jorge.lopez2@hp.com>, Hans de Goede <hansg@kernel.org>, 
	"=?UTF-8?q?Ilpo=20J=C3=A4rvinen?=" <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

sk_store() and kek_store() in
drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c keep their
temporary copy of the user's key in a global pointer and use it without
any lock (mainline ebb7a8dc1e74):

    /* :237 */
    bioscfg_drv.spm_data.signing_key = kmemdup(buf, length,
                                               GFP_KERNEL);
    ...
    ret = hp_wmi_perform_query(HPWMI_SECUREPLATFORM_SET_SK, ...,
            (void *)bioscfg_drv.spm_data.signing_key, length, 0);
    ...
    kfree(bioscfg_drv.spm_data.signing_key);    /* :252 */
    bioscfg_drv.spm_data.signing_key = NULL;

kek_store() does the same with spm_data.endorsement_key (:272-290).

sysfs serialises writes only per open file, so two writes to
/sys/class/firmware-attributes/hp-bioscfg/authentication/SPM/sk (or kek)
through two open file descriptions run concurrently. Then:

  W1: signing_key = buf1
  W2: signing_key = buf2              (buf1 is now leaked)
  W1: hp_wmi_perform_query(.., signing_key=buf2, len1)
  W2: hp_wmi_perform_query(..) ... kfree(buf2); signing_key = NULL
  W1: ... kfree(NULL) or a second kfree(buf2)

Depending on the interleaving this gives a use-after-free read of the
key buffer in hp_wmi_perform_query() (it copies the buffer into the WMI
input), a double free, the wrong key (or a buffer of the wrong length)
sent to the BIOS, or a leak. Since the pointer is only a temporary for
one call, using a local variable in both functions (or a mutex around
the sequence) would remove the race.

Affected: since the driver was added (b2715aa2e135, 2023-07); unchanged
in mainline ebb7a8dc1e74 and next-20261125. This is different from
a7508c7959ff ("fix heap OOB read in sk_store() and kek_store()"), which
fixed a single-threaded length issue. Trigger: root only (the attributes
are 0200) on HP machines with Secure Platform Management. Impact: memory
corruption or wrong key material sent to the firmware.

Found by a formal analysis tool we are developing that uses AI
assistance; I have reviewed the analysis and this report. The tool runs
verbatim copies of the kernel functions with stubs for the rest of the
kernel; it found the interleaving above, and the interleaving was
replayed natively on that harness under the tool's schedule. Functions
involved: sk_store() and kek_store() (the WMI call stubbed). It has not
been reproduced on HP hardware.

Thanks,
Zhenwen Liang
