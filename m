Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47DE1C04A95
	for <platform-driver-x86@archiver.kernel.org>; Tue, 25 Oct 2022 12:16:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231429AbiJYMQT (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 25 Oct 2022 08:16:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231352AbiJYMQS (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 25 Oct 2022 08:16:18 -0400
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CFBA13ECE7
        for <platform-driver-x86@vger.kernel.org>; Tue, 25 Oct 2022 05:16:15 -0700 (PDT)
Received: by mail-qt1-x82d.google.com with SMTP id cr19so7367116qtb.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 25 Oct 2022 05:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nametag.social; s=google;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6ZQ33xo4+dWaJoSKlIMokXjioyfWsbeDGdwT1IhswFY=;
        b=w292aWygyJ+s2TkJYmY/NW65SfCm5d0X8w/PJ9WUjVj5qSMDm6BwpJ3sfNlN4c+bUU
         t813EDxJ9cScIIzSSF68C8AWBW0sAFzIKxKFpj1nIOokt+ZnTnB6t8ngfO7upaVcRTxy
         RZVlZ2o30bNmhSLVzMgitKzj+Fr9jmpNPLABHSyDxalLGOzRjnkKMi5y04rfmBoODkBQ
         5Q7vDjQ28jjG2UFqXWrE05y8Pa8mwVJamUq2XYPNY4lId2Gh4afoEwE01PVlMFIXResM
         GQn2Kqafp4/3Ixre/+dGeBNwAn4FrDMe8DLIEFyiComDjXOBqXQ7LNbFlSeR3TrsA7WL
         ymSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6ZQ33xo4+dWaJoSKlIMokXjioyfWsbeDGdwT1IhswFY=;
        b=DJMBSrKnk2v2+++wn1jvmnGN1pJljDad0Vg88/ow7nF/O029s/k1abmUeS91YxxRdi
         ZErV3sLsiz9+MDbLKyj4BM8p75IjdZe6WzzXpFXhHaEYhEGwmoOgX8ZaKXLYaZBfX8RT
         P4NRMcW/V8zl75k913uPwaxQfw7ocCV2ozMrn7yTT5mChVXtc5fHiI2JO1rBtoSD9CVf
         xxLPUVWKsgSsItWvAg2ppD05Ec7I0zk2tRnxp0wtS3ejXqCWx+3JLrsFpzcU3+RpXClt
         d3pkn6h5HXVddq5TKVQalg/S4RSVXgbQ4nAFnr7dMGlw001BkDhi7OQKDBGUcsb5xorK
         yFTQ==
X-Gm-Message-State: ACrzQf3NxlkQWqZVHNqU33keDPUZMs6aCjyAlaDTAhhrAcFXXm2xmwH0
        HXgs1/xRE04hQ9Fdq/lH1iygd4+1DKHTmq/a14hypO45w1VFyX9u
X-Google-Smtp-Source: AMsMyM6pLwoMeEfu/gPRdq7CYVOOPZgmqFzEM2Ta637ErMX1VnXy7WzadZZ/nhO7wr0O/rHfi3s4tSjByhwlHS8lNSE=
X-Received: by 2002:ac8:7f54:0:b0:39c:bb57:a1aa with SMTP id
 g20-20020ac87f54000000b0039cbb57a1aamr31876561qtk.382.1666700174518; Tue, 25
 Oct 2022 05:16:14 -0700 (PDT)
MIME-Version: 1.0
From:   Victor Stewart <v@nametag.social>
Date:   Tue, 25 Oct 2022 13:16:03 +0100
Message-ID: <CAM1kxwh7DQoZBcU-s-pkbhpWGieQ3QGHd89zjTbeoFYo7h9zHg@mail.gmail.com>
Subject: [BUG] Intel PECI Overheating
To:     platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

i have an Intel NUC6i7KYB on my LAN that i use for dev running Clear
Linux 6.0.2-1201.native on Intel(R) Core(TM) i7-6770HQ CPU @ 2.60GHz.

i can't pinpoint exactly when but sometime in the last 2 months the
fan, normally silent, after a certain amount of idle time post boot,
the fan suddenly goes wild and then does not stop until the device is
rebooted.

i finally decided to look into this the other day and saw that the
only temp critical component is the PECI Agent 0 as seen below, and
then saw that support for this component was added in Linux 5.18.

so there must be a bug somewhere. let me know what data i can gather
or what other information you need to help solve this.

root@clr-5c27a0d08c52445f9231f0c9c48a96b6~ # sensors
iwlwifi_1-virtual-0
Adapter: Virtual device
temp1:        +51.0=C2=B0C

acpitz-acpi-0
Adapter: ACPI interface
temp1:        +27.8=C2=B0C  (crit =3D +119.0=C2=B0C)
temp2:        +29.8=C2=B0C  (crit =3D +119.0=C2=B0C)

coretemp-isa-0000
Adapter: ISA adapter
Package id 0:  +40.0=C2=B0C  (high =3D +100.0=C2=B0C, crit =3D +100.0=C2=B0=
C)
Core 0:        +36.0=C2=B0C  (high =3D +100.0=C2=B0C, crit =3D +100.0=C2=B0=
C)
Core 1:        +36.0=C2=B0C  (high =3D +100.0=C2=B0C, crit =3D +100.0=C2=B0=
C)
Core 2:        +35.0=C2=B0C  (high =3D +100.0=C2=B0C, crit =3D +100.0=C2=B0=
C)
Core 3:        +38.0=C2=B0C  (high =3D +100.0=C2=B0C, crit =3D +100.0=C2=B0=
C)

nvme-pci-3d00
Adapter: PCI adapter
Composite:    +84.8=C2=B0C  (low  =3D +109.8=C2=B0C, high =3D +109.8=C2=B0C=
)
                       (crit =3D +129.8=C2=B0C)
Sensor 2:     +98.8=C2=B0C  (low  =3D +109.8=C2=B0C, high =3D +109.8=C2=B0C=
)

nct6776-isa-0a00
Adapter: ISA adapter
in0:                   688.00 mV (min =3D  +0.00 V, max =3D  +1.74 V)
in1:                     1.23 V  (min =3D  +0.00 V, max =3D  +0.00 V)  ALAR=
M
in2:                     3.31 V  (min =3D  +0.00 V, max =3D  +0.00 V)  ALAR=
M
in3:                     3.31 V  (min =3D  +0.00 V, max =3D  +0.00 V)  ALAR=
M
in4:                   952.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  ALAR=
M
in5:                     0.00 V  (min =3D  +0.00 V, max =3D  +0.00 V)
in6:                   608.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  ALAR=
M
in7:                     3.30 V  (min =3D  +0.00 V, max =3D  +0.00 V)  ALAR=
M
in8:                     3.18 V  (min =3D  +0.00 V, max =3D  +0.00 V)  ALAR=
M
fan1:                     0 RPM  (min =3D    0 RPM)
fan2:                  5212 RPM  (min =3D    0 RPM)
SYSTIN:                 +58.0=C2=B0C  (high =3D +80.0=C2=B0C, hyst =3D +75.=
0=C2=B0C)
sensor =3D thermistor
CPUTIN:                 +45.5=C2=B0C  (high =3D +80.0=C2=B0C, hyst =3D +75.=
0=C2=B0C)
sensor =3D thermistor
AUXTIN:                 +49.0=C2=B0C  (high =3D +80.0=C2=B0C, hyst =3D +75.=
0=C2=B0C)
sensor =3D thermistor
PCH_CHIP_TEMP:           +0.0=C2=B0C  (high =3D  +0.0=C2=B0C, hyst =3D  +0.=
0=C2=B0C)  ALARM
PCH_CHIP_CPU_MAX_TEMP:  +59.0=C2=B0C  (high =3D +80.0=C2=B0C, hyst =3D +75.=
0=C2=B0C)
PECI Agent 0:          +100.0=C2=B0C  (high =3D +80.0=C2=B0C, hyst =3D +75.=
0=C2=B0C)
                                 (crit =3D +100.0=C2=B0C)
PCH_CPU_TEMP:            +0.0=C2=B0C
intrusion0:            OK
intrusion1:            OK
beep_enable:           disabled

pch_skylake-virtual-0
Adapter: Virtual device
temp1:        +59.0=C2=B0C

nvme-pci-3e00
Adapter: PCI adapter
Composite:    +38.9=C2=B0C  (low  =3D  -0.1=C2=B0C, high =3D +74.8=C2=B0C)
                       (crit =3D +79.8=C2=B0C)
