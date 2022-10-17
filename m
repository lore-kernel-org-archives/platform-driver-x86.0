Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D9B5C4332F
	for <platform-driver-x86@archiver.kernel.org>; Mon, 17 Oct 2022 14:11:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230211AbiJQOLc (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 17 Oct 2022 10:11:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229673AbiJQOLb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 17 Oct 2022 10:11:31 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46A8057BC1
        for <platform-driver-x86@vger.kernel.org>; Mon, 17 Oct 2022 07:11:27 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id 81so13409950ybf.7
        for <platform-driver-x86@vger.kernel.org>; Mon, 17 Oct 2022 07:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dPk9yFMp+v986QocbGleHUAeid1rorABP2XGqmjs3MQ=;
        b=Fpr0zJU/h2fECEPO4S4djG5jWtThr5OCT1mWccGZH2Hu95ECvV9s1v6xpOsuXsldD3
         2JYg2Xscqsafc3pYYWpaHMMI10Q3uhVtifAzwnGlYSzVTxGBdF+vlqM9++nf2khQOurV
         PV84hZqN+NwvfrBbF/MeSybknhJoO6UsOJX1qrpMuTLgfEiAbNATLppnToJ8AcfTJqyQ
         rzaxRhQRIBSxSp7+NaadIN++a54uSM1mLfdA3wJmRb05KcW+JCGqyrX3Kx/ds0uTwmwu
         Cxivmy8xbpzLZf3BJ7QEOqcf5o9PoeqtEVVSISiERQ/5INjXQtwacDNjWniyn8O7Pwuo
         DbvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dPk9yFMp+v986QocbGleHUAeid1rorABP2XGqmjs3MQ=;
        b=UBS9zkexOcQN3Hy//9idDQJiWbarBdTTglGb8PL0fkRUR6GJXYGUsLm0THLqXL3WcW
         tIOuJq9wl2258Am/5UyrM1vNjqCQzw8kmqDnOV1289sCITvt8FIAYcXITtv6F6aIprel
         u4RuOpiuVaROcQArofI74yqf7gZ2jbTuP/4PL2HF0+xq4iFFhNWWRr4skJrb6sH6AdyD
         0o5b5SiSJzqO5RtMQw8kK4/o6H99f1ctne4j3TwRUNZflNvsC/TsVhMwO6HikQ3+Ko6m
         B09iJnOrDnaGJG70uq17XqU4oLZDSCUk78ZxWbjeHLcYSiQTtgh5xhd3PxD7a1qw0S6t
         5vJA==
X-Gm-Message-State: ACrzQf1o1+452jf+zktTPgdiaU2LID1rrz8e+kXMn5LfSPmWQPaDG1xd
        lMwbq6wIaIrSq3+1qjkmkf5vKAoobvWXujKToST/EQ/Fy0U=
X-Google-Smtp-Source: AMsMyM6QAJMmgnUhc5mw67DCc7GMKlDe+aR/efkcayejUefvUKLd/ztlk7QsURSCKrSXDHDbKT8a8ydk6fbsrXGqxq4=
X-Received: by 2002:a25:16d6:0:b0:6b1:4a12:b2f4 with SMTP id
 205-20020a2516d6000000b006b14a12b2f4mr10094293ybw.217.1666015885665; Mon, 17
 Oct 2022 07:11:25 -0700 (PDT)
MIME-Version: 1.0
References: <20221010162326.12957-1-jorge.lopez2@hp.com> <20221010162326.12957-2-jorge.lopez2@hp.com>
 <a50407fd-6969-9e9a-23a3-39879af639cd@amd.com> <CAOOmCE--qzRCOgpfpW5j5VmnCPExdTVDM9yQ-PcXrec76e492Q@mail.gmail.com>
 <d88e15ba-9e3f-310d-118b-7ccb2fbe1ca9@amd.com> <CAOOmCE9wVT=Fr72pgx58X4RMPy554MwZev3_8JtU8cBLdNpfhA@mail.gmail.com>
In-Reply-To: <CAOOmCE9wVT=Fr72pgx58X4RMPy554MwZev3_8JtU8cBLdNpfhA@mail.gmail.com>
From:   Jorge Lopez <jorgealtxwork@gmail.com>
Date:   Mon, 17 Oct 2022 09:11:12 -0500
Message-ID: <CAOOmCE9fuHTTVcSUSC0SU3N_ht8uVLg4hGUAJE7bJgs6UAt3gA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] Introduction of HP-BIOSCFG driver
To:     "Limonciello, Mario" <mario.limonciello@amd.com>
Cc:     hdegoede@redhat.com, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

''Hi Mario,

Please see comments to previous source comments.

On Mon, Oct 17, 2022 at 8:18 AM Jorge Lopez <jorgealtxwork@gmail.com> wrote=
:
>
> Hi Mario,
>
> On Mon, Oct 10, 2022 at 4:31 PM Limonciello, Mario
> <mario.limonciello@amd.com> wrote:
> >
> > On 10/10/2022 16:26, Jorge Lopez wrote:
> > > Hi Mario,
> > >
> > > On Mon, Oct 10, 2022 at 11:57 AM Limonciello, Mario
> > > <mario.limonciello@amd.com> wrote:
> > >>
> > >> Hi Jorge,
> > >>
> > >> Thanks for submitting this.  I had a try with a HP pro x360 435 that=
 I
> > >> have on my side.
> > >>
> > >> I have some high level comments nested and below.
> > >>
> > >> 1) I noticed that some attributes are definitely read only, I wonder=
 if
> > >> it makes sense to set current_value as "r" instead of "rw" in those =
cases.
> > >>
> > >> Such as "Born On Date" or "AMD PSP FW Version" and "BIOS Build Versi=
on"
> > >
> > > It is a valid point.  The data reported by BIOS has an extra field
> > > that indicates if
> > > an attribute is readOnly or not.  Although all attributes are given
> > > 'rw' permissions,
> > > the driver checks for the IsReadOnly value to determine if the write
> > > command is allowed.
> > >
> >
> > Thanks.  If you make this change for v2, I can make the matching change
> > in fwupd so that if it notices current_value permissions like this that
> > it shows read only there too.
>
> Submitted the recommended changes for review in v2
>
> >
> > >>
> > >> 2) I noticed that "pending_reboot" is only updated for two attribute=
s,
> > >> should it be updated for more than that?
> > >>
> > >
> > > At this time, updating two attributes requires the system to reboot. =
  A reboot
> > > is necessary because BIOS requires the user to enter the Physical
> > > Presence Indicator
> > > (PPI) upon reboot.  I will check with the BIOS team if any other
> > > attributes require
> > > a reboot for the data to be updated.
> >
> > I think other vendors use the "pending_reboot" to indicate that changes
> > aren't technically "effective" until the reboot as well, not just PPI.
> >
>
> There is not a reliable mechanism to programmatically determine which
> BIOS settings require a reboot to be updated.  The v2 changes
> leverages =E2=80=9CRequiredPhysicalPresence=E2=80=9D reported value to se=
t
> pending_reboot.
>
> > >
> > >> 3) I didn't look exhaustively, but in a lot of cases the attribute n=
ame and
> > >> display_name key seem to have the same values.  Is that intended?
> > >>
> > > At this time, the attribute name and display key name are the same.
> > > This behavior is necessary for customers to reuse their signed payloa=
d
> > > created in
> > > CMSL (Windows) to be leveraged by the Linux driver.
> > >
> >
> > OK thanks.
> >
> > This leaves some funny side effects on my system.  For example I don't
> > know what this attribute means.  Do I get to remove a day of the week? =
=3D)
> >
> > $ sudo grep -v foo
> > /sys/class/firmware-attributes/hp-bioscfg/attributes/Tuesday/*
> > /sys/class/firmware-attributes/hp-bioscfg/attributes/Tuesday/current_va=
lue:Disable
> > /sys/class/firmware-attributes/hp-bioscfg/attributes/Tuesday/display_na=
me:Tuesday
> > /sys/class/firmware-attributes/hp-bioscfg/attributes/Tuesday/display_na=
me_language_code:en_US.UTF-8
> > /sys/class/firmware-attributes/hp-bioscfg/attributes/Tuesday/possible_v=
alues:Disable;Enable
> > /sys/class/firmware-attributes/hp-bioscfg/attributes/Tuesday/type:enume=
ration
> >
> > If there are a lot of attributes like this, you should consider an extr=
a
> > override to exclude them from exporting or to better explain them in te=
h
> > driver.
> >
> > BTW I have a few other comments nested inline, take a look at those too=
.
>
> Submitted a patch to improve the friendly display name for
> few numbers of attributes associated with =E2=80=98Schedule Power-ON.=E2=
=80=99  BIOS
> assign names such =E2=80=98Tuesday=E2=80=99 to an attribute. The name is =
correct, but
> it is not descriptive enough for the user.  Under those
> conditions a portion of the path data value is appended to the attribute
> name to create a user-friendly display name.
>
> For instance, the attribute name is =E2=80=98Tuesday,=E2=80=99 and the di=
splay name
> value is =E2=80=98Schedule Power-ON =E2=80=93 Tuesday=E2=80=99
>
>
> >
> > >
> > >> On 10/10/2022 11:23, Jorge Lopez wrote:
> > >>> The purpose for this patch is submit HP BIOSCFG driver to be list o=
f
> > >>> HP Linux kernel drivers.  HP BIOS Configuration driver purpose is t=
o
> > >>> provide a driver supporting the latest sysfs class firmware attribu=
tes
> > >>> framework allowing the user to change BIOS settings and security
> > >>> solutions on HP Inc.=E2=80=99s commercial notebooks.
> > >>>
> > >>> Many features of HP Commercial PC=E2=80=99s can be managed using Wi=
ndows
> > >>> Management Instrumentation (WMI). WMI is an implementation of Web-B=
ased
> > >>> Enterprise Management (WBEM) that provides a standards-based interf=
ace
> > >>> for changing and monitoring system settings.  HP BISOCFG driver pro=
vides
> > >>> a native Linux solution and the exposed features facilitates the
> > >>> migration to Linux environments.
> > >>>
> > >>> The Linux security features to be provided in hp-bioscfg driver ena=
bles
> > >>> managing the BIOS settings and security solutions via sysfs, a virt=
ual
> > >>> filesystem that can be used by user-mode applications.   The new
> > >>> documentation cover features such Secure Platform Management, Sure
> > >>> Admin, and Sure Start.  Each section provides security feature
> > >>> description and identifies sysfs directories and files exposed by
> > >>> the driver.
> > >>>
> > >>> Many HP Commercial PC=E2=80=99s include a feature called Secure Pla=
tform
> > >>> Management (SPM), which replaces older password-based BIOS settings
> > >>> management with public key cryptography. PC secure product manageme=
nt
> > >>> begins when a target system is provisioned with cryptographic keys
> > >>> that are used to ensure the integrity of communications between sys=
tem
> > >>> management utilities and the BIOS.
> > >>>
> > >>> HP Commercial PC=E2=80=99s have several BIOS settings that control =
its behaviour
> > >>> and capabilities, many of which are related to security. To prevent
> > >>> unauthorized changes to these settings, the system can be configure=
d
> > >>> to use a Sure Admin cryptographic signature-based authorization str=
ing
> > >>> that the BIOS will use to verify authorization to modify the settin=
g.
> > >>>
> > >>> Signed-off-by: Jorge Lopez <jorge.lopez2@hp.com>
> > >>>
> > >>> ---
> > >>> Based on the latest platform-drivers-x86.git/for-next
> > >>> ---
> > >>>    .../testing/sysfs-class-firmware-attributes   |  175 ++-
> > >>>    drivers/platform/x86/Kconfig                  |    1 +
> > >>>    drivers/platform/x86/Makefile                 |    1 +
> > >>>    drivers/platform/x86/hp/Kconfig               |   35 +
> > >>>    drivers/platform/x86/hp/Makefile              |   19 +
> > >>>    drivers/platform/x86/hp/biosattr-interface.c  |  286 +++++
> > >>>    drivers/platform/x86/hp/bioscfg.c             | 1029 +++++++++++=
++++++
> > >>>    drivers/platform/x86/hp/bioscfg.h             |  667 +++++++++++
> > >>>    drivers/platform/x86/hp/enum-attributes.c     |  504 ++++++++
> > >>>    drivers/platform/x86/hp/int-attributes.c      |  461 ++++++++
> > >>>    drivers/platform/x86/hp/ordered-attributes.c  |  568 +++++++++
> > >>>    .../platform/x86/hp/passwdattr-interface.c    |   50 +
> > >>>    .../platform/x86/hp/passwdobj-attributes.c    |  640 ++++++++++
> > >>>    drivers/platform/x86/hp/spmobj-attributes.c   |  408 +++++++
> > >>>    drivers/platform/x86/hp/string-attributes.c   |  447 +++++++
> > >>>    .../platform/x86/hp/sureadmin-attributes.c    |  984 +++++++++++=
+++++
> > >>>    .../platform/x86/hp/surestart-attributes.c    |  145 +++
> > >>>    17 files changed, 6419 insertions(+), 1 deletion(-)
> > >>>    create mode 100644 drivers/platform/x86/hp/Kconfig
> > >>>    create mode 100644 drivers/platform/x86/hp/Makefile
> > >>>    create mode 100644 drivers/platform/x86/hp/biosattr-interface.c
> > >>>    create mode 100644 drivers/platform/x86/hp/bioscfg.c
> > >>>    create mode 100644 drivers/platform/x86/hp/bioscfg.h
> > >>>    create mode 100644 drivers/platform/x86/hp/enum-attributes.c
> > >>>    create mode 100644 drivers/platform/x86/hp/int-attributes.c
> > >>>    create mode 100644 drivers/platform/x86/hp/ordered-attributes.c
> > >>>    create mode 100644 drivers/platform/x86/hp/passwdattr-interface.=
c
> > >>>    create mode 100644 drivers/platform/x86/hp/passwdobj-attributes.=
c
> > >>>    create mode 100644 drivers/platform/x86/hp/spmobj-attributes.c
> > >>>    create mode 100644 drivers/platform/x86/hp/string-attributes.c
> > >>>    create mode 100644 drivers/platform/x86/hp/sureadmin-attributes.=
c
> > >>>    create mode 100644 drivers/platform/x86/hp/surestart-attributes.=
c
> > >>>
> > >>> diff --git a/Documentation/ABI/testing/sysfs-class-firmware-attribu=
tes b/Documentation/ABI/testing/sysfs-class-firmware-attributes
> > >>> index 4cdba3477176..d3830b8a398f 100644
> > >>> --- a/Documentation/ABI/testing/sysfs-class-firmware-attributes
> > >>> +++ b/Documentation/ABI/testing/sysfs-class-firmware-attributes
> > >>> @@ -22,6 +22,13 @@ Description:
> > >>>                        - integer: a range of numerical values
> > >>>                        - string
> > >>>
> > >>> +             HP specific types
> > >>> +             -----------------
> > >>> +                     - ordered-list - a set of ordered list valid =
values
> > >>> +                     - sure-admin
> > >>> +                     - sure-start
> > >>> +
> > >>> +
> > >>>                All attribute types support the following values:
> > >>>
> > >>>                current_value:
> > >>> @@ -126,6 +133,63 @@ Description:
> > >>>                                        value will not be effective =
through sysfs until this rule is
> > >>>                                        met.
> > >>>
> > >>> +             HP specific class extensions
> > >>> +             ------------------------------
> > >>> +
> > >>> +             On HP systems the following additional attributes are=
 available:
> > >>> +
> > >>> +             "ordered-list"-type specific properties:
> > >>> +
> > >>> +             elements:
> > >>> +                                     A file that can be read to ob=
tain the possible
> > >>> +                                     list of values of the <attr>.=
 Values are separated using
> > >>> +                                     semi-colon (``;``)
> > >>
> > >> This should be clarified that it's values of particular priority whe=
n
> > >> written to current_value.

The requested information will be added in v3

> > >>
> > >>> +
> > >>> +             "sure-admin"-type specific properties:
> > >>> +
> > >>> +             settings:
> > >>> +                                     A file associated with Sure A=
dmin. BIOS settings can
> > >>> +                                     be read or written through th=
e Sure Admin settings file in sysfs.
> > >>> +
> > >>> +                                     [BIOS setting],[new value],[a=
uth token]
> > >>> +
> > >>> +                                     Sample settings reported data
> > >>> +
> > >>> +                                     {
> > >>> +                                             "Class": "HPBIOS_BIOS=
Enumeration",
> > >>> +                                             "Name": "USB Storage =
Boot",
> > >>> +                                             "Path": "\\Advanced\\=
Boot Options",
> > >>> +                                             "IsReadOnly": 0,
> > >>> +                                             ...
> > >>> +                                             "Value": "Enable",
> > >>> +                                             "Size": 2,
> > >>> +                                             "PossibleValues": [
> > >>> +                                                     "Disable",
> > >>> +                                                     "Enable"
> > >>> +                                                     ]
> > >>> +                                     }
> > >>> +
> > >>> +                                     This file can also be written=
 to in order to update
> > >>> +                                     the value sof a <attr> using =
a CMSL generated payload.
> > >>> +                                     For example:
> > >>> +
> > >>> +                                     <attr>,[value],[CMSL generate=
d payload]
> > >>> +
> > >>> +             "sure-start"-type specific properties:
> > >>> +
> > >>> +             audit_log_entries:
> > >>> +                                     A read-only file that returns=
 the events in the log.
> > >>> +
> > >>> +                                     Audit log entry format
> > >>> +
> > >>> +                                     Byte 0-15:   Requested Audit =
Log entry  (Each Audit log is 16 bytes)
> > >>> +                                     Byte 16-127: Unused
> > >>> +
> > >>> +             audit_log_entry_count:
> > >>> +                                     A read-only file that returns=
 the number of existing audit log events available to be read.
> > >>> +
> > >>> +                                     [No of entries],[log entry si=
ze],[Max number of entries supported]
> > >>> +
> > >>>    What:               /sys/class/firmware-attributes/*/authenticat=
ion/
> > >>>    Date:               February 2021
> > >>>    KernelVersion:      5.11
> > >>> @@ -206,7 +270,7 @@ Description:
> > >>>                Drivers may emit a CHANGE uevent when a password is =
set or unset
> > >>>                userspace may check it again.
> > >>>
> > >>> -             On Dell and Lenovo systems, if Admin password is set,=
 then all BIOS attributes
> > >>> +             On Dell, Lenovo, and HP systems, if Admin password is=
 set, then all BIOS attributes
> > >>>                require password validation.
> > >>>                On Lenovo systems if you change the Admin password t=
he new password is not active until
> > >>>                the next boot.
> > >>> @@ -296,6 +360,15 @@ Description:
> > >>>                                                echo "signature" > a=
uthentication/Admin/signature
> > >>>                                                echo "password" > au=
thentication/Admin/certificate_to_password
> > >>>
> > >>> +             HP specific class extensions
> > >>> +             --------------------------------
> > >>> +
> > >>> +             On HP systems the following additional settings are a=
vailable:
> > >>> +
> > >>> +             role: enhanced-bios-auth:
> > >>> +                                     This role is specific to Secu=
re Platform Management (SPM) attribute.
> > >>> +                                     It requires configuring an en=
dorsement (kek) and signing certificate (sk).
> > >>> +
> > >>>
> > >>>    What:               /sys/class/firmware-attributes/*/attributes/=
pending_reboot
> > >>>    Date:               February 2021
> > >>> @@ -364,3 +437,103 @@ Description:
> > >>>                use it to enable extra debug attributes or BIOS feat=
ures for testing purposes.
> > >>>
> > >>>                Note that any changes to this attribute requires a r=
eboot for changes to take effect.
> > >>> +
> > >>> +
> > >>> +             HP specific class extensions
> > >>> +             --------------------------------
> > >>> +
> > >>> +What:                /sys/class/firmware-attributes/*/authenticati=
on/SPM/kek
> > >>> +Date:                March 29
> > >>> +KernelVersion:       5.18
> > >>> +Contact:     "Jorge Lopez" <jorge.lopez2@hp.com>
> > >>> +Description: 'kek' is a write-only file that can be used to config=
ure the
> > >>> +             RSA public key that will be used by the BIOS to verif=
y
> > >>> +             signatures when setting the signing key.  When writte=
n,
> > >>> +             the bytes should correspond to the KEK certificate
> > >>> +             (x509 .DER format containing an OU).  The size of the
> > >>> +             certificate must be less than or equal to 4095 bytes.
> > >>> +
> > >>> +
> > >>> +What:                /sys/class/firmware-attributes/*/authenticati=
on/SPM/sk
> > >>> +Date:                March 29
> > >>> +KernelVersion:       5.18
> > >>> +Contact:     "Jorge Lopez" <jorge.lopez2@hp.com>
> > >>> +Description: 'sk' is a write-only file that can be used to configu=
re the RSA
> > >>> +             public key that will be used by the BIOS to verify si=
gnatures
> > >>> +             when configuring BIOS settings and security features.=
  When
> > >>> +             written, the bytes should correspond to the modulus o=
f the
> > >>> +             public key.  The exponent is assumed to be 0x10001.
> > >>> +
> > >>> +
> > >>> +What:                /sys/class/firmware-attributes/*/authenticati=
on/SPM/status
> > >>> +Date:                March 29
> > >>> +KernelVersion:       5.18
> > >>> +Contact:     "Jorge Lopez" <jorge.lopez2@hp.com>
> > >>> +Description: 'status' is a read-only file that returns ASCII text =
reporting
> > >>> +             the status information.
> > >>> +
> > >>> +               State:  Not Provisioned / Provisioned / Provisionin=
g in progress
> > >>> +               Version:  Major.   Minor
> > >>> +               Feature Bit Mask: <16-bit unsigned number display i=
n hex>
> > >>> +               SPM Counter: <16-bit unsigned number display in bas=
e 10>
> > >>> +               Signing Key Public Key Modulus (base64):
> > >>> +               KEK Public Key Modulus (base64):
> > >>> +
> > >>> +
> > >>> +What:                /sys/class/firmware-attributes/*/authenticati=
on/SPM/statusbin
> > >>> +Date:                March 29
> > >>> +KernelVersion:       5.18
> > >>> +Contact:     "Jorge Lopez" <jorge.lopez2@hp.com>
> > >>> +Description: 'statusbin' is a read-only file that returns identica=
l status
> > >>> +             information reported by 'status' file in binary forma=
t.
> > >>> +
> > >>> +
> > >>> +What:                /sys/class/firmware-attributes/*/attributes/S=
ure_Admin/settings
> > >>> +Date:                March 29
> > >>> +KernelVersion:       5.18
> > >>> +Contact:     "Jorge Lopez" <jorge.lopez2@hp.com>
> > >>> +Description: 'settings' is a file associated with Sure Admin. BIOS=
 settings can
> > >>> +             be read or written through the Sure Admin settings fi=
le in sysfs.
> > >>> +
> > >>> +             Expected data format to update BIOS setting
> > >>> +
> > >>> +               [BIOS setting],[new value],[auth token]
> > >>> +
> > >>> +             Sample settings reported data
> > >>> +
> > >>> +               {
> > >>> +                       "Class": "HPBIOS_BIOSEnumeration",
> > >>> +                       "Name": "USB Storage Boot",
> > >>> +                       "Path": "\\Advanced\\Boot Options",
> > >>> +                       "IsReadOnly": 0,
> > >>> +                       ...
> > >>> +                       "Value": "Enable",
> > >>> +                       "Size": 2,
> > >>> +                       "PossibleValues": [
> > >>> +                             "Disable",
> > >>> +                             "Enable"
> > >>> +                             ]
> > >>> +               }
> > >>> +
> > >>> +
> > >>> +What:                /sys/class/firmware-attributes/*/attributes/S=
ure_Start/audit_log_entry_count
> > >>> +Date:                March 29
> > >>> +KernelVersion:       5.18
> > >>> +Contact:     "Jorge Lopez" <jorge.lopez2@hp.com>
> > >>> +Description: audit_log_entry_count is a read-only file that return=
s the
> > >>> +             number of existing audit log events available to be r=
ead.
> > >>> +
> > >>> +               [No of entries],[log entry size],[Max number of ent=
ries supported]
> > >>> +
> > >>> +
> > >>> +What:                /sys/class/firmware-attributes/*/attributes/S=
ure_Start/audit_log_entries
> > >>> +Date:                March 29
> > >>> +KernelVersion:       5.18
> > >>> +Contact:     "Jorge Lopez" <jorge.lopez2@hp.com>
> > >>> +Description: audit_log_entries is a read-only file that returns th=
e events
> > >>> +             in the log.
> > >>> +
> > >>> +             Audit log entry format
> > >>> +
> > >>> +               Byte 0-15:   Requested Audit Log entry  (Each Audit=
 log is 16 bytes)
> > >>> +               Byte 16-127: Unused
> > >>> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kc=
onfig
> > >>> index f5312f51de19..013f5510b5f2 100644
> > >>> --- a/drivers/platform/x86/Kconfig
> > >>> +++ b/drivers/platform/x86/Kconfig
> > >>> @@ -366,6 +366,7 @@ config EEEPC_WMI
> > >>>          here.
> > >>>
> > >>>    source "drivers/platform/x86/dell/Kconfig"
> > >>> +source "drivers/platform/x86/hp/Kconfig"
> > >>>
> > >>>    config AMILO_RFKILL
> > >>>        tristate "Fujitsu-Siemens Amilo rfkill support"
> > >>> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/M=
akefile
> > >>> index 5a428caa654a..7f4fdec482a5 100644
> > >>> --- a/drivers/platform/x86/Makefile
> > >>> +++ b/drivers/platform/x86/Makefile
> > >>> @@ -58,6 +58,7 @@ obj-$(CONFIG_GPD_POCKET_FAN)        +=3D gpd-pock=
et-fan.o
> > >>>    obj-$(CONFIG_HP_ACCEL)              +=3D hp_accel.o
> > >>>    obj-$(CONFIG_HP_WMI)                +=3D hp-wmi.o
> > >>>    obj-$(CONFIG_TC1100_WMI)    +=3D tc1100-wmi.o
> > >>> +obj-$(CONFIG_HP_BIOSCFG)        +=3D hp/
> > >>>
> > >>>    # Hewlett Packard Enterprise
> > >>>    obj-$(CONFIG_UV_SYSFS)       +=3D uv_sysfs.o
> > >>> diff --git a/drivers/platform/x86/hp/Kconfig b/drivers/platform/x86=
/hp/Kconfig
> > >>> new file mode 100644
> > >>> index 000000000000..b17b99449ee5
> > >>> --- /dev/null
> > >>> +++ b/drivers/platform/x86/hp/Kconfig
> > >>> @@ -0,0 +1,35 @@
> > >>> +# SPDX-License-Identifier: GPL-2.0-only
> > >>> +#
> > >>> +# HP X86 Platform Specific Drivers
> > >>> +#
> > >>> +
> > >>> +menuconfig X86_PLATFORM_DRIVERS_HP
> > >>> +     bool "HP X86 Platform Specific Device Drivers"
> > >>> +     depends on X86_PLATFORM_DEVICES
> > >>> +     help
> > >>> +       Say Y here to get to see options for device drivers for var=
ious
> > >>> +       HP x86 platforms, including vendor-specific laptop extensio=
n drivers.
> > >>> +       This option alone does not add any kernel code.
> > >>> +
> > >>> +       If you say N, all options in this submenu will be skipped a=
nd disabled.
> > >>> +
> > >>
> > >> Presumably if this is going into it's own directory you should move =
all
> > >> platform-x86 HP drivers to this directory earlier in the series too.

The other drivers named HP-WMI and HP_ACCEL  were written by third
party members and not by HP.   It is for this reason and because of
the number of files, only hp-bioscfg was placed in a separate
directory.   Let me know If my reasoning is not valid enough  and I
will keep the files in a separate directory and move the selection to
the main list.    In addition, Moving  HP-WMI and HP_ACCEL drivers
from x86 directories fall outside of the scope of these changes,
Correct?

> > >>
> > >>> +if X86_PLATFORM_DRIVERS_HP
> > >>> +
> > >>> +config HP_BIOSCFG
> > >>> +     tristate "HP BIOS Configuration Driver"
> > >>> +     default m
> > >>> +     depends on ACPI_WMI
> > >>> +     depends on DMI
> > >>> +     select NLS
> > >>> +     select FW_ATTR_CLASS
> > >>> +     help
> > >>> +       This driver enables administrators to securely manage BIOS =
settings
> > >>> +       using digital certificates and public-key cryptography that=
 eliminate
> > >>> +       the need for passwords for both remote and local management=
. It supports
> > >>> +          changing BIOS settings on many HP machines from 2018 and=
 newer without
> > >>> +       the use of any additional software.
> > >>> +
> > >>> +       To compile this driver as a module, choose M here: the modu=
le will
> > >>> +       be called hp-bioscfg.
> > >>> +
> > >>> +endif # X86_PLATFORM_DRIVERS_HP
> > >>> diff --git a/drivers/platform/x86/hp/Makefile b/drivers/platform/x8=
6/hp/Makefile
> > >>> new file mode 100644
> > >>> index 000000000000..e3790e223084
> > >>> --- /dev/null
> > >>> +++ b/drivers/platform/x86/hp/Makefile
> > >>> @@ -0,0 +1,19 @@
> > >>> +obj-m           :=3D hp-bioscfg.o
> > >>> +
> > >>> +hp-bioscfg-objs :=3D bioscfg.o         \
> > >>> +     enum-attributes.o       \
> > >>> +     int-attributes.o        \
> > >>> +     string-attributes.o     \
> > >>> +     passwdobj-attributes.o  \
> > >>> +     biosattr-interface.o    \
> > >>> +     passwdattr-interface.o  \
> > >>> +     ordered-attributes.o    \
> > >>> +     surestart-attributes.o  \
> > >>> +     spmobj-attributes.o     \
> > >>> +     sureadmin-attributes.o
> > >>> +
> > >>> +default:
> > >>> +     make -C /lib/modules/`uname -r`/build M=3D$(PWD) hp-bioscfg.k=
o
> > >>> +
> > >>> +clean:
> > >>> +     make -C /lib/modules/`uname -r`/build M=3D$(PWD) clean
> > >>> diff --git a/drivers/platform/x86/hp/biosattr-interface.c b/drivers=
/platform/x86/hp/biosattr-interface.c
> > >>> new file mode 100644
> > >>> index 000000000000..c983ef21a9ed
> > >>> --- /dev/null
> > >>> +++ b/drivers/platform/x86/hp/biosattr-interface.c
> > >>> @@ -0,0 +1,286 @@
> > >>> +// SPDX-License-Identifier: GPL-2.0
> > >>> +/*
> > >>> + * Functions corresponding to methods under BIOS interface GUID
> > >>> + * for use with hp-bioscfg driver.
> > >>> + *
> > >>> + *  Copyright (c) 2022 Hewlett-Packard Inc.
> > >>> + */
> > >>> +
> > >>> +#include <linux/wmi.h>
> > >>> +#include "bioscfg.h"
> > >>> +#include <stddef.h>
> > >>> +
> > >>
> > >> I applied this to 6.0 but failed to build:
> > >>
> > >> drivers/platform/x86/hp/biosattr-interface.c:11:10: fatal error:
> > >> stddef.h: No such file or directory
> > >>      11 | #include <stddef.h>
> > >>         |          ^~~~~~~~~~
> > >>
> > >> I was able to fix my local build using this patch:

The build process was tested with the latest  drivers/platform/x86
from branch for-next.
Nonetheless, I will investigate.

> > >>
> > >> --- a/drivers/platform/x86/hp/biosattr-interface.c
> > >> +++ b/drivers/platform/x86/hp/biosattr-interface.c
> > >> @@ -6,9 +6,9 @@
> > >>     *  Copyright (c) 2022 Hewlett-Packard Inc.
> > >>     */
> > >>
> > >> -#include <linux/wmi.h>
> > >>    #include "bioscfg.h"
> > >> -#include <stddef.h>
> > >> +#include <linux/stddef.h>
> > >> +#include <linux/wmi.h>
> > >>
> > >>    #define SET_DEFAULT_VALUES_METHOD_ID   0x02
> > >>    #define SET_BIOS_DEFAULTS_METHOD_ID    0x03
> > >>
> > >>> +#define SET_DEFAULT_VALUES_METHOD_ID 0x02
> > >>> +#define SET_BIOS_DEFAULTS_METHOD_ID  0x03
> > >>> +#define SET_ATTRIBUTE_METHOD_ID              0x04
> > >>> +
> > >>> +/*
> > >>> + * set_attribute() - Update an attribute value
> > >>> + * @a_name: The attribute name
> > >>> + * @a_value: The attribute value
> > >>> + *
> > >>> + * Sets an attribute to new value
> > >>> + */
> > >>> +int hp_set_attribute(const char *a_name, const char *a_value)
> > >>> +{
> > >>> +     size_t security_area_size;
> > >>> +     size_t a_name_size, a_value_size;
> > >>> +     u16 *buffer =3D NULL;
> > >>> +     u16 *start =3D NULL;
> > >>> +     int  buffer_size;
> > >>> +     int ret;
> > >>> +     int instance;
> > >>> +     char *auth_empty_value =3D " ";
> > >>> +
> > >>> +     mutex_lock(&bioscfg_drv.mutex);
> > >>> +     if (!bioscfg_drv.bios_attr_wdev) {
> > >>> +             ret =3D -ENODEV;
> > >>> +             goto out_set_attribute;
> > >>> +     }
> > >>> +
> > >>> +     instance =3D get_password_instance_for_type(SETUP_PASSWD);
> > >>> +     if (instance < 0)
> > >>> +             goto out_set_attribute;
> > >>> +
> > >>> +     if (strlen(bioscfg_drv.password_data[instance].current_passwo=
rd) =3D=3D 0)
> > >>> +             strncpy(bioscfg_drv.password_data[instance].current_p=
assword,
> > >>> +                     auth_empty_value,
> > >>> +                     sizeof(bioscfg_drv.password_data[instance].cu=
rrent_password));
> > >>> +
> > >>> +     a_name_size =3D calculate_string_buffer(a_name);
> > >>> +     a_value_size =3D calculate_string_buffer(a_value);
> > >>> +     security_area_size =3D calculate_security_buffer(bioscfg_drv.=
password_data[instance].current_password);
> > >>> +     buffer_size =3D a_name_size + a_value_size + security_area_si=
ze;
> > >>> +
> > >>> +     buffer =3D kzalloc(buffer_size, GFP_KERNEL);
> > >>> +     if (!buffer) {
> > >>> +             ret =3D -ENOMEM;
> > >>> +             goto out_set_attribute;
> > >>> +     }
> > >>> +
> > >>> +     /* build variables to set */
> > >>> +     start =3D buffer;
> > >>> +     start =3D ascii_to_utf16_unicode(start, a_name);
> > >>> +     if (!start)
> > >>> +             goto out_set_attribute;
> > >>> +
> > >>> +     start =3D ascii_to_utf16_unicode(start, a_value);
> > >>> +     if (!start)
> > >>> +             goto out_set_attribute;
> > >>> +
> > >>> +     populate_security_buffer(start, bioscfg_drv.password_data[ins=
tance].current_password);
> > >>> +     ret =3D hp_wmi_set_bios_setting(buffer, buffer_size);
> > >>> +
> > >>> +
> > >>> +out_set_attribute:
> > >>> +     kfree(buffer);
> > >>> +     mutex_unlock(&bioscfg_drv.mutex);
> > >>> +     return ret;
> > >>> +}
> > >>> +
> > >>> +/*
> > >>> + * hp_wmi_perform_query
> > >>> + *
> > >>> + * query:    The commandtype (enum hp_wmi_commandtype)
> > >>> + * write:    The command (enum hp_wmi_command)
> > >>> + * buffer:   Buffer used as input and/or output
> > >>> + * insize:   Size of input buffer
> > >>> + * outsize:  Size of output buffer
> > >>> + *
> > >>> + * returns zero on success
> > >>> + *         an HP WMI query specific error code (which is positive)
> > >>> + *         -EINVAL if the query was not successful at all
> > >>> + *         -EINVAL if the output buffer size exceeds buffersize
> > >>> + *
> > >>> + * Note: The buffersize must at least be the maximum of the input =
and output
> > >>> + *       size. E.g. Battery info query is defined to have 1 byte i=
nput
> > >>> + *       and 128 byte output. The caller would do:
> > >>> + *       buffer =3D kzalloc(128, GFP_KERNEL);
> > >>> + *       ret =3D hp_wmi_perform_query(HPWMI_BATTERY_QUERY, HPWMI_R=
EAD, buffer, 1, 128)
> > >>> + */
> > >>> +int hp_wmi_perform_query(int query, enum hp_wmi_command command, v=
oid *buffer, int insize, int outsize)
> > >>> +{
> > >>> +     struct acpi_buffer input, output =3D { ACPI_ALLOCATE_BUFFER, =
NULL };
> > >>> +     struct bios_return *bios_return;
> > >>> +     union acpi_object *obj =3D NULL;
> > >>> +     struct bios_args *args =3D NULL;
> > >>> +     int mid, actual_insize, actual_outsize;
> > >>> +     size_t bios_args_size;
> > >>> +     int ret;
> > >>> +
> > >>> +     mid =3D encode_outsize_for_pvsz(outsize);
> > >>> +     if (WARN_ON(mid < 0))
> > >>> +             return mid;
> > >>> +
> > >>> +     actual_insize =3D insize;
> > >>> +     bios_args_size =3D struct_size(args, data, insize);
> > >>> +     args =3D kmalloc(bios_args_size, GFP_KERNEL);
> > >>> +     if (!args)
> > >>> +             return -ENOMEM;
> > >>> +
> > >>> +     input.length =3D bios_args_size;
> > >>> +     input.pointer =3D args;
> > >>> +
> > >>> +     args->signature =3D 0x55434553;
> > >>> +     args->command =3D command;
> > >>> +     args->commandtype =3D query;
> > >>> +     args->datasize =3D insize;
> > >>> +     memcpy(args->data, buffer, flex_array_size(args, data, insize=
));
> > >>> +
> > >>> +     ret =3D wmi_evaluate_method(HP_WMI_BIOS_GUID, 0, mid, &input,=
 &output);
> > >>> +     bioscfg_drv.last_wmi_status =3D ret;
> > >>> +     if (ret)
> > >>> +             goto out_free;
> > >>> +
> > >>> +     obj =3D output.pointer;
> > >>> +     if (!obj) {
> > >>> +             ret =3D -EINVAL;
> > >>> +             goto out_free;
> > >>> +     }
> > >>> +
> > >>> +     bios_return =3D (struct bios_return *)obj->buffer.pointer;
> > >>> +     ret =3D bios_return->return_code;
> > >>> +     bioscfg_drv.last_wmi_status =3D ret;
> > >>> +     if (ret) {
> > >>> +             if (ret !=3D HPWMI_RET_UNKNOWN_COMMAND &&
> > >>> +                 ret !=3D HPWMI_RET_UNKNOWN_CMDTYPE)
> > >>> +                     pr_warn("query 0x%x returned error 0x%x\n", q=
uery, ret);
> > >>> +             goto out_free;
> > >>> +     }
> > >>> +
> > >>> +     /* Ignore output data of zero size */
> > >>> +     if (!outsize)
> > >>> +             goto out_free;
> > >>> +
> > >>> +     actual_outsize =3D min(outsize, (int)(obj->buffer.length - si=
zeof(*bios_return)));
> > >>> +     memcpy(buffer, obj->buffer.pointer + sizeof(*bios_return), ac=
tual_outsize);
> > >>> +     memset(buffer + actual_outsize, 0, outsize - actual_outsize);
> > >>> +
> > >>> +out_free:
> > >>> +     kfree(obj);
> > >>> +     kfree(args);
> > >>> +     return ret;
> > >>> +}
> > >>> +
> > >>> +/*
> > >>> + * ascii_to_utf16_unicode -  Convert ascii string to UTF-16 unicod=
e
> > >>> + *
> > >>> + * @p:   Unicode buffer address
> > >>> + * @str: string to convert to unicode
> > >>> + *
> > >>> + * Returns a void pointer to the buffer containing unicode string
> > >>> + */
> > >>> +void *ascii_to_utf16_unicode(u16 *p, const u8 *str)
> > >>> +{
> > >>> +     int len =3D strlen(str);
> > >>> +     int ret;
> > >>> +
> > >>> +     /*
> > >>> +      * Add null character when reading an empty string
> > >>> +      */
> > >>> +     if (len =3D=3D 0) {
> > >>> +             *p++ =3D 2;
> > >>> +             *p++ =3D (u8)0x00;
> > >>> +             return p;
> > >>> +     }
> > >>> +     *p++ =3D len * 2;
> > >>> +     ret =3D utf8s_to_utf16s(str, strlen(str), UTF16_HOST_ENDIAN, =
p, len);
> > >>> +
> > >>> +     if (ret < 0) {
> > >>> +             dev_err(bioscfg_drv.class_dev, "UTF16 conversion fail=
ed\n");
> > >>> +             goto ascii_to_utf16_unicode_out;
> > >>> +     }
> > >>> +
> > >>> +     if ((ret * sizeof(u16)) > U16_MAX) {
> > >>> +             dev_err(bioscfg_drv.class_dev, "Error string too long=
\n");
> > >>> +             goto ascii_to_utf16_unicode_out;
> > >>> +     }
> > >>> +
> > >>> +ascii_to_utf16_unicode_out:
> > >>> +     p +=3D len;
> > >>> +     return p;
> > >>> +}
> > >>> +
> > >>> +/*
> > >>> + * hp_wmi_set_bios_setting - Set setting's value in BIOS
> > >>> + *
> > >>> + * @input_buffer: Input buffer address
> > >>> + * @input_size:   Input buffer size
> > >>> + *
> > >>> + * Returns: Count of unicode characters written to BIOS if success=
ful, otherwise
> > >>> + *           -ENOMEM unable to allocate memory
> > >>> + *           -EINVAL buffer not allocated or too small
> > >>> + */
> > >>> +int hp_wmi_set_bios_setting(void *input_buffer, int input_size)
> > >>> +{
> > >>> +     union acpi_object *obj;
> > >>> +     struct acpi_buffer input =3D {input_size, input_buffer};
> > >>> +     struct acpi_buffer output =3D {ACPI_ALLOCATE_BUFFER, NULL};
> > >>> +     int ret =3D 0;
> > >>> +
> > >>> +     ret =3D wmi_evaluate_method(HP_WMI_SET_BIOS_SETTING_GUID, 0, =
1, &input, &output);
> > >>> +
> > >>> +     obj =3D output.pointer;
> > >>> +     if (!obj)
> > >>> +             return -EINVAL;
> > >>> +
> > >>> +     if (obj->type !=3D ACPI_TYPE_INTEGER)
> > >>> +             ret =3D -EINVAL;
> > >>> +
> > >>> +     ret =3D obj->integer.value;
> > >>> +
> > >>> +     kfree(obj);
> > >>> +     return ret;
> > >>> +}
> > >>> +
> > >>> +/*
> > >>> + * set_bios_defaults() - Resets BIOS defaults
> > >>> + *
> > >>> + * @deftype: the type of BIOS value reset to issue.
> > >>> + *
> > >>> + * Resets BIOS defaults
> > >>> + */
> > >>> +int set_bios_defaults(u8 deftype)
> > >>> +{
> > >>> +     return -EOPNOTSUPP;
> > >>> +}
> > >>> +
> > >>> +static int bios_attr_set_interface_probe(struct wmi_device *wdev, =
const void *context)
> > >>> +{
> > >>> +     mutex_lock(&bioscfg_drv.mutex);
> > >>> +     bioscfg_drv.bios_attr_wdev =3D wdev;
> > >>> +     mutex_unlock(&bioscfg_drv.mutex);
> > >>> +     return 0;
> > >>> +}
> > >>> +
> > >>> +static void bios_attr_set_interface_remove(struct wmi_device *wdev=
)
> > >>> +{
> > >>> +     mutex_lock(&bioscfg_drv.mutex);
> > >>> +     bioscfg_drv.bios_attr_wdev =3D NULL;
> > >>> +     mutex_unlock(&bioscfg_drv.mutex);
> > >>> +}
> > >>> +
> > >>> +static const struct wmi_device_id bios_attr_set_interface_id_table=
[] =3D {
> > >>> +     { .guid_string =3D HP_WMI_BIOS_GUID},
> > >>> +     { },
> > >>> +};
> > >>> +static struct wmi_driver bios_attr_set_interface_driver =3D {
> > >>> +     .driver =3D {
> > >>> +             .name =3D DRIVER_NAME
> > >>> +     },
> > >>> +     .probe =3D bios_attr_set_interface_probe,
> > >>> +     .remove =3D bios_attr_set_interface_remove,
> > >>> +     .id_table =3D bios_attr_set_interface_id_table,
> > >>> +};
> > >>> +
> > >>> +int init_bios_attr_set_interface(void)
> > >>> +{
> > >>> +     return wmi_driver_register(&bios_attr_set_interface_driver);
> > >>> +}
> > >>> +
> > >>> +void exit_bios_attr_set_interface(void)
> > >>> +{
> > >>> +     wmi_driver_unregister(&bios_attr_set_interface_driver);
> > >>> +}
> > >>> +
> > >>> +MODULE_DEVICE_TABLE(wmi, bios_attr_set_interface_id_table);
> > >>> diff --git a/drivers/platform/x86/hp/bioscfg.c b/drivers/platform/x=
86/hp/bioscfg.c
> > >>> new file mode 100644
> > >>> index 000000000000..f08bcae5752a
> > >>> --- /dev/null
> > >>> +++ b/drivers/platform/x86/hp/bioscfg.c
> > >>> @@ -0,0 +1,1029 @@
> > >>> +// SPDX-License-Identifier: GPL-2.0
> > >>> +/*
> > >>> + * Common methods for use with hp-bioscfg driver
> > >>> + *
> > >>> + *  Copyright (c) 2022 HP Development Company, L.P.
> > >>> + */
> > >>> +
> > >>> +#include <asm-generic/errno-base.h>
> > >>> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> > >>> +
> > >>> +#include <linux/fs.h>
> > >>> +#include <linux/dmi.h>
> > >>> +#include <linux/module.h>
> > >>> +#include <linux/kernel.h>
> > >>> +#include <linux/wmi.h>
> > >>> +#include "bioscfg.h"
> > >>> +#include "../firmware_attributes_class.h"
> > >>> +#include <linux/nls.h>
> > >>> +
> > >>> +MODULE_AUTHOR("Jorge Lopez <jorge.lopez2@hp.com>");
> > >>> +MODULE_DESCRIPTION("HP BIOS Configuration Driver");
> > >>> +MODULE_LICENSE("GPL");
> > >>> +
> > >>> +
> > >>> +#define MAX_TYPES  4
> > >>> +
> > >>> +struct bioscfg_priv bioscfg_drv =3D {
> > >>> +     .mutex =3D __MUTEX_INITIALIZER(bioscfg_drv.mutex),
> > >>> +};
> > >>> +
> > >>> +/* reset bios to defaults */
> > >>> +static const char * const reset_types[] =3D {"builtinsafe", "lastk=
nowngood", "factory", "custom"};
> > >>> +static struct class *fw_attr_class;
> > >>> +
> > >>> +int get_integer_from_buffer(int **buffer, int *integer)
> > >>> +{
> > >>> +     int *ptr =3D PTR_ALIGN(*buffer, 4);
> > >>> +     *integer =3D *(ptr++);
> > >>> +     *buffer =3D ptr;
> > >>> +     return 0;
> > >>> +}
> > >>> +
> > >>> +int get_string_from_buffer(u16 **buffer, char **str)
> > >>> +{
> > >>> +     u16 *ptr =3D *buffer;
> > >>> +     u16 ptrlen;
> > >>> +
> > >>> +     u16 size;
> > >>> +     int i;
> > >>> +     char *output =3D NULL;
> > >>> +     int escape =3D 0;
> > >>> +
> > >>> +     ptrlen =3D *(ptr++);
> > >>> +     size =3D ptrlen / 2;
> > >>> +
> > >>> +     for (i =3D 0; i < size; i++)
> > >>> +             if (ptr[i] =3D=3D '\\' || ptr[i] =3D=3D '\r' || ptr[i=
] =3D=3D '\n' || ptr[i] =3D=3D '\t')
> > >>> +                     escape++;
> > >>> +
> > >>> +     size +=3D escape;
> > >>> +     *str =3D kcalloc(size + 1, sizeof(char), GFP_KERNEL);
> > >>> +     if (!*str)
> > >>> +             return -ENOMEM;
> > >>> +
> > >>> +     output =3D *str;
> > >>> +
> > >>> +     /*
> > >>> +      * convert from UTF-16 unicode to ASCII
> > >>> +      */
> > >>> +     utf16s_to_utf8s(ptr, ptrlen, UTF16_HOST_ENDIAN, output, size)=
;
> > >>> +
> > >>> +     for (i =3D 0; i < size; i++) {
> > >>> +             if (*ptr =3D=3D '\\' || *ptr =3D=3D '\r' || *ptr =3D=
=3D '\n' || *ptr =3D=3D '\t')
> > >>> +                     output[i++] =3D '\\';
> > >>> +
> > >>> +             if (*ptr =3D=3D '\r')
> > >>> +                     output[i] =3D 'r';
> > >>> +             else if (*ptr =3D=3D '\n')
> > >>> +                     output[i] =3D 'n';
> > >>> +             else if (*ptr =3D=3D '\t')
> > >>> +                     output[i] =3D 't';
> > >>> +             else if (*ptr =3D=3D '"')
> > >>> +                     output[i] =3D '\'';
> > >>> +             else
> > >>> +                     output[i] =3D *ptr;
> > >>> +             ptr++;
> > >>> +     }
> > >>> +
> > >>> +     *buffer =3D ptr;
> > >>> +     return 0;
> > >>> +}
> > >>> +
> > >>> +int store_acpi_string_from_buffer(u16 **buffer, char *str_data, in=
t str_data_len)
> > >>> +{
> > >>> +     int ret;
> > >>> +     char *str_read =3D NULL;
> > >>> +
> > >>> +     ret  =3D get_string_from_buffer(buffer, &str_read);
> > >>> +     if (ACPI_SUCCESS(ret))
> > >>> +             strscpy(str_data, str_read, str_data_len);
> > >>> +
> > >>> +     pr_warn("%s\n", str_data);
> > >>> +
> > >>> +     kfree(str_read);
> > >>> +     str_read =3D NULL;
> > >>> +     return ret;
> > >>> +}
> > >>> +
> > >>> +/*
> > >>> + * populate_string_buffer() - populates a string buffer
> > >>> + * @buffer: the start of the destination buffer
> > >>> + * @buffer_len: length of the destination buffer
> > >>> + * @str: the string to insert into buffer
> > >>> + */
> > >>> +ssize_t populate_string_buffer(u16 *buffer, size_t buffer_len, con=
st char *str)
> > >>> +{
> > >>> +     u16 *target =3D buffer;
> > >>> +     int ret;
> > >>> +
> > >>> +     ret =3D utf8s_to_utf16s(str, strlen(str), UTF16_HOST_ENDIAN,
> > >>> +                           target, buffer_len - sizeof(u16));
> > >>> +     if (ret < 0) {
> > >>> +             dev_err(bioscfg_drv.class_dev, "UTF16 conversion fail=
ed\n");
> > >>> +             return ret;
> > >>> +     }
> > >>> +     if ((ret * sizeof(u16)) > U16_MAX) {
> > >>> +             dev_err(bioscfg_drv.class_dev, "Error string too long=
\n");
> > >>> +             return -ERANGE;
> > >>> +     }
> > >>> +     return buffer_len;
> > >>> +}
> > >>> +
> > >>> +/*
> > >>> + * calculate_string_buffer() - determines size of string buffer fo=
r use with BIOS communication
> > >>> + * @str: the string to calculate based upon
> > >>> + */
> > >>> +size_t calculate_string_buffer(const char *str)
> > >>> +{
> > >>> +     /* u16 length field + one UTF16 char for each input char */
> > >>> +     int size =3D  sizeof(u16) + strlen(str) * sizeof(u16);
> > >>> +
> > >>> +     return size;
> > >>> +}
> > >>> +
> > >>> +int wmi_error_and_message(int error_code, char *msg)
> > >>> +{
> > >>> +     char *error_msg =3D NULL;
> > >>> +     int ret =3D -EIO;
> > >>> +
> > >>> +     switch (error_code) {
> > >>> +     case SUCCESS:
> > >>> +             error_msg =3D "Success";
> > >>> +             ret =3D 0;
> > >>> +             break;
> > >>> +     case CMD_FAILED:
> > >>> +             error_msg =3D "Command failed";
> > >>> +             ret =3D -EINVAL;
> > >>> +             break;
> > >>> +     case INVALID_SIGN:
> > >>> +             error_msg =3D "Invalid signature";
> > >>> +             ret =3D -EINVAL;
> > >>> +             break;
> > >>> +     case INVALID_CMD_VALUE:
> > >>> +             error_msg =3D "Invalid command value/Feature not supp=
orted";
> > >>> +             ret =3D -EOPNOTSUPP;
> > >>> +             break;
> > >>> +     case INVALID_CMD_TYPE:
> > >>> +             error_msg =3D "Invalid command type";
> > >>> +             ret =3D -EINVAL;
> > >>> +             break;
> > >>> +     case INVALID_DATA_SIZE:
> > >>> +             error_msg =3D "Invalid data size";
> > >>> +             ret =3D -EINVAL;
> > >>> +             break;
> > >>> +     case INVALID_CMD_PARAM:
> > >>> +             error_msg =3D "Invalid command parameter";
> > >>> +             ret =3D -EINVAL;
> > >>> +             break;
> > >>> +     case ENCRYP_CMD_REQUIRED:
> > >>> +             error_msg =3D "Secure/encrypted command required";
> > >>> +             ret =3D -EACCES;
> > >>> +             break;
> > >>> +     case NO_SECURE_SESSION:
> > >>> +             error_msg =3D "No secure session established";
> > >>> +             ret =3D -EACCES;
> > >>> +             break;
> > >>> +     case SECURE_SESSION_FOUND:
> > >>> +             error_msg =3D "Secure session already established";
> > >>> +             ret =3D -EACCES;
> > >>> +             break;
> > >>> +     case SECURE_SESSION_FAILED:
> > >>> +             error_msg =3D "Secure session failed";
> > >>> +             ret =3D -EIO;
> > >>> +             break;
> > >>> +     case AUTH_FAILED:
> > >>> +             error_msg =3D "Other permission/Authentication failed=
";
> > >>> +             ret =3D -EACCES;
> > >>> +             break;
> > >>> +     case INVALID_BIOS_AUTH:
> > >>> +             error_msg =3D "Invalid BIOS administrator password";
> > >>> +             ret =3D -EINVAL;
> > >>> +             break;
> > >>> +     case NONCE_DID_NOT_MATCH:
> > >>> +             error_msg =3D "Nonce did not match";
> > >>> +             ret =3D -EINVAL;
> > >>> +             break;
> > >>> +     case GENERIC_ERROR:
> > >>> +             error_msg =3D "Generic/Other error";
> > >>> +             ret =3D -EIO;
> > >>> +             break;
> > >>> +     case BIOS_ADMIN_POLICY_NOT_MET:
> > >>> +             error_msg =3D "BIOS Admin password does not meet pass=
word policy requirements";
> > >>> +             ret =3D -EINVAL;
> > >>> +             break;
> > >>> +     case BIOS_ADMIN_NOT_SET:
> > >>> +             error_msg =3D "BIOS Setup password is not set.";
> > >>> +             ret =3D -EPERM;
> > >>> +             break;
> > >>> +     case P21_NO_PROVISIONED:
> > >>> +             error_msg =3D "P21 is not provisioned";
> > >>> +             ret =3D -EPERM;
> > >>> +             break;
> > >>> +     case P21_PROVISION_IN_PROGRESS:
> > >>> +             error_msg =3D "P21 is already provisioned or provisio=
ning is in progress and a signing key has already been sent.";
> > >>> +             ret =3D -EINPROGRESS;
> > >>> +             break;
> > >>> +     case P21_IN_USE:
> > >>> +             error_msg =3D "P21 in use (cannot deprovision)";
> > >>> +             ret =3D -EPERM;
> > >>> +             break;
> > >>
> > >> What exactly is P21?  Can this be a more friendly error?

P21 stands for "Project 21" and part of Hardware Enforced Persistency
security feature.
Project 21 will be more confusing while P21 is a common term used in
HP security products.

> > >>
> > >>> +     case HEP_NOT_ACTIVE:
> > >>> +             error_msg =3D "HEP not activated";
> > >>> +             ret =3D -EPERM;
> > >>> +             break;
> > >>> +     case HEP_ALREADY_SET:
> > >>> +             error_msg =3D "HEP Transport already set";
> > >>> +             ret =3D -EINVAL;
> > >>> +             break;
> > >>> +     case HEP_CHECK_STATE:
> > >>> +             error_msg =3D "Check the current HEP state";
> > >>> +             ret =3D -EINVAL;
> > >>> +             break;
> > >>
> > >> What's HEP?  Can this be a more friendly error?

Displaying the meaning of HEP will make the message less friendly.
HEP stands for 'Hardware Enforced Persistency".

> > >>
> > >>> +     default:
> > >>> +             error_msg =3D "Generic/Other error";
> > >>> +             ret =3D -EIO;
> > >>> +             break;
> > >>> +     }
> > >>> +
> > >>> +     sprintf(msg, "%d,\"%s\"", error_code, error_msg);
> > >>> +     return error_code;
> > >>> +}
> > >>> +
> > >>> +/*
> > >>> + * reset_bios_show() - sysfs implementaton for read reset_bios
> > >>> + * @kobj: Kernel object for this attribute
> > >>> + * @attr: Kernel object attribute
> > >>> + * @buf: The buffer to display to userspace
> > >>> + */
> > >>> +static ssize_t reset_bios_show(struct kobject *kobj,
> > >>> +                            struct kobj_attribute *attr, char *buf=
)
> > >>> +{
> > >>> +     return -EOPNOTSUPP;
> > >>> +}
> > >>> +
> > >>> +/*
> > >>> + * reset_bios_store() - sysfs implementaton for write reset_bios
> > >>> + * @kobj: Kernel object for this attribute
> > >>> + * @attr: Kernel object attribute
> > >>> + * @buf: The buffer from userspace
> > >>> + * @count: the size of the buffer from userspace
> > >>> + */
> > >>> +static ssize_t reset_bios_store(struct kobject *kobj,
> > >>> +                             struct kobj_attribute *attr,
> > >>> +                             const char *buf, size_t count)
> > >>> +{
> > >>> +     return -EOPNOTSUPP;
> > >>> +}
> > >>> +static struct kobj_attribute reset_bios =3D __ATTR_RW(reset_bios);
> > >>> +
> > >>> +/*
> > >>> + * pending_reboot_show() - sysfs implementaton for read pending_re=
boot
> > >>> + * @kobj: Kernel object for this attribute
> > >>> + * @attr: Kernel object attribute
> > >>> + * @buf: The buffer to display to userspace
> > >>> + *
> > >>> + * Stores default value as 0
> > >>> + * When current_value is changed this attribute is set to 1 to not=
ify reboot may be required
> > >>> + */
> > >>> +static ssize_t pending_reboot_show(struct kobject *kobj,
> > >>> +                                struct kobj_attribute *attr,
> > >>> +                                char *buf)
> > >>> +{
> > >>> +     return sprintf(buf, "%d\n", bioscfg_drv.pending_reboot);
> > >>> +}
> > >>> +static struct kobj_attribute pending_reboot =3D __ATTR_RO(pending_=
reboot);
> > >>> +
> > >>> +/*
> > >>> + * last_error_show() - sysfs implementaton for reporting the WMI
> > >>> + * error/success value.
> > >>> + * @kobj: Kernel object for this attribute
> > >>> + * @attr: Kernel object attribute
> > >>> + * @buf: The buffer to display to userspace
> > >>> + */
> > >>> +static ssize_t last_error_show(struct kobject *kobj,
> > >>> +                            struct kobj_attribute *attr,
> > >>> +                                char *buf)
> > >>> +{
> > >>> +     wmi_error_and_message(bioscfg_drv.last_wmi_status, buf);
> > >>> +     return sprintf(buf, "%s\n", buf);
> > >>> +}
> > >>> +static struct kobj_attribute last_error =3D __ATTR_RO(last_error);
> > >>> +
> > >>> +/*
> > >>> + * create_attributes_level_sysfs_files() - Creates reset_bios,
> > >>> + * pending_reboot, and last_error attributes
> > >>> + */
> > >>> +static int create_attributes_level_sysfs_files(void)
> > >>> +{
> > >>> +     int ret;
> > >>> +
> > >>> +     ret =3D sysfs_create_file(&bioscfg_drv.main_dir_kset->kobj, &=
reset_bios.attr);
> > >>> +     if (ret)
> > >>> +             return ret;
> > >>> +
> > >>> +     ret =3D sysfs_create_file(&bioscfg_drv.main_dir_kset->kobj, &=
pending_reboot.attr);
> > >>> +     if (ret)
> > >>> +             return ret;
> > >>> +
> > >>> +     ret =3D sysfs_create_file(&bioscfg_drv.main_dir_kset->kobj, &=
last_error.attr);
> > >>> +     if (ret)
> > >>> +             return ret;
> > >>> +
> > >>> +     bioscfg_drv.last_wmi_status =3D 0;
> > >>> +     return 0;
> > >>> +}
> > >>> +
> > >>> +
> > >>> +static ssize_t bioscfg_attr_show(struct kobject *kobj, struct attr=
ibute *attr,
> > >>> +                                 char *buf)
> > >>> +{
> > >>> +     struct kobj_attribute *kattr;
> > >>> +     ssize_t ret =3D -EIO;
> > >>> +
> > >>> +     kattr =3D container_of(attr, struct kobj_attribute, attr);
> > >>> +     if (kattr->show)
> > >>> +             ret =3D kattr->show(kobj, kattr, buf);
> > >>> +     return ret;
> > >>> +}
> > >>> +
> > >>> +static ssize_t bioscfg_attr_store(struct kobject *kobj, struct att=
ribute *attr,
> > >>> +                                  const char *buf, size_t count)
> > >>> +{
> > >>> +     struct kobj_attribute *kattr;
> > >>> +     ssize_t ret =3D -EIO;
> > >>> +
> > >>> +     kattr =3D container_of(attr, struct kobj_attribute, attr);
> > >>> +     if (kattr->store)
> > >>> +             ret =3D kattr->store(kobj, kattr, buf, count);
> > >>> +     return ret;
> > >>> +}
> > >>> +
> > >>> +static const struct sysfs_ops bioscfg_kobj_sysfs_ops =3D {
> > >>> +     .show   =3D bioscfg_attr_show,
> > >>> +     .store  =3D bioscfg_attr_store,
> > >>> +};
> > >>> +
> > >>> +static void attr_name_release(struct kobject *kobj)
> > >>> +{
> > >>> +     kfree(kobj);
> > >>> +}
> > >>> +
> > >>> +static struct kobj_type attr_name_ktype =3D {
> > >>> +     .release        =3D attr_name_release,
> > >>> +     .sysfs_ops      =3D &bioscfg_kobj_sysfs_ops,
> > >>> +};
> > >>> +
> > >>> +/*
> > >>> + * strlcpy_attr - Copy a length-limited, NULL-terminated string wi=
th bound checks
> > >>> + * @dest: Where to copy the string to
> > >>> + * @src: Where to copy the string from
> > >>> + */
> > >>> +void strlcpy_attr(char *dest, char *src)
> > >>> +{
> > >>> +     size_t len =3D strlen(src) + 1;
> > >>> +
> > >>> +     if (len > 1 && len <=3D MAX_BUFF)
> > >>> +             strscpy(dest, src, len);
> > >>> +
> > >>> +     /*
> > >>> +      * len can be zero because any property not-applicable to att=
ribute can
> > >>> +      * be empty so check only for too long buffers and log error
> > >>> +      */
> > >>> +     if (len > MAX_BUFF)
> > >>> +             pr_err("Source string returned from BIOS is out of bo=
und!\n");
> > >>> +}
> > >>> +
> > >>> +/*
> > >>> + * get_wmiobj_pointer() - Get Content of WMI block for particular =
instance
> > >>> + *
> > >>> + * @instance_id: WMI instance ID
> > >>> + * @guid_string: WMI GUID (in str form)
> > >>> + *
> > >>> + * Fetches the content for WMI block (instance_id) under GUID (gui=
d_string)
> > >>> + * Caller must kfree the return
> > >>> + */
> > >>> +union acpi_object *get_wmiobj_pointer(int instance_id, const char =
*guid_string)
> > >>> +{
> > >>> +     struct acpi_buffer out =3D { ACPI_ALLOCATE_BUFFER, NULL };
> > >>> +     acpi_status status;
> > >>> +
> > >>> +     status =3D wmi_query_block(guid_string, instance_id, &out);
> > >>> +     return ACPI_SUCCESS(status) ? (union acpi_object *)out.pointe=
r : NULL;
> > >>> +}
> > >>> +
> > >>> +/*
> > >>> + * get_instance_count() - Compute total number of instances under =
guid_string
> > >>> + *
> > >>> + * @guid_string: WMI GUID (in string form)
> > >>> + */
> > >>> +int get_instance_count(const char *guid_string)
> > >>> +{
> > >>> +     union acpi_object *wmi_obj =3D NULL;
> > >>> +     int i =3D 0;
> > >>> +
> > >>> +     do {
> > >>> +             kfree(wmi_obj);
> > >>> +             wmi_obj =3D get_wmiobj_pointer(i, guid_string);
> > >>> +             i++;
> > >>> +     } while (wmi_obj);
> > >>> +
> > >>> +     return (i-1);
> > >>> +}
> > >>> +
> > >>> +/*
> > >>> + * alloc_attributes_data() - Allocate attributes data for a partic=
ular type
> > >>> + *
> > >>> + * @attr_type: Attribute type to allocate
> > >>> + */
> > >>> +static int alloc_attributes_data(int attr_type)
> > >>> +{
> > >>> +     int retval =3D 0;
> > >>> +
> > >>> +     switch (attr_type) {
> > >>> +     case HPWMI_STRING_TYPE:
> > >>> +             retval =3D alloc_string_data();
> > >>> +             break;
> > >>> +     case HPWMI_INTEGER_TYPE:
> > >>> +             retval =3D alloc_integer_data();
> > >>> +             break;
> > >>> +     case HPWMI_ENUMERATION_TYPE:
> > >>> +             retval =3D alloc_enumeration_data();
> > >>> +             break;
> > >>> +     case HPWMI_ORDERED_LIST_TYPE:
> > >>> +             retval =3D alloc_ordered_list_data();
> > >>> +             break;
> > >>> +     case HPWMI_PASSWORD_TYPE:
> > >>> +             retval =3D alloc_password_data();
> > >>> +             break;
> > >>> +     default:
> > >>> +             break;
> > >>> +     }
> > >>> +
> > >>> +     return retval;
> > >>> +}
> > >>> +
> > >>> +int convert_hexstr_to_int(char *str, int *int_value)
> > >>> +{
> > >>> +     int ret;
> > >>> +
> > >>> +     ret =3D kstrtou32(str, 10, int_value);
> > >>> +     return ret;
> > >>> +}
> > >>> +
> > >>> +int convert_hexstr_to_str(char **hex, int input_len, char **str, i=
nt *len)
> > >>> +{
> > >>> +     int ret =3D 0;
> > >>> +     int new_len =3D 0;
> > >>> +     char tmp[] =3D "0x00";
> > >>> +     char *input =3D *hex;
> > >>> +     char *new_str =3D NULL;
> > >>> +     long  ch;
> > >>> +     int i;
> > >>> +
> > >>> +     if (input_len <=3D 0 || hex =3D=3D NULL || str =3D=3D NULL ||=
 len =3D=3D NULL)
> > >>> +             return -EINVAL;
> > >>> +
> > >>> +     *len =3D 0;
> > >>> +     *str =3D NULL;
> > >>> +
> > >>> +     new_str =3D kmalloc(input_len, GFP_KERNEL);
> > >>> +     if (!new_str)
> > >>> +             return -ENOMEM;
> > >>> +
> > >>> +     for (i =3D 0; i < input_len; i +=3D 5) {
> > >>> +             strncpy(tmp, input + i, strlen(tmp));
> > >>> +             if (kstrtol(tmp, 16, &ch) =3D=3D 0) {
> > >>> +                     // escape char
> > >>> +                     if (ch =3D=3D '\\' || ch =3D=3D '\r' || ch =
=3D=3D '\n' || ch =3D=3D '\t') {
> > >>> +                             if (ch =3D=3D '\r')
> > >>> +                                     ch =3D 'r';
> > >>> +                             else if (ch =3D=3D '\n')
> > >>> +                                     ch =3D 'n';
> > >>> +                             else if (ch =3D=3D '\t')
> > >>> +                                     ch =3D 't';
> > >>> +                             new_str[new_len++] =3D '\\';
> > >>> +                     }
> > >>> +                     new_str[new_len++] =3D ch;
> > >>> +                     if (ch =3D=3D '\0')
> > >>> +                             break;
> > >>> +             }
> > >>> +     }
> > >>> +
> > >>> +     if (new_len) {
> > >>> +             new_str[new_len] =3D '\0';
> > >>> +             *str =3D krealloc(new_str, (new_len + 1) * sizeof(cha=
r), GFP_KERNEL);
> > >>> +             if (*str)
> > >>> +                     *len =3D new_len;
> > >>> +             else
> > >>> +                     ret =3D -ENOMEM;
> > >>> +     } else {
> > >>> +             ret =3D -EFAULT;
> > >>> +     }
> > >>> +
> > >>> +     if (ret)
> > >>> +             kfree(new_str);
> > >>> +     return ret;
> > >>> +}
> > >>> +
> > >>> +/* map output size to the corresponding WMI method id */
> > >>> +inline int encode_outsize_for_pvsz(int outsize)
> > >>> +{
> > >>> +     if (outsize > 4096)
> > >>> +             return -EINVAL;
> > >>> +     if (outsize > 1024)
> > >>> +             return 5;
> > >>> +     if (outsize > 128)
> > >>> +             return 4;
> > >>> +     if (outsize > 4)
> > >>> +             return 3;
> > >>> +     if (outsize > 0)
> > >>> +             return 2;
> > >>> +     return 1;
> > >>> +}
> > >>> +
> > >>> +/**
> > >>> + * destroy_attribute_objs() - Free a kset of kobjects
> > >>> + * @kset: The kset to destroy
> > >>> + *
> > >>> + * Fress kobjects created for each attribute_name under attribute =
type kset
> > >>> + */
> > >>> +static void destroy_attribute_objs(struct kset *kset)
> > >>> +{
> > >>> +     struct kobject *pos, *next;
> > >>> +
> > >>> +     list_for_each_entry_safe(pos, next, &kset->list, entry)
> > >>> +             kobject_put(pos);
> > >>> +}
> > >>> +
> > >>> +/**
> > >>> + * release_attributes_data() - Clean-up all sysfs directories and =
files created
> > >>> + */
> > >>> +static void release_attributes_data(void)
> > >>> +{
> > >>> +     mutex_lock(&bioscfg_drv.mutex);
> > >>> +
> > >>> +     exit_string_attributes();
> > >>> +     exit_integer_attributes();
> > >>> +     exit_enumeration_attributes();
> > >>> +     exit_ordered_list_attributes();
> > >>> +     exit_password_attributes();
> > >>> +     exit_sure_start_attributes();
> > >>> +     exit_sure_admin_attributes();
> > >>> +     exit_secure_platform_attributes();
> > >>> +
> > >>> +     if (bioscfg_drv.authentication_dir_kset) {
> > >>> +             destroy_attribute_objs(bioscfg_drv.authentication_dir=
_kset);
> > >>> +             kset_unregister(bioscfg_drv.authentication_dir_kset);
> > >>> +             bioscfg_drv.authentication_dir_kset =3D NULL;
> > >>> +     }
> > >>> +     if (bioscfg_drv.main_dir_kset) {
> > >>> +             sysfs_remove_file(&bioscfg_drv.main_dir_kset->kobj, &=
reset_bios.attr);
> > >>> +             sysfs_remove_file(&bioscfg_drv.main_dir_kset->kobj, &=
pending_reboot.attr);
> > >>> +             sysfs_remove_file(&bioscfg_drv.main_dir_kset->kobj, &=
last_error.attr);
> > >>> +             destroy_attribute_objs(bioscfg_drv.main_dir_kset);
> > >>> +             kset_unregister(bioscfg_drv.main_dir_kset);
> > >>> +             bioscfg_drv.main_dir_kset =3D NULL;
> > >>> +     }
> > >>> +     mutex_unlock(&bioscfg_drv.mutex);
> > >>> +}
> > >>> +
> > >>> +
> > >>> +/*
> > >>> + * hp_add_other_attributes - Initialize HP custom attributes not r=
eported by
> > >>> + * BIOS and required to support Secure Platform, Sure Start, and S=
ure
> > >>> + * Admin.
> > >>> + * @attr_type: Custom HP attribute not reported by BIOS
> > >>> + *
> > >>> + * Initialiaze all 3 types of attributes: Platform, Sure Start, an=
d Sure
> > >>> + * Admin object.  Populates each attrbute types respective propert=
ies
> > >>> + * under sysfs files.
> > >>> + *
> > >>> + * Returns zero(0) if successful.  Otherwise, a negative value.
> > >>> + */
> > >>> +static int hp_add_other_attributes(int attr_type)
> > >>> +{
> > >>> +     struct kobject *attr_name_kobj;
> > >>> +     union acpi_object *obj =3D NULL;
> > >>> +     int retval =3D 0;
> > >>> +     u8 *attr_name;
> > >>> +
> > >>> +     mutex_lock(&bioscfg_drv.mutex);
> > >>> +
> > >>> +     attr_name_kobj =3D kzalloc(sizeof(*attr_name_kobj), GFP_KERNE=
L);
> > >>> +     if (!attr_name_kobj) {
> > >>> +             retval =3D -ENOMEM;
> > >>> +             goto err_other_attr_init;
> > >>> +     }
> > >>> +
> > >>> +     /* Check if attribute type is supported */
> > >>> +     switch (attr_type) {
> > >>> +     case HPWMI_SECURE_PLATFORM_TYPE:
> > >>> +             attr_name_kobj->kset =3D bioscfg_drv.authentication_d=
ir_kset;
> > >>> +             attr_name =3D SPM_STR;
> > >>> +             break;
> > >>> +
> > >>> +     case HPWMI_SURE_START_TYPE:
> > >>> +             attr_name_kobj->kset =3D bioscfg_drv.main_dir_kset;
> > >>> +             attr_name =3D SURE_START_STR;
> > >>> +             break;
> > >>> +
> > >>> +     case HPWMI_SURE_ADMIN_TYPE:
> > >>> +             attr_name_kobj->kset =3D bioscfg_drv.main_dir_kset;
> > >>> +             attr_name =3D SURE_ADMIN_STR;
> > >>> +             break;
> > >>> +     default:
> > >>> +             pr_err("Error: Unknown attr_type: %d\n", attr_type);
> > >>> +             retval =3D -EINVAL;
> > >>> +             goto err_other_attr_init;
> > >>> +     }
> > >>> +
> > >>> +     retval =3D kobject_init_and_add(attr_name_kobj, &attr_name_kt=
ype,
> > >>> +                                   NULL, "%s", attr_name);
> > >>> +     if (retval) {
> > >>> +             pr_err("Error encountered [%d]\n", retval);
> > >>> +             kobject_put(attr_name_kobj);
> > >>> +             goto err_other_attr_init;
> > >>> +     }
> > >>> +
> > >>> +     /* Populate attribute data */
> > >>> +     switch (attr_type) {
> > >>> +     case HPWMI_SECURE_PLATFORM_TYPE:
> > >>> +             retval =3D populate_secure_platform_data(attr_name_ko=
bj);
> > >>> +             break;
> > >>> +
> > >>> +     case HPWMI_SURE_START_TYPE:
> > >>> +             retval =3D populate_sure_start_data(attr_name_kobj);
> > >>> +             break;
> > >>> +
> > >>> +     case HPWMI_SURE_ADMIN_TYPE:
> > >>> +             retval =3D populate_sure_admin_data(attr_name_kobj);
> > >>> +             break;
> > >>> +
> > >>> +     default:
> > >>> +             goto err_other_attr_init;
> > >>> +     }
> > >>> +
> > >>> +     mutex_unlock(&bioscfg_drv.mutex);
> > >>> +     return 0;
> > >>> +
> > >>> +err_other_attr_init:
> > >>> +     mutex_unlock(&bioscfg_drv.mutex);
> > >>> +     kfree(obj);
> > >>> +     return retval;
> > >>> +}
> > >>> +
> > >>> +/*
> > >>> + * hp_init_bios_attributes - Initialize all attributes for a type
> > >>> + * @attr_type: The attribute type to initialize
> > >>> + * @guid: The WMI GUID associated with this type to initialize
> > >>> + *
> > >>> + * Initialiaze all 5 types of attributes: enumeration, integer,
> > >>> + * string, password, ordered list  object.  Populates each attrbut=
e types
> > >>> + * respective properties under sysfs files
> > >>> + */
> > >>> +static int hp_init_bios_attributes(int attr_type, const char *guid=
)
> > >>> +{
> > >>> +     struct kobject *attr_name_kobj;
> > >>> +     union acpi_object *obj =3D NULL;
> > >>> +     union acpi_object *elements;
> > >>> +     struct kset *tmp_set;
> > >>> +     int min_elements;
> > >>> +     char *str =3D NULL;
> > >>> +     char *temp_str =3D NULL;
> > >>> +     char *str_value =3D NULL;
> > >>> +     int str_len;
> > >>> +     int ret =3D 0;
> > >>> +
> > >>> +     /* instance_id needs to be reset for each type GUID
> > >>> +      * also, instance IDs are unique within GUID but not across
> > >>> +      */
> > >>> +     int instance_id =3D 0;
> > >>> +     int retval =3D 0;
> > >>> +
> > >>> +     retval =3D alloc_attributes_data(attr_type);
> > >>> +     if (retval)
> > >>> +             return retval;
> > >>> +
> > >>> +     switch (attr_type) {
> > >>> +     case HPWMI_STRING_TYPE:
> > >>> +             min_elements =3D 12;
> > >>> +             break;
> > >>> +     case HPWMI_INTEGER_TYPE:
> > >>> +             min_elements =3D 13;
> > >>> +             break;
> > >>> +     case HPWMI_ENUMERATION_TYPE:
> > >>> +             min_elements =3D 13;
> > >>> +             break;
> > >>> +     case HPWMI_ORDERED_LIST_TYPE:
> > >>> +             min_elements =3D 12;
> > >>> +             break;
> > >>> +     case HPWMI_PASSWORD_TYPE:
> > >>> +             min_elements =3D 15;
> > >>> +             break;
> > >>> +     default:
> > >>> +             pr_err("Error: Unknown attr_type: %d\n", attr_type);
> > >>> +             return -EINVAL;
> > >>> +     }
> > >>> +
> > >>> +     /* need to use specific instance_id and guid combination to g=
et right data */
> > >>> +     obj =3D get_wmiobj_pointer(instance_id, guid);
> > >>> +
> > >>> +     if (!obj)
> > >>> +             return -ENODEV;
> > >>> +
> > >>> +     mutex_lock(&bioscfg_drv.mutex);
> > >>> +     while (obj) {
> > >>> +             if (obj->type !=3D ACPI_TYPE_PACKAGE && obj->type !=
=3D ACPI_TYPE_BUFFER) {
> > >>> +                     pr_err("Error: Expected ACPI-package or buffe=
r type, got: %d\n", obj->type);
> > >>> +                     retval =3D -EIO;
> > >>> +                     goto err_attr_init;
> > >>> +             }
> > >>> +
> > >>> +             /* Take action appropriate to each ACPI TYPE */
> > >>> +             if (obj->type =3D=3D ACPI_TYPE_PACKAGE) {
> > >>> +                     if (obj->package.count < min_elements) {
> > >>> +                             pr_err("Error: ACPI-package does not =
have enough elements: %d < %d\n",
> > >>> +                                    obj->package.count, min_elemen=
ts);
> > >>> +                             goto nextobj;
> > >>> +                     }
> > >>> +
> > >>> +                     elements =3D obj->package.elements;
> > >>> +                     /* sanity checking */
> > >>> +                     if (elements[NAME].type !=3D ACPI_TYPE_STRING=
) {
> > >>> +                             pr_debug("incorrect element type\n");
> > >>> +                             goto nextobj;
> > >>> +                     }
> > >>> +                     if (strlen(elements[NAME].string.pointer) =3D=
=3D 0) {
> > >>> +                             pr_debug("empty attribute found\n");
> > >>> +                             goto nextobj;
> > >>> +                     }
> > >>> +                     if (attr_type =3D=3D HPWMI_PASSWORD_TYPE)
> > >>> +                             tmp_set =3D bioscfg_drv.authenticatio=
n_dir_kset;
> > >>> +                     else
> > >>> +                             tmp_set =3D bioscfg_drv.main_dir_kset=
;
> > >>> +
> > >>> +                     /* convert attribute name to string */
> > >>> +                     retval =3D convert_hexstr_to_str(&(elements[N=
AME].string.pointer),
> > >>> +                                                    elements[NAME]=
.string.length,
> > >>> +                                                    &str_value, &s=
tr_len);
> > >>> +
> > >>> +                     if (ACPI_FAILURE(retval)) {
> > >>> +                             pr_warn("Failed to populate integer p=
ackage data. Error [0%0x]\n", ret);
> > >>> +                             kfree(str_value);
> > >>> +                             return ret;
> > >>> +                     }
> > >>> +
> > >>> +                     if (kset_find_obj(tmp_set, str_value)) {
> > >>> +                             pr_debug("Duplicate attribute name fo=
und - %s\n",
> > >>> +                                      str_value);
> > >>> +                             goto nextobj;
> > >>> +                     }
> > >>> +
> > >>> +                     /* build attribute */
> > >>> +                     attr_name_kobj =3D kzalloc(sizeof(*attr_name_=
kobj), GFP_KERNEL);
> > >>> +                     if (!attr_name_kobj) {
> > >>> +                             retval =3D -ENOMEM;
> > >>> +                             goto err_attr_init;
> > >>> +                     }
> > >>> +
> > >>> +                     attr_name_kobj->kset =3D tmp_set;
> > >>> +
> > >>> +                     retval =3D kobject_init_and_add(attr_name_kob=
j, &attr_name_ktype,
> > >>> +                                                   NULL, "%s", str=
_value);
> > >>> +                     if (retval) {
> > >>> +                             kobject_put(attr_name_kobj);
> > >>> +                             goto err_attr_init;
> > >>> +                     }
> > >>> +
> > >>> +                     /* enumerate all of these attributes */
> > >>> +                     switch (attr_type) {
> > >>> +                     case HPWMI_STRING_TYPE:
> > >>> +                             retval =3D populate_string_package_da=
ta(elements,
> > >>> +                                                                  =
 instance_id,
> > >>> +                                                                  =
 attr_name_kobj);
> > >>> +                             break;
> > >>> +                     case HPWMI_INTEGER_TYPE:
> > >>> +                             retval =3D populate_integer_package_d=
ata(elements,
> > >>> +                                                                  =
  instance_id,
> > >>> +                                                                  =
  attr_name_kobj);
> > >>> +                             break;
> > >>> +                     case HPWMI_ENUMERATION_TYPE:
> > >>> +                             retval =3D populate_enumeration_packa=
ge_data(elements,
> > >>> +                                                                  =
      instance_id,
> > >>> +                                                                  =
      attr_name_kobj);
> > >>> +                             break;
> > >>> +                     case HPWMI_ORDERED_LIST_TYPE:
> > >>> +                             retval =3D populate_ordered_list_pack=
age_data(elements,
> > >>> +                                                                  =
       instance_id,
> > >>> +                                                                  =
       attr_name_kobj);
> > >>> +                             break;
> > >>> +                     case HPWMI_PASSWORD_TYPE:
> > >>> +                             retval =3D populate_password_package_=
data(elements,
> > >>> +                                                                  =
   instance_id,
> > >>> +                                                                  =
   attr_name_kobj);
> > >>> +                             break;
> > >>> +                     default:
> > >>> +                             break;
> > >>> +                     }
> > >>> +
> > >>> +                     kfree(str_value);
> > >>> +                     str_value =3D NULL;
> > >>> +             }
> > >>> +
> > >>> +             if (obj->type =3D=3D ACPI_TYPE_BUFFER) {
> > >>> +                     retval =3D get_string_from_buffer((u16 **)&ob=
j->buffer.pointer, &str);
> > >>> +
> > >>> +                     if (attr_type =3D=3D HPWMI_PASSWORD_TYPE || a=
ttr_type =3D=3D HPWMI_SECURE_PLATFORM_TYPE)
> > >>> +                             tmp_set =3D bioscfg_drv.authenticatio=
n_dir_kset;
> > >>> +                     else
> > >>> +                             tmp_set =3D bioscfg_drv.main_dir_kset=
;
> > >>> +
> > >>> +                     if (kset_find_obj(tmp_set, str)) {
> > >>> +                             pr_warn("Duplicate attribute name fou=
nd - %s\n",
> > >>> +                                      str);
> > >>> +                             goto nextobj;
> > >>> +                     }
> > >>> +
> > >>> +                     /* build attribute */
> > >>> +                     attr_name_kobj =3D kzalloc(sizeof(*attr_name_=
kobj), GFP_KERNEL);
> > >>> +                     if (!attr_name_kobj) {
> > >>> +                             retval =3D -ENOMEM;
> > >>> +                             goto err_attr_init;
> > >>> +                     }
> > >>> +
> > >>> +                     attr_name_kobj->kset =3D tmp_set;
> > >>> +
> > >>> +                     temp_str =3D str;
> > >>> +                     if (attr_type =3D=3D HPWMI_SECURE_PLATFORM_TY=
PE)
> > >>> +                             temp_str =3D "SPM";
> > >>> +
> > >>> +                     retval =3D kobject_init_and_add(attr_name_kob=
j,
> > >>> +                                                   &attr_name_ktyp=
e, NULL, "%s",
> > >>> +                                                   temp_str);
> > >>> +                     if (retval) {
> > >>> +                             kobject_put(attr_name_kobj);
> > >>> +                             goto err_attr_init;
> > >>> +                     }
> > >>> +
> > >>> +                     /* enumerate all of these attributes */
> > >>> +                     switch (attr_type) {
> > >>> +                     case HPWMI_STRING_TYPE:
> > >>> +                             retval =3D populate_string_buffer_dat=
a(obj, instance_id, attr_name_kobj);
> > >>> +                             break;
> > >>> +                     case HPWMI_INTEGER_TYPE:
> > >>> +                             retval =3D populate_integer_buffer_da=
ta(obj, instance_id, attr_name_kobj);
> > >>> +                             break;
> > >>> +                     case HPWMI_ENUMERATION_TYPE:
> > >>> +                             retval =3D populate_enumeration_buffe=
r_data(obj, instance_id, attr_name_kobj);
> > >>> +                             break;
> > >>> +                     case HPWMI_ORDERED_LIST_TYPE:
> > >>> +                             retval =3D populate_ordered_list_buff=
er_data(obj, instance_id, attr_name_kobj);
> > >>> +                             break;
> > >>> +                     case HPWMI_PASSWORD_TYPE:
> > >>> +                             retval =3D populate_password_buffer_d=
ata(obj, instance_id, attr_name_kobj);
> > >>> +                             break;
> > >>> +                     default:
> > >>> +                             break;
> > >>> +                     }
> > >>> +             }
> > >>> +
> > >>> +nextobj:
> > >>> +             kfree(obj);
> > >>> +             instance_id++;
> > >>> +             obj =3D get_wmiobj_pointer(instance_id, guid);
> > >>> +     }
> > >>> +     mutex_unlock(&bioscfg_drv.mutex);
> > >>> +     return 0;
> > >>> +
> > >>> +err_attr_init:
> > >>> +     mutex_unlock(&bioscfg_drv.mutex);
> > >>> +     kfree(obj);
> > >>> +     return retval;
> > >>> +}
> > >>> +
> > >>> +static int __init bioscfg_init(void)
> > >>> +{
> > >>> +     int ret =3D 0;
> > >>> +     int bios_capable =3D wmi_has_guid(HP_WMI_BIOS_GUID);
> > >>> +
> > >>> +     if (!bios_capable) {
> > >>> +             pr_err("Unable to run on non-HP system\n");
> > >>> +             return -ENODEV;
> > >>> +     }
> > >>> +
> > >>> +     ret =3D init_bios_attr_set_interface();
> > >>> +     if (ret)
> > >>> +             return ret;
> > >>> +
> > >>> +     ret =3D init_bios_attr_pass_interface();
> > >>> +     if (ret)
> > >>> +             goto err_exit_bios_attr_set_interface;
> > >>> +
> > >>> +     if (!bioscfg_drv.bios_attr_wdev || !bioscfg_drv.password_attr=
_wdev) {
> > >>> +             pr_debug("Failed to find set or pass interface\n");
> > >>> +             ret =3D -ENODEV;
> > >>> +             goto err_exit_bios_attr_pass_interface;
> > >>> +     }
> > >>> +
> > >>> +     ret =3D fw_attributes_class_get(&fw_attr_class);
> > >>> +     if (ret)
> > >>> +             goto err_exit_bios_attr_pass_interface;
> > >>> +
> > >>> +     bioscfg_drv.class_dev =3D device_create(fw_attr_class, NULL, =
MKDEV(0, 0),
> > >>> +                                           NULL, "%s", DRIVER_NAME=
);
> > >>> +     if (IS_ERR(bioscfg_drv.class_dev)) {
> > >>> +             ret =3D PTR_ERR(bioscfg_drv.class_dev);
> > >>> +             goto err_unregister_class;
> > >>> +     }
> > >>> +
> > >>> +     bioscfg_drv.main_dir_kset =3D kset_create_and_add("attributes=
", NULL,
> > >>> +                                                  &bioscfg_drv.cla=
ss_dev->kobj);
> > >>> +     if (!bioscfg_drv.main_dir_kset) {
> > >>> +             ret =3D -ENOMEM;
> > >>> +             pr_debug("Failed to create and add attributes\n");
> > >>> +             goto err_destroy_classdev;
> > >>> +     }
> > >>> +
> > >>> +     bioscfg_drv.authentication_dir_kset =3D kset_create_and_add("=
authentication", NULL,
> > >>> +                                                             &bios=
cfg_drv.class_dev->kobj);
> > >>> +     if (!bioscfg_drv.authentication_dir_kset) {
> > >>> +             ret =3D -ENOMEM;
> > >>> +             pr_debug("Failed to create and add authentication\n")=
;
> > >>> +             goto err_release_attributes_data;
> > >>> +     }
> > >>> +
> > >>> +     /*
> > >>> +      * sysfs level attributes.
> > >>> +      * - reset_bios
> > >>> +      * - pending_reboot
> > >>> +      * - last_error (WMI error)
> > >>> +      */
> > >>> +     ret =3D create_attributes_level_sysfs_files();
> > >>> +     if (ret)
> > >>> +             pr_debug("Failed to create sysfs level attributes\n")=
;
> > >>> +
> > >>> +     ret =3D hp_init_bios_attributes(HPWMI_STRING_TYPE, HP_WMI_BIO=
S_STRING_GUID);
> > >>> +     if (ret)
> > >>> +             pr_debug("Failed to populate string type attributes\n=
");
> > >>> +
> > >>> +     ret =3D hp_init_bios_attributes(HPWMI_INTEGER_TYPE, HP_WMI_BI=
OS_INTEGER_GUID);
> > >>> +     if (ret)
> > >>> +             pr_debug("Failed to populate integer type attributes\=
n");
> > >>> +
> > >>> +     ret =3D hp_init_bios_attributes(HPWMI_ENUMERATION_TYPE, HP_WM=
I_BIOS_ENUMERATION_GUID);
> > >>> +     if (ret)
> > >>> +             pr_debug("Failed to populate enumeration type attribu=
tes\n");
> > >>> +
> > >>> +     ret =3D hp_init_bios_attributes(HPWMI_ORDERED_LIST_TYPE, HP_W=
MI_BIOS_ORDERED_LIST_GUID);
> > >>> +     if (ret)
> > >>> +             pr_debug("Failed to populate ordered list object type=
 attributes\n");
> > >>> +
> > >>> +     ret =3D hp_init_bios_attributes(HPWMI_PASSWORD_TYPE, HP_WMI_B=
IOS_PASSWORD_GUID);
> > >>> +     if (ret)
> > >>> +             pr_debug("Failed to populate password object type att=
ributes\n");
> > >>> +
> > >>> +     ret =3D hp_add_other_attributes(HPWMI_SECURE_PLATFORM_TYPE);
> > >>> +     if (ret)
> > >>> +             pr_debug("Failed to populate secure platform object t=
ype attribute\n");
> > >>> +
> > >>> +     ret =3D hp_add_other_attributes(HPWMI_SURE_START_TYPE);
> > >>> +     if (ret)
> > >>> +             pr_debug("Failed to populate sure start object type a=
ttribute\n");
> > >>> +
> > >>> +     ret =3D hp_add_other_attributes(HPWMI_SURE_ADMIN_TYPE);
> > >>> +     if (ret)
> > >>> +             pr_debug("Failed to populate sure admin object type a=
ttribute\n");
> > >>> +
> > >>> +     return 0;
> > >>> +
> > >>> +err_release_attributes_data:
> > >>> +     release_attributes_data();
> > >>> +
> > >>> +err_destroy_classdev:
> > >>> +     device_destroy(fw_attr_class, MKDEV(0, 0));
> > >>> +
> > >>> +err_unregister_class:
> > >>> +     fw_attributes_class_put();
> > >>> +
> > >>> +err_exit_bios_attr_pass_interface:
> > >>> +     exit_bios_attr_pass_interface();
> > >>> +
> > >>> +err_exit_bios_attr_set_interface:
> > >>> +     exit_bios_attr_set_interface();
> > >>> +
> > >>> +     return ret;
> > >>> +}
> > >>> +
> > >>> +static void __exit bioscfg_exit(void)
> > >>> +{
> > >>> +     release_attributes_data();
> > >>> +     device_destroy(fw_attr_class, MKDEV(0, 0));
> > >>> +
> > >>> +     fw_attributes_class_put();
> > >>> +     exit_bios_attr_set_interface();
> > >>> +     exit_bios_attr_pass_interface();
> > >>> +}
> > >>> +
> > >>> +module_init(bioscfg_init);
> > >>> +module_exit(bioscfg_exit);
> > >>> diff --git a/drivers/platform/x86/hp/bioscfg.h b/drivers/platform/x=
86/hp/bioscfg.h
> > >>> new file mode 100644
> > >>> index 000000000000..ac02c8c1e5f2
> > >>> --- /dev/null
> > >>> +++ b/drivers/platform/x86/hp/bioscfg.h
> > >>> @@ -0,0 +1,667 @@
> > >>> +/* SPDX-License-Identifier: GPL-2.0
> > >>> + *
> > >>> + * Definitions for kernel modules using hp_bioscfg driver
> > >>> + *
> > >>> + *  Copyright (c) 2022 HP Development Company, L.P.
> > >>> + */
> > >>> +
> > >>> +#ifndef _HP_BIOSCFG_H_
> > >>> +#define _HP_BIOSCFG_H_
> > >>> +
> > >>> +#include <linux/wmi.h>
> > >>> +#include <linux/types.h>
> > >>> +#include <linux/device.h>
> > >>> +#include <linux/module.h>
> > >>> +#include <linux/kernel.h>
> > >>> +#include <linux/capability.h>
> > >>> +#include <linux/nls.h>
> > >>> +
> > >>> +
> > >>> +#define DRIVER_NAME  "hp-bioscfg"
> > >>> +
> > >>> +#define MAX_BUFF             512
> > >>> +#define MAX_KEY_MOD          256
> > >>> +#define MAX_PASSWD_SIZE              64
> > >>> +#define MAX_MESSAGE_SIZE        256
> > >>> +
> > >>> +#define SPM_STR_DESC "Secure Platform Management"
> > >>> +#define SPM_STR              "SPM"
> > >>> +#define SURE_START_DESC "Sure Start"
> > >>> +#define SURE_START_STR  "Sure_Start"
> > >>> +#define SURE_ADMIN_DESC "Sure Admin"
> > >>> +#define SURE_ADMIN_STR  "Sure_Admin"
> > >>> +#define SETUP_PASSWD "Setup Password"
> > >>> +#define POWER_ON_PASSWD      "Power-On Password"
> > >>> +
> > >>> +#define LANG_CODE_STR        "en_US.UTF-8"
> > >>> +
> > >>> +/* Sure Admin Functions */
> > >>> +
> > >>> +#define UTF_PREFIX   ((unsigned char *)"<utf-16/>")
> > >>> +#define BEAM_PREFIX  ((unsigned char *)"<BEAM/>")
> > >>> +
> > >>> +/* mechanism - Authentication attribute */
> > >>> +
> > >>> +#define MAX_MECHANISM_TYPES 3
> > >>> +
> > >>> +enum mechanism_values {
> > >>> +     PASSWORD        =3D 0x00,
> > >>> +     NOT_PROVISION   =3D 0x00,
> > >>> +     SIGNING_KEY     =3D 0x01,
> > >>> +     ENDORSEMENT_KEY =3D 0x02
> > >>> +};
> > >>> +
> > >>> +static const char * const spm_mechanism_types[] =3D {
> > >>> +     "not provision",
> > >>> +     "signing-key",
> > >>> +     "endorsement-key"
> > >>> +};
> > >>> +
> > >>> +static const char * const passwd_mechanism_types[] =3D {
> > >>> +     "password",
> > >>> +};
> > >>> +
> > >>> +/* roles - Authentication attribute */
> > >>> +enum role_values {
> > >>> +     BIOS_ADMIN      =3D 0x00,
> > >>> +     POWER_ON        =3D 0x01,
> > >>> +     BIOS_SPM        =3D 0x02
> > >>> +};
> > >>> +
> > >>> +static const char * const role_type[] =3D {
> > >>> +     "bios-admin",
> > >>> +     "power-on",
> > >>> +     "enhanced-bios-auth"
> > >>> +};
> > >>> +
> > >>> +
> > >>> +#define HP_WMI_BIOS_GUID             "5FB7F034-2C63-45e9-BE91-3D44=
E2C707E4"
> > >>> +
> > >>> +#define HP_WMI_BIOS_STRING_GUID              "988D08E3-68F4-4c35-A=
F3E-6A1B8106F83C"
> > >>> +#define HP_WMI_BIOS_INTEGER_GUID     "8232DE3D-663D-4327-A8F4-E293=
ADB9BF05"
> > >>> +#define HP_WMI_BIOS_ENUMERATION_GUID "2D114B49-2DFB-4130-B8FE-4A3C=
09E75133"
> > >>> +#define HP_WMI_BIOS_ORDERED_LIST_GUID        "14EA9746-CE1F-4098-A=
0E0-7045CB4DA745"
> > >>> +#define HP_WMI_BIOS_PASSWORD_GUID    "322F2028-0F84-4901-988E-0151=
76049E2D"
> > >>> +#define HP_WMI_SET_BIOS_SETTING_GUID "1F4C91EB-DC5C-460b-951D-C7CB=
9B4B8D5E"
> > >>> +
> > >>> +enum hp_wmi_spm_commandtype {
> > >>> +     HPWMI_SECUREPLATFORM_GET_STATE  =3D 0x10,
> > >>> +     HPWMI_SECUREPLATFORM_SET_KEK    =3D 0x11,
> > >>> +     HPWMI_SECUREPLATFORM_SET_SK     =3D 0x12,
> > >>> +};
> > >>> +
> > >>> +enum hp_wmi_surestart_commandtype {
> > >>> +     HPWMI_SURESTART_GET_LOG_COUNT   =3D 0x01,
> > >>> +     HPWMI_SURESTART_GET_LOG         =3D 0x02,
> > >>> +};
> > >>> +
> > >>> +enum hp_wmi_command {
> > >>> +     HPWMI_READ              =3D 0x01,
> > >>> +     HPWMI_WRITE             =3D 0x02,
> > >>> +     HPWMI_ODM               =3D 0x03,
> > >>> +     HPWMI_SURESTART         =3D 0x20006,
> > >>> +     HPWMI_GM                =3D 0x20008,
> > >>> +     HPWMI_SECUREPLATFORM    =3D 0x20010,
> > >>> +};
> > >>> +
> > >>> +struct bios_return {
> > >>> +     u32 sigpass;
> > >>> +     u32 return_code;
> > >>> +};
> > >>> +
> > >>> +enum hp_return_value {
> > >>> +     HPWMI_RET_WRONG_SIGNATURE       =3D 0x02,
> > >>> +     HPWMI_RET_UNKNOWN_COMMAND       =3D 0x03,
> > >>> +     HPWMI_RET_UNKNOWN_CMDTYPE       =3D 0x04,
> > >>> +     HPWMI_RET_INVALID_PARAMETERS    =3D 0x05,
> > >>> +};
> > >>> +
> > >>> +enum wmi_error_values {
> > >>> +     SUCCESS                 =3D 0x00,
> > >>> +     CMD_FAILED                      =3D 0x01,
> > >>> +     INVALID_SIGN                    =3D 0x02,
> > >>> +     INVALID_CMD_VALUE               =3D 0x03,
> > >>> +     INVALID_CMD_TYPE                =3D 0x04,
> > >>> +     INVALID_DATA_SIZE               =3D 0x05,
> > >>> +     INVALID_CMD_PARAM               =3D 0x06,
> > >>> +     ENCRYP_CMD_REQUIRED             =3D 0x07,
> > >>> +     NO_SECURE_SESSION               =3D 0x08,
> > >>> +     SECURE_SESSION_FOUND            =3D 0x09,
> > >>> +     SECURE_SESSION_FAILED           =3D 0x0A,
> > >>> +     AUTH_FAILED                     =3D 0x0B,
> > >>> +     INVALID_BIOS_AUTH               =3D 0x0E,
> > >>> +     NONCE_DID_NOT_MATCH             =3D 0x18,
> > >>> +     GENERIC_ERROR                   =3D 0x1C,
> > >>> +     BIOS_ADMIN_POLICY_NOT_MET       =3D 0x28,
> > >>> +     BIOS_ADMIN_NOT_SET              =3D 0x38,
> > >>> +     P21_NO_PROVISIONED              =3D 0x1000,
> > >>> +     P21_PROVISION_IN_PROGRESS       =3D 0x1001,
> > >>> +     P21_IN_USE                      =3D 0x1002,
> > >>> +     HEP_NOT_ACTIVE                  =3D 0x1004,
> > >>> +     HEP_ALREADY_SET         =3D 0x1006,
> > >>> +     HEP_CHECK_STATE         =3D 0x1007
> > >>> +};
> > >>> +
> > >>> +enum spm_features {
> > >>> +     HEP_ENABLED             =3D 0x01,
> > >>> +     PLATFORM_RECOVERY       =3D 0x02,
> > >>> +     ENHANCED_BIOS_AUTH_MODE =3D 0x04
> > >>> +};
> > >>> +
> > >>> +
> > >>> +/*
> > >>> + * struct bios_args buffer is dynamically allocated.  New WMI comm=
and types
> > >>> + * were introduced that exceeds 128-byte data size.  Changes to ha=
ndle
> > >>> + * the data size allocation scheme were kept in hp_wmi_perform_qur=
ey function.
> > >>> + */
> > >>> +struct bios_args {
> > >>> +     u32 signature;
> > >>> +     u32 command;
> > >>> +     u32 commandtype;
> > >>> +     u32 datasize;
> > >>> +     u8 data[];
> > >>> +};
> > >>> +
> > >>> +
> > >>> +#pragma pack(1)
> > >>> +struct secureplatform_provisioning_data {
> > >>> +     u8 state;
> > >>> +     u8 version[2];
> > >>> +     u8 reserved1;
> > >>> +     u32 features;
> > >>> +     u32 nonce;
> > >>> +     u8 reserved2[28];
> > >>> +     u8 sk_mod[MAX_KEY_MOD];
> > >>> +     u8 kek_mod[MAX_KEY_MOD];
> > >>> +};
> > >>> +
> > >>> +#pragma pack()
> > >>> +
> > >>> +
> > >>> +struct string_data {
> > >>> +     struct kobject *attr_name_kobj;
> > >>> +     u8 attribute_name[MAX_BUFF];
> > >>> +     u8 display_name[MAX_BUFF];
> > >>> +     u8 current_value[MAX_BUFF];
> > >>> +     u8 new_value[MAX_BUFF];
> > >>> +     u8 path[MAX_BUFF];
> > >>> +     u32 is_readonly;
> > >>> +     u32 display_in_ui;
> > >>> +     u32 requires_physical_presence;
> > >>> +     u32 sequence;
> > >>> +     u32 prerequisitesize;
> > >>> +     u8 prerequisites[MAX_BUFF];
> > >>> +     u32 security_level;
> > >>> +     u32 min_length;
> > >>> +     u32 max_length;
> > >>> +     u8 display_name_language_code[MAX_BUFF];
> > >>> +     u32 type;
> > >>> +};
> > >>> +
> > >>> +struct integer_data {
> > >>> +     struct kobject *attr_name_kobj;
> > >>> +     u8 attribute_name[MAX_BUFF];
> > >>> +     u8 display_name[MAX_BUFF];
> > >>> +     u32 current_value;
> > >>> +     u32 new_value;
> > >>> +     u8 path[MAX_BUFF];
> > >>> +     u32 is_readonly;
> > >>> +     u32 display_in_ui;
> > >>> +     u32 requires_physical_presence;
> > >>> +     u32 sequence;
> > >>> +     u32 prerequisitesize;
> > >>> +     u8 prerequisites[MAX_BUFF];
> > >>> +     u32 security_level;
> > >>> +     u32 lower_bound;
> > >>> +     u32 upper_bound;
> > >>> +     u32 scalar_increment;
> > >>> +     u8 display_name_language_code[MAX_BUFF];
> > >>> +     u32 type;
> > >>> +};
> > >>> +
> > >>> +struct enumeration_data {
> > >>> +     struct kobject *attr_name_kobj;
> > >>> +     u8 attribute_name[MAX_BUFF];
> > >>> +     u8 display_name[MAX_BUFF];
> > >>> +     u8 path[MAX_BUFF];
> > >>> +     u32 is_readonly;
> > >>> +     u32 display_in_ui;
> > >>> +     u32 requires_physical_presence;
> > >>> +     u32 sequence;
> > >>> +     u32 prerequisitesize;
> > >>> +     u8 prerequisites[MAX_BUFF];
> > >>> +     u32 security_level;
> > >>> +     u8 current_value[MAX_BUFF];
> > >>> +     u8 new_value[MAX_BUFF];
> > >>> +     u32 size;
> > >>> +     u8 possible_values[MAX_BUFF];
> > >>> +     u8 display_name_language_code[MAX_BUFF];
> > >>> +     u32 type;
> > >>> +};
> > >>> +
> > >>> +struct ordered_list_data {
> > >>> +     struct kobject *attr_name_kobj;
> > >>> +     u8 attribute_name[MAX_BUFF];
> > >>> +     u8 display_name[MAX_BUFF];
> > >>> +     u8 current_value[MAX_BUFF];
> > >>> +     u8 new_value[MAX_BUFF];
> > >>> +     u8 path[MAX_BUFF];
> > >>> +     u32 is_readonly;
> > >>> +     u32 display_in_ui;
> > >>> +     u32 requires_physical_presence;
> > >>> +     u32 sequence;
> > >>> +     u32 prerequisitesize;
> > >>> +     u8 prerequisites[MAX_BUFF];
> > >>> +     u32 security_level;
> > >>> +     u32 size;
> > >>> +     u8 elements[MAX_BUFF];
> > >>> +     u8 display_name_language_code[MAX_BUFF];
> > >>> +     u32 type;
> > >>> +};
> > >>> +
> > >>> +struct password_data {
> > >>> +     struct kobject *attr_name_kobj;
> > >>> +     u8 attribute_name[MAX_BUFF];
> > >>> +     u8 display_name[MAX_BUFF];
> > >>> +     u8 current_password[MAX_PASSWD_SIZE];
> > >>> +     u8 new_password[MAX_PASSWD_SIZE];
> > >>> +     u8 path[MAX_BUFF];
> > >>> +     u32 is_readonly;
> > >>> +     u32 display_in_ui;
> > >>> +     u32 requires_physical_presence;
> > >>> +     u32 sequence;
> > >>> +     u32 prerequisitesize;
> > >>> +     u8 prerequisites[MAX_BUFF];
> > >>> +     u32 security_level;
> > >>> +     u32 min_password_length;
> > >>> +     u32 max_password_length;
> > >>> +     u32 encoding_size;
> > >>> +     u8 supported_encoding[MAX_BUFF];
> > >>> +     u8 display_name_language_code[MAX_BUFF];
> > >>> +     u32 is_enabled;
> > >>> +
> > >>> +     // 'bios-admin' 'power-on'
> > >>> +     u32 role;
> > >>> +
> > >>> +     //'password'
> > >>> +     u32 mechanism;
> > >>> +     u32 type;
> > >>> +};
> > >>> +
> > >>> +struct secure_platform_data {
> > >>> +     struct kobject *attr_name_kobj;
> > >>> +     u8 attribute_name[MAX_BUFF];
> > >>> +     u8 display_name[MAX_BUFF];
> > >>> +
> > >>> +     u8 *endorsement_key;
> > >>> +     u8 *signing_key;
> > >>> +
> > >>> +     u32 is_enabled;
> > >>> +     u32 mechanism;
> > >>> +     u32 type;
> > >>> +};
> > >>> +
> > >>> +struct bioscfg_priv {
> > >>> +     struct wmi_device *password_attr_wdev;
> > >>> +     struct wmi_device *bios_attr_wdev;
> > >>> +     struct kset *authentication_dir_kset;
> > >>> +     struct kset *main_dir_kset;
> > >>> +     struct device *class_dev;
> > >>> +     struct string_data *string_data;
> > >>> +     u32 string_instances_count;
> > >>> +     struct integer_data *integer_data;
> > >>> +     u32 integer_instances_count;
> > >>> +     struct enumeration_data *enumeration_data;
> > >>> +     u32 enumeration_instances_count;
> > >>> +     struct ordered_list_data *ordered_list_data;
> > >>> +     u32 ordered_list_instances_count;
> > >>> +     struct password_data *password_data;
> > >>> +     u32 password_instances_count;
> > >>> +
> > >>> +     struct kobject *sure_start_attr_kobj;
> > >>> +     struct kobject *sure_admin_attr_kobj;
> > >>> +     struct secure_platform_data spm_data;
> > >>> +
> > >>> +     int  last_wmi_status;
> > >>> +     bool pending_reboot;
> > >>> +     struct mutex mutex;
> > >>> +};
> > >>> +
> > >>> +/* global structure used by multiple WMI interfaces */
> > >>> +extern struct bioscfg_priv bioscfg_drv;
> > >>> +
> > >>> +enum hp_wmi_data_type {
> > >>> +     HPWMI_STRING_TYPE               =3D 0x00,
> > >>> +     HPWMI_INTEGER_TYPE              =3D 0x01,
> > >>> +     HPWMI_ENUMERATION_TYPE          =3D 0x02,
> > >>> +     HPWMI_ORDERED_LIST_TYPE         =3D 0x03,
> > >>> +     HPWMI_PASSWORD_TYPE             =3D 0x04,
> > >>> +     HPWMI_SECURE_PLATFORM_TYPE      =3D 0x05,
> > >>> +     HPWMI_SURE_START_TYPE           =3D 0x06,
> > >>> +     HPWMI_SURE_ADMIN_TYPE           =3D 0x07,
> > >>> +};
> > >>> +
> > >>> +enum hp_wmi_data_elements {
> > >>> +
> > >>> +     /* Common elements */
> > >>> +     NAME =3D 0,
> > >>> +     VALUE =3D 1,
> > >>> +     PATH =3D 2,
> > >>> +     IS_READONLY =3D 3,
> > >>> +     DISPLAY_IN_UI =3D 4,
> > >>> +     REQUIRES_PHYSICAL_PRESENCE =3D 5,
> > >>> +     SEQUENCE =3D 6,
> > >>> +     PREREQUISITE_SIZE =3D 7,
> > >>> +     PREREQUISITES =3D 8,
> > >>> +     SECURITY_LEVEL =3D 9,
> > >>> +
> > >>> +     /* String elements */
> > >>> +     STR_MIN_LENGTH =3D 10,
> > >>> +     STR_MAX_LENGTH =3D 11,
> > >>> +
> > >>> +     /* Integer elements */
> > >>> +     INT_LOWER_BOUND =3D 10,
> > >>> +     INT_UPPER_BOUND =3D 11,
> > >>> +     INT_SCALAR_INCREMENT =3D 12,
> > >>> +
> > >>> +     /* Enumeration elements */
> > >>> +     ENUM_CURRENT_VALUE =3D 10,
> > >>> +     ENUM_SIZE =3D 11,
> > >>> +     ENUM_POSSIBLE_VALUES =3D 12,
> > >>> +
> > >>> +     /* Ordered list elements */
> > >>> +     ORD_LIST_SIZE =3D 10,
> > >>> +     ORD_LIST_ELEMENTS =3D 11,
> > >>> +
> > >>> +     /* Password elements */
> > >>> +     PSWD_MIN_LENGTH =3D 10,
> > >>> +     PSWD_MAX_LENGTH =3D 11,
> > >>> +     PSWD_SIZE =3D 12,
> > >>> +     PSWD_SUPPORTED_ENCODING =3D 13,
> > >>> +     PSWD_IS_SET =3D 14
> > >>> +};
> > >>> +
> > >>> +
> > >>> +static const int hp_wmi_elements_count[] =3D {
> > >>> +     12,   // string
> > >>> +     13,   // integer
> > >>> +     13,   // enumeration
> > >>> +     12,   // ordered list
> > >>> +     15    // password
> > >>> +};
> > >>> +
> > >>> +#define get_instance_id(type)                                     =
                   \
> > >>> +static int get_##type##_instance_id(struct kobject *kobj)         =
           \
> > >>> +{                                                                 =
           \
> > >>> +     int i; \
> > >>> +                                                             \
> > >>> +     for (i =3D 0; i <=3D bioscfg_drv.type##_instances_count; i++)=
 { \
> > >>> +             if (!(strcmp(kobj->name, bioscfg_drv.type##_data[i].a=
ttribute_name))) \
> > >>> +                     return i;                                    =
           \
> > >>> +     }                                                            =
           \
> > >>> +     return -EIO;                                                 =
           \
> > >>> +}
> > >>> +
> > >>> +#define get_instance_id_for_attribute(type)                  \
> > >>> +static int get_instance_id_for_##type(char *attr_name)            =
   \
> > >>> +{                                                                 =
           \
> > >>> +     int i;                                                       =
           \
> > >>> +                                                                  =
           \
> > >>> +     for (i =3D 0; i < bioscfg_drv.type##_instances_count; i++) { =
             \
> > >>> +             if (strcmp(bioscfg_drv.type##_data[i].attribute_name,=
 attr_name) =3D=3D 0)                                          \
> > >>> +                     return i;                                    =
           \
> > >>> +     }                                                            =
           \
> > >>> +     return -EIO;                                                 =
           \
> > >>> +}
> > >>> +
> > >>> +#define attribute_s_property_show(name, type)                     =
                   \
> > >>> +static ssize_t name##_show(struct kobject *kobj, struct kobj_attri=
bute *attr,        \
> > >>> +                        char *buf)                                =
           \
> > >>> +{                                                                 =
           \
> > >>> +     int i =3D get_##type##_instance_id(kobj);                    =
             \
> > >>> +     if (i >=3D 0)                                                =
             \
> > >>> +             return sprintf(buf, "%s\n", bioscfg_drv.type##_data[i=
].name);   \
> > >>> +     return 0;                                                    =
           \
> > >>> +}
> > >>> +/* There is no need to keep track of default and current values
> > >>> + * separately
> > >>> + */
> > >>> +#define attribute_s_default_property_show(name, type, new_name)   =
                   \
> > >>> +static ssize_t name##_show(struct kobject *kobj, struct kobj_attri=
bute *attr,        \
> > >>> +                        char *buf)                                =
           \
> > >>> +{                                                                 =
           \
> > >>> +     int i =3D get_##type##_instance_id(kobj);                    =
             \
> > >>> +     if (i >=3D 0)                                                =
             \
> > >>> +             return sprintf(buf, "%s\n", bioscfg_drv.type##_data[i=
].new_name);       \
> > >>> +     return 0;                                                    =
           \
> > >>> +}
> > >>> +
> > >>> +#define attribute_n_default_property_show(name, type, new_name)   =
                   \
> > >>> +static ssize_t name##_show(struct kobject *kobj, struct kobj_attri=
bute *attr,        \
> > >>> +                        char *buf)                                =
           \
> > >>> +{                                                                 =
           \
> > >>> +     int i =3D get_##type##_instance_id(kobj);                    =
             \
> > >>> +     if (i >=3D 0)                                                =
             \
> > >>> +             return sprintf(buf, "%d\n", bioscfg_drv.type##_data[i=
].new_name); \
> > >>> +     return 0;                                                    =
           \
> > >>> +}
> > >>> +
> > >>> +#define attribute_n_property_show(name, type)                     =
                   \
> > >>> +static ssize_t name##_show(struct kobject *kobj, struct kobj_attri=
bute *attr,        \
> > >>> +                        char *buf)                                =
           \
> > >>> +{                                                                 =
           \
> > >>> +     int i =3D get_##type##_instance_id(kobj);                    =
             \
> > >>> +     if (i >=3D 0)                                                =
             \
> > >>> +             return sprintf(buf, "%d\n", bioscfg_drv.type##_data[i=
].name);   \
> > >>> +     return 0;                                                    =
           \
> > >>> +}
> > >>> +
> > >>> +
> > >>> +#define attribute_property_store(curr_val, type)                  =
           \
> > >>> +static ssize_t curr_val##_store(struct kobject *kobj,             =
                   \
> > >>> +                             struct kobj_attribute *attr,         =
           \
> > >>> +                             const char *buf, size_t count)       =
           \
> > >>> +{                                                                 =
           \
> > >>> +     char *p =3D NULL;                                            =
             \
> > >>> +     char *attr_value =3D NULL;                                   =
             \
> > >>> +     char *attr_name =3D NULL;                                    =
             \
> > >>> +     int i;                                                       =
           \
> > >>> +     int ret =3D -EIO;                                            =
             \
> > >>> +                                                                  =
           \
> > >>> +     attr_name =3D kstrdup(kobj->name, GFP_KERNEL);               =
             \
> > >>> +     if (!attr_name)                                              =
           \
> > >>> +             return -ENOMEM;                                      =
           \
> > >>> +                                                                  =
           \
> > >>> +     attr_value =3D kstrdup(buf, GFP_KERNEL);                     =
             \
> > >>> +     if (!attr_value)                                             =
           \
> > >>> +             return -ENOMEM;                                      =
           \
> > >>> +                                                                  =
           \
> > >>> +     p =3D memchr(attr_value, '\n', count);                       =
             \
> > >>> +     if (p !=3D NULL)                                             =
             \
> > >>> +             *p =3D '\0';                                         =
             \
> > >>> +                                                                  =
           \
> > >>> +     i =3D get_##type##_instance_id(kobj);                        =
             \
> > >>> +     if (i >=3D 0)                                                =
             \
> > >>> +             ret =3D validate_##type##_input(i, attr_value);      =
             \
> > >>> +     if (!ret)                                                    =
           \
> > >>> +             ret =3D hp_set_attribute(attr_name, attr_value);     =
             \
> > >>> +     if (!ret)                                                    =
           \
> > >>> +             update_##type##_value(i);                            =
           \
> > >>> +                                                                  =
           \
> > >>> +     clear_all_passwords();                                       =
           \
> > >>> +     kfree(attr_name);                                            =
           \
> > >>> +     kfree(attr_value);                                           =
           \
> > >>> +                                                                  =
           \
> > >>> +     return ret ? ret : count;                                    =
           \
> > >>> +}
> > >>> +
> > >>> +#define attribute_spm_n_property_show(name, type)                 =
           \
> > >>> +static ssize_t name##_show(struct kobject *kobj, struct kobj_attri=
bute *attr, char *buf) \
> > >>> +{                                                                 =
   \
> > >>> +     return sprintf(buf, "%d\n", bioscfg_drv.type##_data.name);\
> > >>> +}
> > >>> +
> > >>> +#define attribute_spm_s_property_show(name, type)                 =
           \
> > >>> +static ssize_t name##_show(struct kobject *kobj, struct kobj_attri=
bute *attr, char *buf) \
> > >>> +{                                                                 =
   \
> > >>> +     return sprintf(buf, "%s\n", bioscfg_drv.type##_data.name);   =
           \
> > >>> +}
> > >>> +
> > >>> +#define check_property_type(attr, prop, valuetype)\
> > >>> +     (attr##_obj[prop].type !=3D valuetype)
> > >>> +
> > >>> +#define HPWMI_BINATTR_RW(_group, _name, _size)       \
> > >>> +static struct bin_attribute _group##_##_name =3D       \
> > >>> +__BIN_ATTR(_name, 0444 | 0200, _group##_##_name##_read, _group##_#=
#_name##_write, _size)
> > >>> +
> > >>> +/*
> > >>> + * Prototypes
> > >>> + */
> > >>> +union acpi_object *get_wmiobj_pointer(int instance_id, const char =
*guid_string);
> > >>> +int get_instance_count(const char *guid_string);
> > >>> +void strlcpy_attr(char *dest, char *src);
> > >>> +
> > >>> +/* String attributes */
> > >>> +int populate_string_buffer_data(union acpi_object *str_obj,
> > >>> +                      int instance_id,
> > >>> +                      struct kobject *attr_name_kobj);
> > >>> +int populate_string_elements_from_buffer(union acpi_object *string=
_obj,
> > >>> +                                      int instance_id,
> > >>> +                                      enum hp_wmi_data_type type);
> > >>> +int alloc_string_data(void);
> > >>> +void exit_string_attributes(void);
> > >>> +int populate_string_package_data(union acpi_object *str_obj,
> > >>> +                              int instance_id,
> > >>> +                              struct kobject *attr_name_kobj);
> > >>> +int populate_string_elements_from_package(union acpi_object *str_o=
bj,
> > >>> +                                               int instance_id,
> > >>> +                                               enum hp_wmi_data_ty=
pe type);
> > >>> +
> > >>> +/* Integer attributes */
> > >>> +int populate_integer_buffer_data(union acpi_object *integer_obj,
> > >>> +                       int instance_id,
> > >>> +                       struct kobject *attr_name_kobj);
> > >>> +int populate_integer_elements_from_buffer(union acpi_object *integ=
er_obj,
> > >>> +                                       int instance_id,
> > >>> +                                       enum hp_wmi_data_type type)=
;
> > >>> +int alloc_integer_data(void);
> > >>> +void exit_integer_attributes(void);
> > >>> +int populate_integer_package_data(union acpi_object *integer_obj,
> > >>> +                               int instance_id,
> > >>> +                               struct kobject *attr_name_kobj);
> > >>> +int populate_integer_elements_from_package(union acpi_object *inte=
ger_obj,
> > >>> +                                               int instance_id,
> > >>> +                                               enum hp_wmi_data_ty=
pe type);
> > >>> +
> > >>> +/* Enumeration attributes */
> > >>> +int populate_enumeration_buffer_data(union acpi_object *enum_obj,
> > >>> +                           int instance_id,
> > >>> +                           struct kobject *attr_name_kobj);
> > >>> +int populate_enumeration_elements_from_buffer(union acpi_object *e=
num_obj,
> > >>> +                                           int instance_id,
> > >>> +                                           enum hp_wmi_data_type t=
ype);
> > >>> +int alloc_enumeration_data(void);
> > >>> +void exit_enumeration_attributes(void);
> > >>> +int populate_enumeration_package_data(union acpi_object *enum_obj,
> > >>> +                                   int instance_id,
> > >>> +                                   struct kobject *attr_name_kobj)=
;
> > >>> +int populate_enumeration_elements_from_package(union acpi_object *=
enum_obj,
> > >>> +                                            int instance_id,
> > >>> +                                            enum hp_wmi_data_type =
type);
> > >>> +
> > >>> +/* Ordered list */
> > >>> +int populate_ordered_list_buffer_data(union acpi_object *order_obj=
, int instance_id,
> > >>> +                                   struct kobject *attr_name_kobj)=
;
> > >>> +int populate_ordered_list_elements_from_buffer(union acpi_object *=
order_obj,
> > >>> +                                            int instance_id,
> > >>> +                                            enum hp_wmi_data_type
> > >>> +                                            type);
> > >>> +int alloc_ordered_list_data(void);
> > >>> +void exit_ordered_list_attributes(void);
> > >>> +int populate_ordered_list_package_data(union acpi_object *order_ob=
j,
> > >>> +                                    int instance_id,
> > >>> +                                    struct kobject *attr_name_kobj=
);
> > >>> +int populate_ordered_list_elements_from_package(union acpi_object =
*order_obj,
> > >>> +                                             int instance_id,
> > >>> +                                             enum hp_wmi_data_type=
 type);
> > >>> +
> > >>> +/* Password authentication attributes */
> > >>> +int populate_password_buffer_data(union acpi_object *password_obj,
> > >>> +                        int instance_id,
> > >>> +                        struct kobject *attr_name_kobj);
> > >>> +int populate_password_elements_from_buffer(union acpi_object *pass=
word_obj,
> > >>> +                                        int instance_id,
> > >>> +                                        enum hp_wmi_data_type type=
);
> > >>> +int populate_password_package_data(union acpi_object *password_obj=
, int instance_id,
> > >>> +                                struct kobject *attr_name_kobj);
> > >>> +int populate_password_elements_from_package(union acpi_object *pas=
sword_obj,
> > >>> +                                        int instance_id,
> > >>> +                                         enum hp_wmi_data_type typ=
e);
> > >>> +int alloc_password_data(void);
> > >>> +int alloc_secure_platform_data(void);
> > >>> +void exit_password_attributes(void);
> > >>> +void exit_secure_platform_attributes(void);
> > >>> +int populate_secure_platform_data(struct kobject *attr_name_kobj);
> > >>> +int password_is_set(const char *auth);
> > >>> +int check_spm_is_enabled(void);
> > >>> +int wmi_error_and_message(int error_code, char *message);
> > >>> +int hp_wmi_set_bios_setting(void *input_buffer, int input_size);
> > >>> +int hp_wmi_perform_query(int query, enum hp_wmi_command command,
> > >>> +                             void *buffer, int insize, int outsize=
);
> > >>> +
> > >>> +/* Sure Start attributes */
> > >>> +void exit_sure_start_attributes(void);
> > >>> +int populate_sure_start_data(struct kobject *attr_name_kobj);
> > >>> +
> > >>> +/* Sure Admin Attributes */
> > >>> +void exit_sure_admin_attributes(void);
> > >>> +int populate_sure_admin_data(struct kobject *attr_name_kobj);
> > >>> +int hp_set_attribute(const char *a_name, const char *a_value);
> > >>> +int hp_set_attribute_with_payload(const char *a_name,
> > >>> +                               const char *a_value,
> > >>> +                               const char *auth_payload);
> > >>> +int update_attribute_value(char *attr_name, char *attr_value);
> > >>> +int hp_bios_settings_fill_buffer(void);
> > >>> +int hp_bios_settings_free_buffer(void);
> > >>> +int hp_bios_settings_realloc_buffer(char **buf, int *buf_size,
> > >>> +                                        int *alloc_size);
> > >>> +int append_read_string_attributes(char *buf, int alloc_size,
> > >>> +                                     int instance,
> > >>> +                                     enum hp_wmi_data_type type);
> > >>> +int append_read_integer_attributes(char *buf, int alloc_size,
> > >>> +                                      int instance,
> > >>> +                                      enum hp_wmi_data_type type);
> > >>> +int append_read_enumeration_attributes(char *buf, int alloc_size,
> > >>> +                                          int instance,
> > >>> +                                          enum hp_wmi_data_type ty=
pe);
> > >>> +int append_read_ordered_list_attributes(char *buf, int alloc_size,
> > >>> +                                           int instance,
> > >>> +                                           enum hp_wmi_data_type t=
ype);
> > >>> +int append_read_password_attributes(char *buf, int alloc_size,
> > >>> +                                      int instance,
> > >>> +                                      enum hp_wmi_data_type type);
> > >>> +int append_read_settings(enum hp_wmi_data_type type, char **buf,
> > >>> +                           int *buf_size, int *alloc_size);
> > >>> +int append_read_attributes(char **buf, int alloc_size,
> > >>> +                              int instance, enum hp_wmi_data_type =
type);
> > >>> +int set_bios_defaults(u8 defType);
> > >>> +int get_password_instance_for_type(const char *name);
> > >>> +int clear_all_passwords(void);
> > >>> +int clear_passwords(const int instance);
> > >>> +void exit_bios_attr_set_interface(void);
> > >>> +int init_bios_attr_set_interface(void);
> > >>> +size_t calculate_string_buffer(const char *str);
> > >>> +size_t calculate_security_buffer(const char *authentication);
> > >>> +void populate_security_buffer(u16 *buffer, const char *authenticat=
ion);
> > >>> +ssize_t populate_string_buffer(u16 *buffer, size_t buffer_len, con=
st char *str);
> > >>> +int set_new_password(const char *password_type, const char *new_pa=
ssword);
> > >>> +int init_bios_attr_pass_interface(void);
> > >>> +void exit_bios_attr_pass_interface(void);
> > >>> +void *ascii_to_utf16_unicode(u16 *p, const u8 *str);
> > >>> +int get_integer_from_buffer(int **buffer, int *integer);
> > >>> +int get_string_from_buffer(u16 **buffer, char **str);
> > >>> +int convert_hexstr_to_str(char **hex, int input_len, char **str, i=
nt *len);
> > >>> +int convert_hexstr_to_int(char *str, int *int_value);
> > >>> +inline int encode_outsize_for_pvsz(int outsize);
> > >>> +
> > >>> +#endif
> > >>> diff --git a/drivers/platform/x86/hp/enum-attributes.c b/drivers/pl=
atform/x86/hp/enum-attributes.c
> > >>> new file mode 100644
> > >>> index 000000000000..6ec02b61857c
> > >>> --- /dev/null
> > >>> +++ b/drivers/platform/x86/hp/enum-attributes.c
> > >>> @@ -0,0 +1,504 @@
> > >>> +// SPDX-License-Identifier: GPL-2.0
> > >>> +/*
> > >>> + * Functions corresponding to enumeration type attributes under
> > >>> + * BIOS Enumeration GUID for use with hp-bioscfg driver.
> > >>> + *
> > >>> + *  Copyright (c) 2022 HP Development Company, L.P.
> > >>> + */
> > >>> +
> > >>> +#include "bioscfg.h"
> > >>> +
> > >>> +get_instance_id(enumeration);
> > >>> +
> > >>> +static ssize_t current_value_show(struct kobject *kobj, struct kob=
j_attribute *attr, char *buf)
> > >>> +{
> > >>> +     int instance_id =3D get_enumeration_instance_id(kobj);
> > >>> +     union acpi_object *obj =3D NULL;
> > >>> +     ssize_t ret;
> > >>> +
> > >>> +     if (instance_id < 0)
> > >>> +             return -EIO;
> > >>> +
> > >>> +     /* need to use specific instance_id and guid combination to g=
et right data */
> > >>> +     obj =3D get_wmiobj_pointer(instance_id, HP_WMI_BIOS_ENUMERATI=
ON_GUID);
> > >>> +     if (!obj)
> > >>> +             return -EIO;
> > >>> +
> > >>> +     ret =3D snprintf(buf, PAGE_SIZE, "%s\n",
> > >>> +                    bioscfg_drv.enumeration_data[instance_id].curr=
ent_value);
> > >>> +
> > >>> +     kfree(obj);
> > >>> +     return ret;
> > >>> +}
> > >>> +
> > >>> +
> > >>> +/*
> > >>> + * validate_enumeration_input() -
> > >>> + * Validate input of current_value against possible values
> > >>> + *
> > >>> + * @instance_id: The instance on which input is validated
> > >>> + * @buf: Input value
> > >>> + */
> > >>> +static int validate_enumeration_input(int instance_id, const char =
*buf)
> > >>> +{
> > >>> +     char *options =3D NULL;
> > >>> +     char *p;
> > >>> +     int ret =3D 0;
> > >>> +     int found =3D 0;
> > >>> +
> > >>> +     options =3D kstrdup(bioscfg_drv.enumeration_data[instance_id]=
.possible_values,
> > >>> +                       GFP_KERNEL);
> > >>> +
> > >>> +     if (!options) {
> > >>> +             ret =3D -ENOMEM;
> > >>> +             goto exit_validate_enum_input;
> > >>> +     }
> > >>> +
> > >>> +     /* Is it a read only attribute */
> > >>> +     if (bioscfg_drv.enumeration_data[instance_id].is_readonly) {
> > >>> +             ret =3D -EIO;
> > >>> +             goto exit_validate_enum_input;
> > >>> +     }
> > >>> +
> > >>> +     while ((p =3D strsep(&options, ";")) !=3D NULL) {
> > >>> +             if (!*p)
> > >>> +                     continue;
> > >>> +
> > >>> +             if (!strcasecmp(p, buf)) {
> > >>> +                     found =3D 1;
> > >>> +                     break;
> > >>> +             }
> > >>> +     }
> > >>> +
> > >>> +     if (!found) {
> > >>> +             ret =3D -EINVAL;
> > >>> +             goto exit_validate_enum_input;
> > >>> +     }
> > >>> +
> > >>> +     strscpy(bioscfg_drv.enumeration_data[instance_id].new_value,
> > >>> +             buf,
> > >>> +             sizeof(bioscfg_drv.enumeration_data[instance_id].new_=
value));
> > >>> +
> > >>> +exit_validate_enum_input:
> > >>> +     kfree(options);
> > >>> +     return ret;
> > >>> +}
> > >>> +
> > >>> +static void update_enumeration_value(int instance_id)
> > >>> +{
> > >>> +     strscpy(bioscfg_drv.enumeration_data[instance_id].current_val=
ue,
> > >>> +             bioscfg_drv.enumeration_data[instance_id].new_value,
> > >>> +             sizeof(bioscfg_drv.enumeration_data[instance_id].curr=
ent_value));
> > >>> +}
> > >>> +
> > >>> +
> > >>> +attribute_s_property_show(display_name_language_code, enumeration)=
;
> > >>> +static struct kobj_attribute enumeration_display_langcode =3D
> > >>> +             __ATTR_RO(display_name_language_code);
> > >>> +
> > >>> +attribute_s_property_show(display_name, enumeration);
> > >>> +static struct kobj_attribute  enumeration_display_name =3D
> > >>> +             __ATTR_RO(display_name);
> > >>> +
> > >>> +attribute_property_store(current_value, enumeration);
> > >>> +static struct kobj_attribute enumeration_current_val =3D
> > >>> +     __ATTR_RW_MODE(current_value, 0600);
> > >>> +
> > >>> +attribute_s_property_show(possible_values, enumeration);
> > >>> +static struct kobj_attribute  enumeration_poss_val =3D
> > >>> +             __ATTR_RO(possible_values);
> > >>> +
> > >>> +static ssize_t type_show(struct kobject *kobj, struct kobj_attribu=
te *attr,
> > >>> +                      char *buf)
> > >>> +{
> > >>> +     return sprintf(buf, "enumeration\n");
> > >>> +}
> > >>> +static struct kobj_attribute enumeration_type =3D
> > >>> +             __ATTR_RO(type);
> > >>> +
> > >>> +static struct attribute *enumeration_attrs[] =3D {
> > >>> +     &enumeration_display_langcode.attr,
> > >>> +     &enumeration_display_name.attr,
> > >>> +     &enumeration_current_val.attr,
> > >>> +     &enumeration_poss_val.attr,
> > >>> +     &enumeration_type.attr,
> > >>> +     NULL,
> > >>> +};
> > >>> +
> > >>> +static const struct attribute_group enumeration_attr_group =3D {
> > >>> +     .attrs =3D enumeration_attrs,
> > >>> +};
> > >>> +
> > >>> +int alloc_enumeration_data(void)
> > >>> +{
> > >>> +     int ret =3D 0;
> > >>> +
> > >>> +     bioscfg_drv.enumeration_instances_count =3D
> > >>> +             get_instance_count(HP_WMI_BIOS_ENUMERATION_GUID);
> > >>> +
> > >>> +     bioscfg_drv.enumeration_data =3D kcalloc(bioscfg_drv.enumerat=
ion_instances_count,
> > >>> +                                     sizeof(struct enumeration_dat=
a), GFP_KERNEL);
> > >>> +     if (!bioscfg_drv.enumeration_data) {
> > >>> +             bioscfg_drv.enumeration_instances_count =3D 0;
> > >>> +             ret =3D -ENOMEM;
> > >>> +     }
> > >>> +     return ret;
> > >>> +}
> > >>> +
> > >>> +/*
> > >>> + * populate_enumeration_package_data() -
> > >>> + * Populate all properties of an instance under enumeration attrib=
ute
> > >>> + *
> > >>> + * @enum_obj: ACPI object with enumeration data
> > >>> + * @instance_id: The instance to enumerate
> > >>> + * @attr_name_kobj: The parent kernel object
> > >>> + */
> > >>> +int populate_enumeration_package_data(union acpi_object *enum_obj,=
 int instance_id,
> > >>> +                     struct kobject *attr_name_kobj)
> > >>> +{
> > >>> +     char *str_value =3D NULL;
> > >>> +     int str_len;
> > >>> +     int ret =3D 0;
> > >>> +
> > >>> +     bioscfg_drv.enumeration_data[instance_id].type =3D HPWMI_ENUM=
ERATION_TYPE;
> > >>> +     bioscfg_drv.enumeration_data[instance_id].attr_name_kobj =3D =
attr_name_kobj;
> > >>> +
> > >>> +     ret =3D convert_hexstr_to_str(&(enum_obj[NAME].string.pointer=
),
> > >>> +                                 enum_obj[NAME].string.length,
> > >>> +                                 &str_value, &str_len);
> > >>> +     if (ACPI_FAILURE(ret)) {
> > >>> +             pr_warn("Failed to populate enumeration package data.=
 Error [0%0x]\n", ret);
> > >>> +             kfree(str_value);
> > >>> +             return ret;
> > >>> +     }
> > >>> +
> > >>> +     strscpy(bioscfg_drv.enumeration_data[instance_id].attribute_n=
ame,
> > >>> +             str_value,
> > >>> +             sizeof(bioscfg_drv.enumeration_data[instance_id].attr=
ibute_name));
> > >>> +
> > >>> +     strscpy(bioscfg_drv.enumeration_data[instance_id].display_nam=
e,
> > >>> +             str_value,
> > >>> +             sizeof(bioscfg_drv.enumeration_data[instance_id].disp=
lay_name));
> > >>> +
> > >>> +     kfree(str_value);
> > >>> +     str_value =3D NULL;
> > >>> +
> > >>> +     populate_enumeration_elements_from_package(enum_obj, instance=
_id, HPWMI_ENUMERATION_TYPE);
> > >>> +
> > >>> +     return sysfs_create_group(attr_name_kobj, &enumeration_attr_g=
roup);
> > >>> +}
> > >>> +
> > >>> +int populate_enumeration_elements_from_package(union acpi_object *=
enum_obj,
> > >>> +                                        int instance_id,
> > >>> +                                        enum hp_wmi_data_type type=
)
> > >>> +{
> > >>> +     char *str_value =3D NULL;
> > >>> +     int value_len;
> > >>> +     int status =3D 0;
> > >>> +     u32 size =3D 0;
> > >>> +     u32 int_value;
> > >>> +     int elem =3D 0;
> > >>> +     int reqs;
> > >>> +     int eloc;
> > >>> +     int pos_values;
> > >>> +
> > >>> +     strscpy(bioscfg_drv.enumeration_data[instance_id].display_nam=
e_language_code,
> > >>> +             LANG_CODE_STR,
> > >>> +             sizeof(bioscfg_drv.enumeration_data[instance_id].disp=
lay_name_language_code));
> > >>> +
> > >>> +     for (elem =3D 1, eloc =3D 1; elem < hp_wmi_elements_count[typ=
e]; elem++, eloc++) {
> > >>> +
> > >>> +             switch (enum_obj[elem].type) {
> > >>> +             case ACPI_TYPE_STRING:
> > >>> +
> > >>> +                     if (PREREQUISITES !=3D elem && ENUM_POSSIBLE_=
VALUES !=3D elem) {
> > >>> +                             status =3D convert_hexstr_to_str(&enu=
m_obj[elem].string.pointer,
> > >>> +                                                            enum_o=
bj[elem].string.length,
> > >>> +                                                            &str_v=
alue, &value_len);
> > >>> +                             if (ACPI_FAILURE(status))
> > >>> +                                     continue;
> > >>> +
> > >>> +                     }
> > >>> +                     break;
> > >>> +             case ACPI_TYPE_INTEGER:
> > >>> +                     int_value =3D (u32)enum_obj[elem].integer.val=
ue;
> > >>> +                     break;
> > >>> +             default:
> > >>> +                     pr_warn("Unsupported object type [%d]\n", enu=
m_obj[elem].type);
> > >>> +                     continue;
> > >>> +             }
> > >>> +
> > >>> +             /* stop if extra counter is greater than total number
> > >>> +              * of elements for enumeration type
> > >>> +              */
> > >>> +             if (eloc =3D=3D hp_wmi_elements_count[type])
> > >>> +                     goto exit_enumeration_package;
> > >>> +
> > >>> +             /* Assign appropriate element value to corresponding =
field*/
> > >>> +             switch (eloc) {
> > >>> +             case VALUE:
> > >>> +                     break;
> > >>> +             case PATH:
> > >>> +                     strscpy(bioscfg_drv.enumeration_data[instance=
_id].path, str_value,
> > >>> +                             sizeof(bioscfg_drv.enumeration_data[i=
nstance_id].path));
> > >>> +                     break;
> > >>> +             case IS_READONLY:
> > >>> +                     bioscfg_drv.enumeration_data[instance_id].is_=
readonly =3D int_value;
> > >>> +                     break;
> > >>> +             case DISPLAY_IN_UI:
> > >>> +                     bioscfg_drv.enumeration_data[instance_id].dis=
play_in_ui =3D int_value;
> > >>> +                     break;
> > >>> +             case REQUIRES_PHYSICAL_PRESENCE:
> > >>> +                     bioscfg_drv.enumeration_data[instance_id].req=
uires_physical_presence =3D int_value;
> > >>> +                     break;
> > >>> +             case SEQUENCE:
> > >>> +                     bioscfg_drv.enumeration_data[instance_id].seq=
uence =3D int_value;
> > >>> +                     break;
> > >>> +             case PREREQUISITE_SIZE:
> > >>> +                     bioscfg_drv.enumeration_data[instance_id].pre=
requisitesize =3D int_value;
> > >>> +                     if (int_value > 20)
> > >>> +                             pr_warn("Prerequisites size value exc=
eeded the maximum number of elements supported or data may be malformed\n")=
;
> > >>> +                     /*
> > >>> +                      * prerequisites element is omitted when
> > >>> +                      * prerequisitesSize value is zero.
> > >>> +                      */
> > >>> +                     if (int_value =3D=3D 0)
> > >>> +                             eloc++;
> > >>> +                     break;
> > >>> +             case PREREQUISITES:
> > >>> +                     size =3D bioscfg_drv.enumeration_data[instanc=
e_id].prerequisitesize;
> > >>> +
> > >>> +                     for (reqs =3D 0; reqs < size; reqs++) {
> > >>> +                             status =3D convert_hexstr_to_str(&enu=
m_obj[elem].string.pointer,
> > >>> +                                                            enum_o=
bj[elem].string.length,
> > >>> +                                                            &str_v=
alue, &value_len);
> > >>> +                             if (ACPI_FAILURE(status))
> > >>> +                                     break;
> > >>> +
> > >>> +                             strlcat(bioscfg_drv.enumeration_data[=
instance_id].prerequisites,
> > >>> +                                     str_value,
> > >>> +                                     sizeof(bioscfg_drv.enumeratio=
n_data[instance_id].prerequisites));
> > >>> +                             if (reqs !=3D (size - 1))
> > >>> +                                     strlcat(bioscfg_drv.enumerati=
on_data[instance_id].prerequisites, ";",
> > >>> +                                             sizeof(bioscfg_drv.en=
umeration_data[instance_id].prerequisites));
> > >>> +
> > >>> +                             kfree(str_value);
> > >>> +                             str_value =3D NULL;
> > >>> +                     }
> > >>> +                     break;
> > >>> +
> > >>> +             case SECURITY_LEVEL:
> > >>> +                     bioscfg_drv.enumeration_data[instance_id].sec=
urity_level =3D int_value;
> > >>> +                     break;
> > >>> +
> > >>> +             case ENUM_CURRENT_VALUE:
> > >>> +                     strscpy(bioscfg_drv.enumeration_data[instance=
_id].current_value,
> > >>> +                             str_value, sizeof(bioscfg_drv.enumera=
tion_data[instance_id].current_value));
> > >>> +                     break;
> > >>> +             case ENUM_SIZE:
> > >>> +                     bioscfg_drv.enumeration_data[instance_id].siz=
e =3D int_value;
> > >>> +                     break;
> > >>> +             case ENUM_POSSIBLE_VALUES:
> > >>> +                     size =3D bioscfg_drv.enumeration_data[instanc=
e_id].size;
> > >>> +                     for (pos_values =3D 0; pos_values < size; pos=
_values++) {
> > >>> +                             status =3D convert_hexstr_to_str(&enu=
m_obj[elem + pos_values].string.pointer,
> > >>> +                                                            enum_o=
bj[elem  + pos_values].string.length,
> > >>> +                                                            &str_v=
alue, &value_len);
> > >>> +                             if (ACPI_FAILURE(status))
> > >>> +                                     break;
> > >>> +
> > >>> +                             strlcat(bioscfg_drv.enumeration_data[=
instance_id].possible_values,
> > >>> +                                     str_value,
> > >>> +                                     sizeof(bioscfg_drv.enumeratio=
n_data[instance_id].possible_values));
> > >>> +                             if (pos_values < (size - 1))
> > >>> +                                     strlcat(bioscfg_drv.enumerati=
on_data[instance_id].possible_values, ";",
> > >>> +                                             sizeof(bioscfg_drv.en=
umeration_data[instance_id].possible_values));
> > >>> +                             kfree(str_value);
> > >>> +                             str_value =3D NULL;
> > >>> +                     }
> > >>> +                     break;
> > >>> +             default:
> > >>> +                     pr_warn("Invalid element: %d found in Enumera=
tion attribute or data may be malformed\n", elem);
> > >>> +                     break;
> > >>> +             }
> > >>> +
> > >>> +             kfree(str_value);
> > >>> +             str_value =3D NULL;
> > >>> +     }
> > >>> +
> > >>> +exit_enumeration_package:
> > >>> +             kfree(str_value);
> > >>> +             str_value =3D NULL;
> > >>> +     return 0;
> > >>> +}
> > >>> +
> > >>> +/*
> > >>> + * populate_enumeration_buffer_data() -
> > >>> + * Populate all properties of an instance under enumeration attrib=
ute
> > >>> + *
> > >>> + * @enum_obj: ACPI object with enumeration data
> > >>> + * @instance_id: The instance to enumerate
> > >>> + * @attr_name_kobj: The parent kernel object
> > >>> + * @enumeration_property_count: Total properties count under enume=
ration type
> > >>> + */
> > >>> +int populate_enumeration_buffer_data(union acpi_object *enum_obj, =
int instance_id,
> > >>> +                           struct kobject *attr_name_kobj)
> > >>> +{
> > >>> +
> > >>> +     bioscfg_drv.enumeration_data[instance_id].type =3D HPWMI_ENUM=
ERATION_TYPE;
> > >>> +     bioscfg_drv.enumeration_data[instance_id].attr_name_kobj =3D =
attr_name_kobj;
> > >>> +     strscpy(bioscfg_drv.enumeration_data[instance_id].attribute_n=
ame,
> > >>> +             attr_name_kobj->name,
> > >>> +             sizeof(bioscfg_drv.enumeration_data[instance_id].attr=
ibute_name));
> > >>> +     strscpy(bioscfg_drv.enumeration_data[instance_id].display_nam=
e,
> > >>> +             attr_name_kobj->name,
> > >>> +             sizeof(bioscfg_drv.enumeration_data[instance_id].disp=
lay_name));
> > >>> +
> > >>> +     /* Populate enumeration elements */
> > >>> +     populate_enumeration_elements_from_buffer(enum_obj, instance_=
id, HPWMI_ENUMERATION_TYPE);
> > >>> +
> > >>> +     return sysfs_create_group(attr_name_kobj, &enumeration_attr_g=
roup);
> > >>> +}
> > >>> +
> > >>> +int populate_enumeration_elements_from_buffer(union acpi_object *e=
num_obj,
> > >>> +                                           int instance_id,
> > >>> +                                           enum hp_wmi_data_type t=
ype)
> > >>> +{
> > >>> +     int status;
> > >>> +     char *str =3D NULL;
> > >>> +     int elem;
> > >>> +     int reqs;
> > >>> +     int integer;
> > >>> +     int size =3D 0;
> > >>> +     int values;
> > >>> +
> > >>> +     elem =3D 0;
> > >>> +
> > >>> +     strscpy(bioscfg_drv.enumeration_data[instance_id].display_nam=
e_language_code,
> > >>> +             LANG_CODE_STR,
> > >>> +             sizeof(bioscfg_drv.enumeration_data[instance_id].disp=
lay_name_language_code));
> > >>> +
> > >>> +     for (elem =3D 1; elem < 3; elem++) {
> > >>> +
> > >>> +             status =3D get_string_from_buffer((u16 **)&enum_obj->=
buffer.pointer, &str);
> > >>> +             if (ACPI_FAILURE(status))
> > >>> +                     continue;
> > >>> +
> > >>> +             switch (elem) {
> > >>> +             case VALUE:
> > >>> +                     /* Skip 'Value' since 'CurrentValue' is repor=
ted. */
> > >>> +                     break;
> > >>> +             case PATH:
> > >>> +                     strscpy(bioscfg_drv.enumeration_data[instance=
_id].path,
> > >>> +                             str, sizeof(bioscfg_drv.enumeration_d=
ata[instance_id].path));
> > >>> +                     break;
> > >>> +             default:
> > >>> +                     pr_warn("Invalid element: %d found in Enumera=
tion attribute or data may be malformed\n", elem);
> > >>> +                     break;
> > >>> +             }
> > >>> +             kfree(str);
> > >>> +             str =3D NULL;
> > >>> +     }
> > >>> +
> > >>> +     for (elem =3D 3; elem < hp_wmi_elements_count[type]; elem++) =
{
> > >>> +             if (PREREQUISITES !=3D elem && ENUM_CURRENT_VALUE !=
=3D elem && ENUM_POSSIBLE_VALUES !=3D elem)
> > >>> +                     status =3D get_integer_from_buffer((int **)&e=
num_obj->buffer.pointer, (int *)&integer);
> > >>> +
> > >>> +             if (ACPI_FAILURE(status))
> > >>> +                     continue;
> > >>> +             switch (elem) {
> > >>> +             case IS_READONLY:
> > >>> +                     bioscfg_drv.enumeration_data[instance_id].is_=
readonly =3D integer;
> > >>> +                     break;
> > >>> +             case DISPLAY_IN_UI:
> > >>> +                     bioscfg_drv.enumeration_data[instance_id].dis=
play_in_ui =3D integer;
> > >>> +                     break;
> > >>> +             case REQUIRES_PHYSICAL_PRESENCE:
> > >>> +                     bioscfg_drv.enumeration_data[instance_id].req=
uires_physical_presence =3D integer;
> > >>> +                     break;
> > >>> +             case SEQUENCE:
> > >>> +                     bioscfg_drv.enumeration_data[instance_id].seq=
uence =3D integer;
> > >>> +                     break;
> > >>> +             case PREREQUISITE_SIZE:
> > >>> +                     bioscfg_drv.enumeration_data[instance_id].pre=
requisitesize =3D integer;
> > >>> +                     if (integer > 20)
> > >>> +                             pr_warn("Prerequisites size value exc=
eeded the maximum number of elements supported or data may be malformed\n")=
;
> > >>> +                     break;
> > >>> +             case PREREQUISITES:
> > >>> +                     size =3D bioscfg_drv.enumeration_data[instanc=
e_id].prerequisitesize;
> > >>> +                     for (reqs =3D 0; reqs < size; reqs++) {
> > >>> +                             status =3D get_string_from_buffer((u1=
6 **)&enum_obj->buffer.pointer, &str);
> > >>> +                             if (ACPI_FAILURE(status))
> > >>> +                                     continue;
> > >>> +
> > >>> +                             strlcat(bioscfg_drv.enumeration_data[=
instance_id].prerequisites,
> > >>> +                                     str,
> > >>> +                                     sizeof(bioscfg_drv.enumeratio=
n_data[instance_id].prerequisites));
> > >>> +                             if (reqs !=3D (size - 1))
> > >>> +                                     strlcat(bioscfg_drv.enumerati=
on_data[instance_id].prerequisites, ";",
> > >>> +                                             sizeof(bioscfg_drv.en=
umeration_data[instance_id].prerequisites));
> > >>> +                             kfree(str);
> > >>> +                             str =3D NULL;
> > >>> +                     }
> > >>> +                     break;
> > >>> +             case SECURITY_LEVEL:
> > >>> +                     bioscfg_drv.enumeration_data[instance_id].sec=
urity_level =3D integer;
> > >>> +                     break;
> > >>> +             case ENUM_CURRENT_VALUE:
> > >>> +                     status =3D get_string_from_buffer((u16 **)&en=
um_obj->buffer.pointer, &str);
> > >>> +                     strscpy(bioscfg_drv.enumeration_data[instance=
_id].current_value,
> > >>> +                             str,
> > >>> +                             sizeof(bioscfg_drv.enumeration_data[i=
nstance_id].current_value));
> > >>> +                     break;
> > >>> +             case ENUM_SIZE:
> > >>> +                     bioscfg_drv.enumeration_data[instance_id].siz=
e =3D integer;
> > >>> +                     break;
> > >>> +             case ENUM_POSSIBLE_VALUES:
> > >>> +                     size =3D bioscfg_drv.enumeration_data[instanc=
e_id].size;
> > >>> +                     for (values =3D 0; values < size; values++) {
> > >>> +                             status =3D get_string_from_buffer((u1=
6 **)&enum_obj->buffer.pointer, &str);
> > >>> +                             if (ACPI_FAILURE(status))
> > >>> +                                     continue;
> > >>> +
> > >>> +                             strlcat(bioscfg_drv.enumeration_data[=
instance_id].possible_values,
> > >>> +                                     str,
> > >>> +                                     sizeof(bioscfg_drv.enumeratio=
n_data[instance_id].possible_values));
> > >>> +                             if (values !=3D (size - 1))
> > >>> +                                     strlcat(bioscfg_drv.enumerati=
on_data[instance_id].possible_values, ";",
> > >>> +                                             sizeof(bioscfg_drv.en=
umeration_data[instance_id].possible_values));
> > >>> +                             kfree(str);
> > >>> +                             str =3D NULL;
> > >>> +                     }
> > >>> +                     break;
> > >>> +             default:
> > >>> +                     pr_warn("Invalid element: %d found in Enumera=
tion attribute or data may be malformed\n", elem);
> > >>> +                     break;
> > >>> +             }
> > >>> +             kfree(str);
> > >>> +             str =3D NULL;
> > >>> +     }
> > >>> +     kfree(str);
> > >>> +     str =3D NULL;
> > >>> +
> > >>> +     return 0;
> > >>> +}
> > >>> +
> > >>> +/**
> > >>> + * exit_enumeration_attributes() - Clear all attribute data
> > >>> + *
> > >>> + * Clears all data allocated for this group of attributes
> > >>> + */
> > >>> +void exit_enumeration_attributes(void)
> > >>> +{
> > >>> +     int instance_id;
> > >>> +
> > >>> +     for (instance_id =3D 0; instance_id < bioscfg_drv.enumeration=
_instances_count; instance_id++) {
> > >>> +             if (bioscfg_drv.enumeration_data[instance_id].attr_na=
me_kobj)
> > >>> +                     sysfs_remove_group(bioscfg_drv.enumeration_da=
ta[instance_id].attr_name_kobj,
> > >>> +                                                             &enum=
eration_attr_group);
> > >>> +     }
> > >>> +     bioscfg_drv.enumeration_instances_count =3D 0;
> > >>> +
> > >>> +     kfree(bioscfg_drv.enumeration_data);
> > >>> +     bioscfg_drv.enumeration_data =3D NULL;
> > >>> +}
> > >>> diff --git a/drivers/platform/x86/hp/int-attributes.c b/drivers/pla=
tform/x86/hp/int-attributes.c
> > >>> new file mode 100644
> > >>> index 000000000000..9a49a528fd9e
> > >>> --- /dev/null
> > >>> +++ b/drivers/platform/x86/hp/int-attributes.c
> > >>> @@ -0,0 +1,461 @@
> > >>> +// SPDX-License-Identifier: GPL-2.0
> > >>> +/*
> > >>> + * Functions corresponding to integer type attributes under
> > >>> + * BIOS Enumeration GUID for use with hp-bioscfg driver.
> > >>> + *
> > >>> + *  Copyright (c) 2022 Hewlett-Packard Inc.
> > >>> + */
> > >>> +
> > >>> +#include "bioscfg.h"
> > >>> +
> > >>> +get_instance_id(integer);
> > >>> +
> > >>> +static ssize_t current_value_show(struct kobject *kobj, struct kob=
j_attribute *attr, char *buf)
> > >>> +{
> > >>> +     int instance_id =3D get_integer_instance_id(kobj);
> > >>> +     union acpi_object *obj =3D NULL;
> > >>> +     ssize_t ret;
> > >>> +
> > >>> +     if (instance_id < 0)
> > >>> +             return instance_id;
> > >>> +
> > >>> +     /* need to use specific instance_id and guid combination to g=
et right data */
> > >>> +     obj =3D get_wmiobj_pointer(instance_id, HP_WMI_BIOS_INTEGER_G=
UID);
> > >>> +     if (!obj) {
> > >>> +             ret =3D -EIO;
> > >>> +             goto current_value_show_out;
> > >>> +     }
> > >>> +
> > >>> +     ret =3D snprintf(buf, PAGE_SIZE, "%d\n",  bioscfg_drv.integer=
_data[instance_id].current_value);
> > >>> +
> > >>> +current_value_show_out:
> > >>> +     kfree(obj);
> > >>> +     return ret;
> > >>> +}
> > >>> +
> > >>> +/*
> > >>> + * validate_integer_input() -
> > >>> + * Validate input of current_value against lower and upper bound
> > >>> + *
> > >>> + * @instance_id: The instance on which input is validated
> > >>> + * @buf: Input value
> > >>> + */
> > >>> +static int validate_integer_input(int instance_id, char *buf)
> > >>> +{
> > >>> +     int in_val;
> > >>> +     int ret;
> > >>> +
> > >>> +     ret =3D kstrtoint(buf, 10, &in_val);
> > >>> +
> > >>> +     /* BIOS treats it as a read only attribute */
> > >>> +     if (bioscfg_drv.integer_data[instance_id].is_readonly)
> > >>> +             return -EIO;
> > >>> +
> > >>> +     if (in_val < bioscfg_drv.integer_data[instance_id].lower_boun=
d ||
> > >>> +                     in_val > bioscfg_drv.integer_data[instance_id=
].upper_bound)
> > >>> +             return -EINVAL;
> > >>> +
> > >>> +     bioscfg_drv.integer_data[instance_id].new_value =3D in_val;
> > >>> +
> > >>> +     return 0;
> > >>> +}
> > >>> +
> > >>> +static void update_integer_value(int instance_id)
> > >>> +{
> > >>> +     bioscfg_drv.integer_data[instance_id].current_value =3D
> > >>> +             bioscfg_drv.integer_data[instance_id].new_value;
> > >>> +}
> > >>> +
> > >>> +attribute_s_property_show(display_name_language_code, integer);
> > >>> +static struct kobj_attribute integer_display_langcode =3D
> > >>> +     __ATTR_RO(display_name_language_code);
> > >>> +
> > >>> +attribute_s_property_show(display_name, integer);
> > >>> +static struct kobj_attribute integer_display_name =3D
> > >>> +     __ATTR_RO(display_name);
> > >>> +
> > >>> +attribute_property_store(current_value, integer);
> > >>> +static struct kobj_attribute integer_current_val =3D
> > >>> +     __ATTR_RW_MODE(current_value, 0600);
> > >>> +
> > >>> +attribute_n_property_show(lower_bound, integer);
> > >>> +static struct kobj_attribute integer_lower_bound =3D
> > >>> +     __ATTR_RO(lower_bound);
> > >>> +
> > >>> +attribute_n_property_show(upper_bound, integer);
> > >>> +static struct kobj_attribute integer_upper_bound =3D
> > >>> +     __ATTR_RO(upper_bound);
> > >>> +
> > >>> +attribute_n_property_show(scalar_increment, integer);
> > >>> +static struct kobj_attribute integer_scalar_increment =3D
> > >>> +     __ATTR_RO(scalar_increment);
> > >>> +
> > >>> +static ssize_t type_show(struct kobject *kobj, struct kobj_attribu=
te *attr,
> > >>> +                      char *buf)
> > >>> +{
> > >>> +     return sprintf(buf, "integer\n");
> > >>> +}
> > >>> +static struct kobj_attribute integer_type =3D
> > >>> +     __ATTR_RO(type);
> > >>> +
> > >>> +static struct attribute *integer_attrs[] =3D {
> > >>> +     &integer_display_langcode.attr,
> > >>> +     &integer_display_name.attr,
> > >>> +     &integer_current_val.attr,
> > >>> +     &integer_lower_bound.attr,
> > >>> +     &integer_upper_bound.attr,
> > >>> +     &integer_scalar_increment.attr,
> > >>> +     &integer_type.attr,
> > >>> +     NULL,
> > >>> +};
> > >>> +
> > >>> +static const struct attribute_group integer_attr_group =3D {
> > >>> +     .attrs =3D integer_attrs,
> > >>> +};
> > >>> +
> > >>> +int alloc_integer_data(void)
> > >>> +{
> > >>> +     int ret =3D 0;
> > >>> +
> > >>> +     bioscfg_drv.integer_instances_count =3D get_instance_count(HP=
_WMI_BIOS_INTEGER_GUID);
> > >>> +     bioscfg_drv.integer_data =3D kcalloc(bioscfg_drv.integer_inst=
ances_count,
> > >>> +                                     sizeof(struct integer_data), =
GFP_KERNEL);
> > >>> +     if (!bioscfg_drv.integer_data) {
> > >>> +             bioscfg_drv.integer_instances_count =3D 0;
> > >>> +             ret =3D -ENOMEM;
> > >>> +     }
> > >>> +     return ret;
> > >>> +}
> > >>> +
> > >>> +/*
> > >>> + * populate_int_data() -
> > >>> + * Populate all properties of an instance under integer attribute
> > >>> + *
> > >>> + * @elements: ACPI object with integer data
> > >>> + * @instance_id: The instance to enumerate
> > >>> + * @attr_name_kobj: The parent kernel object
> > >>> + */
> > >>> +int populate_integer_package_data(union acpi_object *elements, int=
 instance_id,
> > >>> +                     struct kobject *attr_name_kobj)
> > >>> +{
> > >>> +     char *str_value =3D NULL;
> > >>> +     int str_len;
> > >>> +     int ret =3D 0;
> > >>> +
> > >>> +     bioscfg_drv.integer_data[instance_id].type =3D HPWMI_INTEGER_=
TYPE;
> > >>> +     bioscfg_drv.integer_data[instance_id].attr_name_kobj =3D attr=
_name_kobj;
> > >>> +
> > >>> +     ret =3D convert_hexstr_to_str(&(elements[NAME].string.pointer=
),
> > >>> +                                    elements[NAME].string.length,
> > >>> +                                    &str_value, &str_len);
> > >>> +     if (ACPI_FAILURE(ret)) {
> > >>> +             kfree(str_value);
> > >>> +             return ret;
> > >>> +     }
> > >>> +
> > >>> +     strscpy(bioscfg_drv.integer_data[instance_id].attribute_name,
> > >>> +             str_value,
> > >>> +             sizeof(bioscfg_drv.integer_data[instance_id].attribut=
e_name));
> > >>> +     strscpy(bioscfg_drv.integer_data[instance_id].display_name,
> > >>> +             str_value,
> > >>> +             sizeof(bioscfg_drv.integer_data[instance_id].display_=
name));
> > >>> +     kfree(str_value);
> > >>> +     str_value =3D NULL;
> > >>> +
> > >>> +     populate_integer_elements_from_package(elements, instance_id,=
 HPWMI_INTEGER_TYPE);
> > >>> +     return sysfs_create_group(attr_name_kobj, &integer_attr_group=
);
> > >>> +}
> > >>> +
> > >>> +int populate_integer_elements_from_package(union acpi_object *elem=
ents,
> > >>> +                                        int instance_id,
> > >>> +                                        enum hp_wmi_data_type type=
)
> > >>> +{
> > >>> +     char *str_value =3D NULL;
> > >>> +     int value_len;
> > >>> +     int status =3D 0;
> > >>> +     u32 size =3D 0;
> > >>> +     u32 int_value;
> > >>> +     int elem =3D 0;
> > >>> +     int reqs;
> > >>> +     int eloc;
> > >>> +
> > >>> +     if (!elements)
> > >>> +             return -EINVAL;
> > >>> +
> > >>> +     strscpy(bioscfg_drv.integer_data[instance_id].display_name_la=
nguage_code,
> > >>> +             LANG_CODE_STR,
> > >>> +             sizeof(bioscfg_drv.integer_data[instance_id].display_=
name_language_code));
> > >>> +
> > >>> +     for (elem =3D 1, eloc =3D 1; elem < hp_wmi_elements_count[typ=
e]; elem++, eloc++) {
> > >>> +
> > >>> +             switch (elements[elem].type) {
> > >>> +             case ACPI_TYPE_STRING:
> > >>> +
> > >>> +                     if (elem !=3D PREREQUISITES) {
> > >>> +                             status =3D convert_hexstr_to_str(&ele=
ments[elem].string.pointer,
> > >>> +                                                            elemen=
ts[elem].string.length,
> > >>> +                                                            &str_v=
alue, &value_len);
> > >>> +
> > >>> +                             if (ACPI_FAILURE(status))
> > >>> +                                     continue;
> > >>> +                     }
> > >>> +                     break;
> > >>> +             case ACPI_TYPE_INTEGER:
> > >>> +                     int_value =3D (u32)elements[elem].integer.val=
ue;
> > >>> +                     break;
> > >>> +             default:
> > >>> +                     pr_warn("Unsupported object type [%d]\n", ele=
ments[elem].type);
> > >>> +                     continue;
> > >>> +             }
> > >>> +             /*
> > >>> +              * Stop if extra counter is greater than total number
> > >>> +              * of elements for integer type.
> > >>> +              */
> > >>> +             if (eloc =3D=3D hp_wmi_elements_count[type])
> > >>> +                     goto exit_integer_package;
> > >>> +
> > >>> +             /* Assign appropriate element value to corresponding =
field*/
> > >>> +             switch (eloc) {
> > >>> +             case VALUE:
> > >>> +                     status =3D kstrtoint(str_value, 10, &int_valu=
e);
> > >>> +                     if (status)
> > >>> +                             continue;
> > >>> +
> > >>> +                     bioscfg_drv.integer_data[instance_id].current=
_value =3D int_value;
> > >>> +                     break;
> > >>> +             case PATH:
> > >>> +                     strscpy(bioscfg_drv.integer_data[instance_id]=
.path, str_value,
> > >>> +                             sizeof(bioscfg_drv.integer_data[insta=
nce_id].path));
> > >>> +                     break;
> > >>> +             case IS_READONLY:
> > >>> +                     bioscfg_drv.integer_data[instance_id].is_read=
only =3D int_value;
> > >>> +                     break;
> > >>> +             case DISPLAY_IN_UI:
> > >>> +                     bioscfg_drv.integer_data[instance_id].display=
_in_ui =3D int_value;
> > >>> +                     break;
> > >>> +             case REQUIRES_PHYSICAL_PRESENCE:
> > >>> +                     bioscfg_drv.integer_data[instance_id].require=
s_physical_presence =3D int_value;
> > >>> +                     break;
> > >>> +             case SEQUENCE:
> > >>> +                     bioscfg_drv.integer_data[instance_id].sequenc=
e =3D int_value;
> > >>> +                     break;
> > >>> +             case PREREQUISITE_SIZE:
> > >>> +                     bioscfg_drv.integer_data[instance_id].prerequ=
isitesize =3D int_value;
> > >>> +
> > >>> +                     if (int_value > 20)
> > >>> +                             pr_warn("Prerequisites size value exc=
eeded the maximum number of elements supported or data may be malformed\n")=
;
> > >>> +                     /*
> > >>> +                      * prerequisites element is omitted when
> > >>> +                      * prerequisitesSize value is zero.
> > >>> +                      */
> > >>> +                     if (int_value =3D=3D 0)
> > >>> +                             eloc++;
> > >>> +                     break;
> > >>> +             case PREREQUISITES:
> > >>> +                     size =3D bioscfg_drv.integer_data[instance_id=
].prerequisitesize;
> > >>> +                     for (reqs =3D 0; reqs < size; reqs++) {
> > >>> +                             status =3D convert_hexstr_to_str(&ele=
ments[elem].string.pointer,
> > >>> +                                                            elemen=
ts[elem].string.length,
> > >>> +                                                            &str_v=
alue, &value_len);
> > >>> +
> > >>> +                             if (ACPI_FAILURE(status))
> > >>> +                                     continue;
> > >>> +
> > >>> +                             strlcat(bioscfg_drv.integer_data[inst=
ance_id].prerequisites,
> > >>> +                                     str_value,
> > >>> +                                     sizeof(bioscfg_drv.integer_da=
ta[instance_id].prerequisites));
> > >>> +                             if (reqs !=3D (size - 1))
> > >>> +                                     strlcat(bioscfg_drv.integer_d=
ata[instance_id].prerequisites, ";",
> > >>> +                                             sizeof(bioscfg_drv.in=
teger_data[instance_id].prerequisites));
> > >>> +
> > >>> +                             kfree(str_value);
> > >>> +                             str_value =3D NULL;
> > >>> +                     }
> > >>> +                     break;
> > >>> +
> > >>> +             case SECURITY_LEVEL:
> > >>> +                     bioscfg_drv.integer_data[instance_id].securit=
y_level =3D int_value;
> > >>> +                     break;
> > >>> +             case INT_LOWER_BOUND:
> > >>> +                     bioscfg_drv.integer_data[instance_id].lower_b=
ound =3D int_value;
> > >>> +                     break;
> > >>> +             case INT_UPPER_BOUND:
> > >>> +                     bioscfg_drv.integer_data[instance_id].upper_b=
ound =3D int_value;
> > >>> +                     break;
> > >>> +             case INT_SCALAR_INCREMENT:
> > >>> +                     bioscfg_drv.integer_data[instance_id].scalar_=
increment =3D int_value;
> > >>> +                     break;
> > >>> +
> > >>> +             default:
> > >>> +                     pr_warn("Invalid element: %d found in Integer=
 attribute or data may be malformed\n", elem);
> > >>> +                     break;
> > >>> +             }
> > >>> +             kfree(str_value);
> > >>> +             str_value =3D NULL;
> > >>> +     }
> > >>> +exit_integer_package:
> > >>> +     kfree(str_value);
> > >>> +     str_value =3D NULL;
> > >>> +     return 0;
> > >>> +}
> > >>> +
> > >>> +
> > >>> +/*
> > >>> + * populate_integer_buffer_data() -
> > >>> + * Populate all properties of an instance under integer attribute
> > >>> + *
> > >>> + * @integer_obj: ACPI object with integer data
> > >>> + * @instance_id: The instance to enumerate
> > >>> + * @attr_name_kobj: The parent kernel object
> > >>> + */
> > >>> +int populate_integer_buffer_data(union acpi_object *integer_obj, i=
nt instance_id,
> > >>> +                     struct kobject *attr_name_kobj)
> > >>> +{
> > >>> +     bioscfg_drv.integer_data[instance_id].type =3D HPWMI_INTEGER_=
TYPE;
> > >>> +     bioscfg_drv.integer_data[instance_id].attr_name_kobj =3D attr=
_name_kobj;
> > >>> +
> > >>> +     strscpy(bioscfg_drv.integer_data[instance_id].attribute_name,
> > >>> +             attr_name_kobj->name,
> > >>> +             sizeof(bioscfg_drv.integer_data[instance_id].attribut=
e_name));
> > >>> +
> > >>> +     strscpy(bioscfg_drv.integer_data[instance_id].display_name,
> > >>> +             attr_name_kobj->name,
> > >>> +             sizeof(bioscfg_drv.integer_data[instance_id].display_=
name));
> > >>> +
> > >>> +     /* Populate integer elements */
> > >>> +     populate_integer_elements_from_buffer(integer_obj, instance_i=
d, HPWMI_INTEGER_TYPE);
> > >>> +
> > >>> +     return sysfs_create_group(attr_name_kobj, &integer_attr_group=
);
> > >>> +}
> > >>> +
> > >>> +int populate_integer_elements_from_buffer(union acpi_object *integ=
er_obj,
> > >>> +                                       int instance_id, enum hp_wm=
i_data_type type)
> > >>> +{
> > >>> +     int status;
> > >>> +     char *str =3D NULL;
> > >>> +     int elem;
> > >>> +     int reqs;
> > >>> +     int integer;
> > >>> +     int size =3D 0;
> > >>> +     int ret;
> > >>> +
> > >>> +     elem =3D 0;
> > >>> +     strscpy(bioscfg_drv.integer_data[instance_id].display_name_la=
nguage_code,
> > >>> +             LANG_CODE_STR,
> > >>> +             sizeof(bioscfg_drv.integer_data[instance_id].display_=
name_language_code));
> > >>> +
> > >>> +     for (elem =3D 1; elem < 3; elem++) {
> > >>> +
> > >>> +             status =3D get_string_from_buffer((u16 **)&integer_ob=
j->buffer.pointer, &str);
> > >>> +             if (ACPI_FAILURE(status))
> > >>> +                     continue;
> > >>> +
> > >>> +             switch (elem) {
> > >>> +             case VALUE:
> > >>> +                     ret =3D kstrtoint(str, 10, &integer);
> > >>> +                     if (ret)
> > >>> +                             continue;
> > >>> +
> > >>> +                     bioscfg_drv.integer_data[instance_id].current=
_value =3D integer;
> > >>> +                     break;
> > >>> +             case PATH:
> > >>> +                     strscpy(bioscfg_drv.integer_data[instance_id]=
.path, str,
> > >>> +                             sizeof(bioscfg_drv.integer_data[insta=
nce_id].path));
> > >>> +                     break;
> > >>> +             default:
> > >>> +                     pr_warn("Invalid element: %d found in Integer=
 attribute or data may be malformed\n", elem);
> > >>> +                     break;
> > >>> +             }
> > >>> +             kfree(str);
> > >>> +             str =3D NULL;
> > >>> +     }
> > >>> +
> > >>> +     for (elem =3D 3; elem < hp_wmi_elements_count[type]; elem++) =
{
> > >>> +
> > >>> +             if (elem !=3D PREREQUISITES)
> > >>> +                     status =3D get_integer_from_buffer((int **)&i=
nteger_obj->buffer.pointer, (int *)&integer);
> > >>> +
> > >>> +             if (ACPI_FAILURE(status))
> > >>> +                     continue;
> > >>> +
> > >>> +             switch (elem) {
> > >>> +
> > >>> +             case IS_READONLY:
> > >>> +                     bioscfg_drv.integer_data[instance_id].is_read=
only =3D integer;
> > >>> +                     break;
> > >>> +             case DISPLAY_IN_UI:
> > >>> +                     bioscfg_drv.integer_data[instance_id].display=
_in_ui =3D integer;
> > >>> +                     break;
> > >>> +             case REQUIRES_PHYSICAL_PRESENCE:
> > >>> +                     bioscfg_drv.integer_data[instance_id].require=
s_physical_presence =3D integer;
> > >>> +                     break;
> > >>> +             case SEQUENCE:
> > >>> +                     bioscfg_drv.integer_data[instance_id].sequenc=
e =3D integer;
> > >>> +                     break;
> > >>> +             case PREREQUISITE_SIZE:
> > >>> +                     bioscfg_drv.integer_data[instance_id].prerequ=
isitesize =3D integer;
> > >>> +                     size =3D integer;
> > >>> +                     if (size > 20)
> > >>> +                             pr_warn("Prerequisites size value exc=
eeded the maximum number of elements supported or data may be malformed\n")=
;
> > >>> +
> > >>> +                     break;
> > >>> +             case PREREQUISITES:
> > >>> +                     for (reqs =3D 0; reqs < size; reqs++) {
> > >>> +                             status =3D get_string_from_buffer((u1=
6 **)&integer_obj->buffer.pointer, &str);
> > >>> +                             if (ACPI_FAILURE(status))
> > >>> +                                     continue;
> > >>> +
> > >>> +                             strlcat(bioscfg_drv.integer_data[inst=
ance_id].prerequisites,
> > >>> +                                     str,
> > >>> +                                     sizeof(bioscfg_drv.integer_da=
ta[instance_id].prerequisites));
> > >>> +                             if (reqs !=3D (size - 1))
> > >>> +                                     strlcat(bioscfg_drv.integer_d=
ata[instance_id].prerequisites, ";",
> > >>> +                                             sizeof(bioscfg_drv.in=
teger_data[instance_id].prerequisites));
> > >>> +
> > >>> +                             kfree(str);
> > >>> +                             str =3D NULL;
> > >>> +                     }
> > >>> +                     break;
> > >>> +
> > >>> +             case SECURITY_LEVEL:
> > >>> +                     bioscfg_drv.integer_data[instance_id].securit=
y_level =3D integer;
> > >>> +                     break;
> > >>> +             case INT_LOWER_BOUND:
> > >>> +                     bioscfg_drv.integer_data[instance_id].lower_b=
ound =3D integer;
> > >>> +                     break;
> > >>> +             case INT_UPPER_BOUND:
> > >>> +                     bioscfg_drv.integer_data[instance_id].upper_b=
ound =3D integer;
> > >>> +                     break;
> > >>> +             case INT_SCALAR_INCREMENT:
> > >>> +                     bioscfg_drv.integer_data[instance_id].scalar_=
increment =3D integer;
> > >>> +                     break;
> > >>> +
> > >>> +             default:
> > >>> +                     pr_warn("Invalid element: %d found in Integer=
 attribute or data may be malformed\n", elem);
> > >>> +                     break;
> > >>> +             }
> > >>> +             kfree(str);
> > >>> +             str =3D NULL;
> > >>> +     }
> > >>> +     return 0;
> > >>> +}
> > >>> +
> > >>> +/*
> > >>> + * exit_integer_attributes() - Clear all attribute data
> > >>> + *
> > >>> + * Clears all data allocated for this group of attributes
> > >>> + */
> > >>> +void exit_integer_attributes(void)
> > >>> +{
> > >>> +     int instance_id;
> > >>> +
> > >>> +     for (instance_id =3D 0; instance_id < bioscfg_drv.integer_ins=
tances_count; instance_id++) {
> > >>> +             if (bioscfg_drv.integer_data[instance_id].attr_name_k=
obj)
> > >>> +                     sysfs_remove_group(bioscfg_drv.integer_data[i=
nstance_id].attr_name_kobj,
> > >>> +                                                             &inte=
ger_attr_group);
> > >>> +     }
> > >>> +     bioscfg_drv.integer_instances_count =3D 0;
> > >>> +
> > >>> +     kfree(bioscfg_drv.integer_data);
> > >>> +     bioscfg_drv.integer_data =3D NULL;
> > >>> +}
> > >>> diff --git a/drivers/platform/x86/hp/ordered-attributes.c b/drivers=
/platform/x86/hp/ordered-attributes.c
> > >>> new file mode 100644
> > >>> index 000000000000..a66d7f0b34d2
> > >>> --- /dev/null
> > >>> +++ b/drivers/platform/x86/hp/ordered-attributes.c
> > >>> @@ -0,0 +1,568 @@
> > >>> +// SPDX-License-Identifier: GPL-2.0
> > >>> +/*
> > >>> + * Functions corresponding to ordered list type attributes under
> > >>> + * BIOS ORDERED LIST GUID for use with hp-bioscfg driver.
> > >>> + *
> > >>> + *  Copyright (c) 2022 HP Development Company, L.P.
> > >>> + */
> > >>> +
> > >>> +#include "bioscfg.h"
> > >>> +
> > >>> +get_instance_id(ordered_list);
> > >>> +
> > >>> +static ssize_t current_value_show(struct kobject *kobj, struct kob=
j_attribute *attr, char *buf)
> > >>> +{
> > >>> +     int instance_id =3D get_ordered_list_instance_id(kobj);
> > >>> +     union acpi_object *obj =3D NULL;
> > >>> +     ssize_t ret;
> > >>> +
> > >>> +     if (instance_id < 0)
> > >>> +             return -EIO;
> > >>> +
> > >>> +     /* need to use specific instance_id and guid combination to g=
et right data */
> > >>> +     obj =3D get_wmiobj_pointer(instance_id, HP_WMI_BIOS_ORDERED_L=
IST_GUID);
> > >>> +     if (!obj)
> > >>> +             return -EIO;
> > >>> +
> > >>> +     ret =3D snprintf(buf, PAGE_SIZE, "%s\n",
> > >>> +                    bioscfg_drv.ordered_list_data[instance_id].cur=
rent_value);
> > >>> +
> > >>> +     kfree(obj);
> > >>> +     return ret;
> > >>> +}
> > >>> +
> > >>> +/*
> > >>> + * validate_ordered_list_value -
> > >>> + * Validate input of current_value against possible values
> > >>> + *
> > >>> + * @instance_id: The instance on which input is validated
> > >>> + * @buf: Input value
> > >>> + */
> > >>> +static int validate_ordered_list_values(int instance_id, const cha=
r *buf)
> > >>> +{
> > >>> +     char *options =3D NULL;
> > >>> +     char *p;
> > >>> +     int ret =3D 0;
> > >>> +     int found =3D 0;
> > >>> +     char *new_values =3D NULL;
> > >>> +     char *value;
> > >>> +     int elem;
> > >>> +     int elem_found =3D 0;
> > >>> +
> > >>> +     options =3D kstrdup(bioscfg_drv.ordered_list_data[instance_id=
].elements,
> > >>> +                              GFP_KERNEL);
> > >>> +     new_values =3D kstrdup(buf, GFP_KERNEL);
> > >>> +
> > >>> +     if (!options || !new_values) {
> > >>> +             ret =3D -ENOMEM;
> > >>> +             goto validate_ordered_list_value_exit;
> > >>> +     }
> > >>> +
> > >>> +     /* Is it a read only attribute */
> > >>> +     if (bioscfg_drv.ordered_list_data[instance_id].is_readonly) {
> > >>> +             ret =3D -EIO;
> > >>> +             goto validate_ordered_list_value_exit;
> > >>> +     }
> > >>> +
> > >>> +     /*
> > >>> +      * Changes to ordered list values require checking that new
> > >>> +      * values are found in the list of elements.
> > >>> +      */
> > >>> +     for (elem =3D 0; elem < bioscfg_drv.ordered_list_data[instanc=
e_id].size; elem++) {
> > >>> +
> > >>> +             value =3D strsep(&new_values, ",");
> > >>> +             if (value !=3D NULL) {
> > >>> +                     if (!*value)
> > >>> +                             continue;
> > >>> +                     elem_found++;
> > >>> +             }
> > >>> +
> > >>> +             while ((p =3D strsep(&options, ";")) !=3D NULL) {
> > >>> +                     if (!*p)
> > >>> +                             continue;
> > >>> +
> > >>> +                     if (!strcasecmp(p, value)) {
> > >>> +                             found =3D 1;
> > >>> +                             break;
> > >>> +                     }
> > >>> +             }
> > >>> +
> > >>> +             if (!found) {
> > >>> +                     pr_warn("\"%s\" is not a valid ordered list e=
lement\n", value);
> > >>> +                     ret =3D -EINVAL;
> > >>> +                     goto validate_ordered_list_value_exit;
> > >>> +             }
> > >>> +     }
> > >>> +
> > >>> +     if (elem_found =3D=3D bioscfg_drv.ordered_list_data[instance_=
id].size) {
> > >>> +             pr_warn("Number of new values is not equal to number =
of ordered list elements (%d)\n",
> > >>> +                     bioscfg_drv.ordered_list_data[instance_id].si=
ze);
> > >>> +             ret =3D -EINVAL;
> > >>> +             goto validate_ordered_list_value_exit;
> > >>> +     }
> > >>> +
> > >>> +validate_ordered_list_value_exit:
> > >>> +     kfree(options);
> > >>> +     kfree(new_values);
> > >>> +     return ret;
> > >>> +}
> > >>> +
> > >>> +/*
> > >>> + * validate_ordered_input() -
> > >>> + * Validate input of current_value against possible values
> > >>> + *
> > >>> + * @instance_id: The instance on which input is validated
> > >>> + * @buf: Input value
> > >>> + */
> > >>> +static int validate_ordered_list_input(int instance_id, const char=
 *buf)
> > >>> +{
> > >>> +     int ret =3D 0;
> > >>> +
> > >>> +     ret =3D validate_ordered_list_values(instance_id, buf);
> > >>> +     if (ret < 0) {
> > >>> +             ret =3D -EINVAL;
> > >>> +             goto validate_ordered_list_exit;
> > >>> +     }
> > >>> +
> > >>> +     strscpy(bioscfg_drv.ordered_list_data[instance_id].new_value,
> > >>> +             buf,
> > >>> +             sizeof(bioscfg_drv.ordered_list_data[instance_id].new=
_value));
> > >>> +
> > >>> +validate_ordered_list_exit:
> > >>> +     return ret;
> > >>> +}
> > >>> +
> > >>> +static void update_ordered_list_value(int instance_id)
> > >>> +{
> > >>> +     strscpy(bioscfg_drv.ordered_list_data[instance_id].current_va=
lue,
> > >>> +             bioscfg_drv.ordered_list_data[instance_id].new_value,
> > >>> +             sizeof(bioscfg_drv.ordered_list_data[instance_id].cur=
rent_value));
> > >>> +}
> > >>> +
> > >>> +attribute_s_property_show(display_name_language_code, ordered_list=
);
> > >>> +static struct kobj_attribute ordered_list_display_langcode =3D
> > >>> +             __ATTR_RO(display_name_language_code);
> > >>> +
> > >>> +attribute_s_property_show(display_name, ordered_list);
> > >>> +static struct kobj_attribute ordered_list_display_name =3D
> > >>> +             __ATTR_RO(display_name);
> > >>> +
> > >>> +attribute_property_store(current_value, ordered_list);
> > >>> +static struct kobj_attribute ordered_list_current_val =3D
> > >>> +             __ATTR_RW_MODE(current_value, 0600);
> > >>> +
> > >>> +attribute_s_property_show(elements, ordered_list);
> > >>> +static struct kobj_attribute ordered_list_elements_val =3D
> > >>> +             __ATTR_RO(elements);
> > >>> +
> > >>> +attribute_n_property_show(size, ordered_list);
> > >>> +static struct kobj_attribute ordered_list_size_val =3D
> > >>> +             __ATTR_RO(size);
> > >>> +
> > >>> +static ssize_t type_show(struct kobject *kobj, struct kobj_attribu=
te *attr,
> > >>> +                      char *buf)
> > >>> +{
> > >>> +     return sprintf(buf, "ordered-list\n");
> > >>> +}
> > >>> +static struct kobj_attribute ordered_list_type =3D
> > >>> +             __ATTR_RO(type);
> > >>> +
> > >>> +static struct attribute *ordered_list_attrs[] =3D {
> > >>> +     &ordered_list_display_langcode.attr,
> > >>> +     &ordered_list_display_name.attr,
> > >>> +     &ordered_list_current_val.attr,
> > >>> +     &ordered_list_elements_val.attr,
> > >>> +     &ordered_list_size_val.attr,
> > >>> +     &ordered_list_type.attr,
> > >>> +     NULL,
> > >>> +};
> > >>> +
> > >>> +static const struct attribute_group ordered_list_attr_group =3D {
> > >>> +     .attrs =3D ordered_list_attrs,
> > >>> +};
> > >>> +
> > >>> +int alloc_ordered_list_data(void)
> > >>> +{
> > >>> +     int ret =3D 0;
> > >>> +
> > >>> +     bioscfg_drv.ordered_list_instances_count =3D
> > >>> +             get_instance_count(HP_WMI_BIOS_ORDERED_LIST_GUID);
> > >>> +     bioscfg_drv.ordered_list_data =3D kcalloc(bioscfg_drv.ordered=
_list_instances_count,
> > >>> +                                     sizeof(struct ordered_list_da=
ta), GFP_KERNEL);
> > >>> +     if (!bioscfg_drv.ordered_list_data) {
> > >>> +             bioscfg_drv.ordered_list_instances_count =3D 0;
> > >>> +             ret =3D -ENOMEM;
> > >>> +     }
> > >>> +     return ret;
> > >>> +}
> > >>> +
> > >>> +/*
> > >>> + * populate_ordered_list_package_data() -
> > >>> + * Populate all properties of an instance under ordered_list attri=
bute
> > >>> + *
> > >>> + * @order_obj: ACPI object with ordered_list data
> > >>> + * @instance_id: The instance to enumerate
> > >>> + * @attr_name_kobj: The parent kernel object
> > >>> + */
> > >>> +int populate_ordered_list_package_data(union acpi_object *order_ob=
j, int instance_id,
> > >>> +                     struct kobject *attr_name_kobj)
> > >>> +{
> > >>> +     char *str_value =3D NULL;
> > >>> +     int str_len;
> > >>> +     int ret =3D 0;
> > >>> +
> > >>> +     bioscfg_drv.ordered_list_data[instance_id].type =3D HPWMI_ORD=
ERED_LIST_TYPE;
> > >>> +     bioscfg_drv.ordered_list_data[instance_id].attr_name_kobj =3D=
 attr_name_kobj;
> > >>> +     ret =3D convert_hexstr_to_str(&(order_obj[NAME].string.pointe=
r),
> > >>> +                                    order_obj[NAME].string.length,
> > >>> +                                    &str_value, &str_len);
> > >>> +
> > >>> +     if (ACPI_FAILURE(ret)) {
> > >>> +             kfree(str_value);
> > >>> +             return ret;
> > >>> +     }
> > >>> +
> > >>> +     strscpy(bioscfg_drv.ordered_list_data[instance_id].attribute_=
name,
> > >>> +             str_value,
> > >>> +             sizeof(bioscfg_drv.ordered_list_data[instance_id].att=
ribute_name));
> > >>> +     strscpy(bioscfg_drv.ordered_list_data[instance_id].display_na=
me,
> > >>> +             str_value,
> > >>> +             sizeof(bioscfg_drv.ordered_list_data[instance_id].dis=
play_name));
> > >>> +
> > >>> +     kfree(str_value);
> > >>> +     str_value =3D NULL;
> > >>> +
> > >>> +     populate_ordered_list_elements_from_package(order_obj, instan=
ce_id, HPWMI_ORDERED_LIST_TYPE);
> > >>> +     return sysfs_create_group(attr_name_kobj, &ordered_list_attr_=
group);
> > >>> +}
> > >>> +
> > >>> +int populate_ordered_list_elements_from_package(union acpi_object =
*order_obj,
> > >>> +                                        int instance_id,
> > >>> +                                        enum hp_wmi_data_type type=
)
> > >>> +{
> > >>> +     char *str_value =3D NULL;
> > >>> +     int value_len;
> > >>> +     int status =3D 0;
> > >>> +     u32 size =3D 0;
> > >>> +     u32 int_value;
> > >>> +     int elem =3D 0;
> > >>> +     int reqs;
> > >>> +     int eloc;
> > >>> +     char *tmpstr =3D NULL;
> > >>> +     char *part_tmp =3D NULL;
> > >>> +     int tmp_len =3D 0;
> > >>> +     char *part =3D NULL;
> > >>> +
> > >>> +     strscpy(bioscfg_drv.ordered_list_data[instance_id].display_na=
me_language_code,
> > >>> +             LANG_CODE_STR,
> > >>> +             sizeof(bioscfg_drv.ordered_list_data[instance_id].dis=
play_name_language_code));
> > >>> +
> > >>> +     for (elem =3D 1, eloc =3D 1; elem < hp_wmi_elements_count[typ=
e]; elem++, eloc++) {
> > >>> +
> > >>> +             switch (order_obj[elem].type) {
> > >>> +             case ACPI_TYPE_STRING:
> > >>> +
> > >>> +                     if (elem !=3D PREREQUISITES) {
> > >>> +                             status =3D convert_hexstr_to_str(&ord=
er_obj[elem].string.pointer,
> > >>> +                                                            order_=
obj[elem].string.length,
> > >>> +                                                            &str_v=
alue, &value_len);
> > >>> +                             if (ACPI_FAILURE(status))
> > >>> +                                     continue;
> > >>> +
> > >>> +                     }
> > >>> +                     break;
> > >>> +             case ACPI_TYPE_INTEGER:
> > >>> +                     int_value =3D (u32)order_obj[elem].integer.va=
lue;
> > >>> +                     break;
> > >>> +             default:
> > >>> +                     pr_warn("Unsupported object type [%d]\n", ord=
er_obj[elem].type);
> > >>> +                     continue;
> > >>> +             }
> > >>> +
> > >>> +             /*
> > >>> +              * Stop if extra counter is greater than total number
> > >>> +              * of elements for ordered list type
> > >>> +              */
> > >>> +             if (eloc =3D=3D hp_wmi_elements_count[type])
> > >>> +                     goto exit_ordered_list_package;
> > >>> +
> > >>> +
> > >>> +             /* Assign appropriate element value to corresponding =
field*/
> > >>> +             switch (eloc) {
> > >>> +             case VALUE:
> > >>> +                     strscpy(bioscfg_drv.ordered_list_data[instanc=
e_id].current_value,
> > >>> +                             str_value, sizeof(bioscfg_drv.ordered=
_list_data[instance_id].current_value));
> > >>> +                     break;
> > >>> +             case PATH:
> > >>> +                     strscpy(bioscfg_drv.ordered_list_data[instanc=
e_id].path, str_value,
> > >>> +                             sizeof(bioscfg_drv.ordered_list_data[=
instance_id].path));
> > >>> +                     break;
> > >>> +             case IS_READONLY:
> > >>> +                     bioscfg_drv.ordered_list_data[instance_id].is=
_readonly =3D int_value;
> > >>> +                     break;
> > >>> +             case DISPLAY_IN_UI:
> > >>> +                     bioscfg_drv.ordered_list_data[instance_id].di=
splay_in_ui =3D int_value;
> > >>> +                     break;
> > >>> +             case REQUIRES_PHYSICAL_PRESENCE:
> > >>> +                     bioscfg_drv.ordered_list_data[instance_id].re=
quires_physical_presence =3D int_value;
> > >>> +                     break;
> > >>> +             case SEQUENCE:
> > >>> +                     bioscfg_drv.ordered_list_data[instance_id].se=
quence =3D int_value;
> > >>> +                     break;
> > >>> +             case PREREQUISITE_SIZE:
> > >>> +                     bioscfg_drv.ordered_list_data[instance_id].pr=
erequisitesize =3D int_value;
> > >>> +                     if (int_value > 20)
> > >>> +                             pr_warn("Prerequisites size value exc=
eeded the maximum number of elements supported or data may be malformed\n")=
;
> > >>> +                     /*
> > >>> +                      * prerequisites element is omitted when
> > >>> +                      * prerequisitesSize value is zero.
> > >>> +                      */
> > >>> +                     if (int_value =3D=3D 0)
> > >>> +                             eloc++;
> > >>> +                     break;
> > >>> +             case PREREQUISITES:
> > >>> +                     size =3D bioscfg_drv.ordered_list_data[instan=
ce_id].prerequisitesize;
> > >>> +                     for (reqs =3D 0; reqs < size; reqs++) {
> > >>> +                             status =3D convert_hexstr_to_str(&ord=
er_obj[elem].string.pointer,
> > >>> +                                                            order_=
obj[elem].string.length,
> > >>> +                                                            &str_v=
alue, &value_len);
> > >>> +
> > >>> +                             if (ACPI_FAILURE(status))
> > >>> +                                     continue;
> > >>> +
> > >>> +                             strlcat(bioscfg_drv.ordered_list_data=
[instance_id].prerequisites,
> > >>> +                                     str_value,
> > >>> +                                     sizeof(bioscfg_drv.ordered_li=
st_data[instance_id].prerequisites));
> > >>> +
> > >>> +                             if (reqs !=3D (size - 1))
> > >>> +                                     strlcat(bioscfg_drv.ordered_l=
ist_data[instance_id].prerequisites, ";",
> > >>> +                                             sizeof(bioscfg_drv.or=
dered_list_data[instance_id].prerequisites));
> > >>> +
> > >>> +                             kfree(str_value);
> > >>> +                             str_value =3D NULL;
> > >>> +                     }
> > >>> +                     break;
> > >>> +
> > >>> +             case SECURITY_LEVEL:
> > >>> +                     bioscfg_drv.ordered_list_data[instance_id].se=
curity_level =3D int_value;
> > >>> +                     break;
> > >>> +
> > >>> +             case ORD_LIST_SIZE:
> > >>> +                     bioscfg_drv.ordered_list_data[instance_id].si=
ze =3D int_value;
> > >>> +                     break;
> > >>> +             case ORD_LIST_ELEMENTS:
> > >>> +                     size =3D bioscfg_drv.ordered_list_data[instan=
ce_id].size;
> > >>> +
> > >>> +                     /*
> > >>> +                      * Ordered list data is stored in hex and com=
ma separated format
> > >>> +                      * Convert the data and split it to show each=
 element
> > >>> +                      */
> > >>> +                     status =3D convert_hexstr_to_str(&str_value, =
value_len, &tmpstr, &tmp_len);
> > >>> +                     if (ACPI_FAILURE(status))
> > >>> +                             goto exit_ordered_list_package;
> > >>> +
> > >>> +                     part_tmp =3D tmpstr;
> > >>> +                     part =3D strsep(&part_tmp, ",");
> > >>> +                     if (!part)
> > >>> +                             strscpy(bioscfg_drv.ordered_list_data=
[instance_id].elements,
> > >>> +                                     tmpstr, sizeof(bioscfg_drv.or=
dered_list_data[instance_id].elements));
> > >>> +
> > >>> +                     while (part) {
> > >>> +                             strlcat(bioscfg_drv.ordered_list_data=
[instance_id].elements,
> > >>> +                                     part, sizeof(bioscfg_drv.orde=
red_list_data[instance_id].elements));
> > >>> +
> > >>> +                             part =3D strsep(&part_tmp, ",");
> > >>> +                             if (part)
> > >>> +                                     strlcat(bioscfg_drv.ordered_l=
ist_data[instance_id].elements, ";",
> > >>> +                                             sizeof(bioscfg_drv.or=
dered_list_data[instance_id].elements));
> > >>> +                     }
> > >>> +                     break;
> > >>> +             default:
> > >>> +                     pr_warn("Invalid element: %d found in Ordered=
_List attribute or data may be malformed\n", elem);
> > >>> +                     break;
> > >>> +             }
> > >>> +             kfree(tmpstr);
> > >>> +             tmpstr =3D NULL;
> > >>> +             kfree(str_value);
> > >>> +             str_value =3D NULL;
> > >>> +     }
> > >>> +
> > >>> +exit_ordered_list_package:
> > >>> +     kfree(tmpstr);
> > >>> +     tmpstr =3D NULL;
> > >>> +     kfree(str_value);
> > >>> +     str_value =3D NULL;
> > >>> +     return 0;
> > >>> +}
> > >>> +
> > >>> +/*
> > >>> + * populate_ordered_list_data() - Populate all properties of an
> > >>> + * instance under ordered list attribute
> > >>> + *
> > >>> + * @order_obj: ACPI object with enumeration data
> > >>> + * @instance_id: The instance to enumerate
> > >>> + * @attr_name_kobj: The parent kernel object
> > >>> + * @enum_property_count: Total properties count under ordered list=
 type
> > >>> + */
> > >>> +int populate_ordered_list_buffer_data(union acpi_object *order_obj=
, int instance_id,
> > >>> +                     struct kobject *attr_name_kobj)
> > >>> +{
> > >>> +
> > >>> +     bioscfg_drv.ordered_list_data[instance_id].type =3D HPWMI_ORD=
ERED_LIST_TYPE;
> > >>> +     bioscfg_drv.ordered_list_data[instance_id].attr_name_kobj =3D=
 attr_name_kobj;
> > >>> +
> > >>> +     strscpy(bioscfg_drv.ordered_list_data[instance_id].attribute_=
name,
> > >>> +             attr_name_kobj->name,
> > >>> +             sizeof(bioscfg_drv.ordered_list_data[instance_id].att=
ribute_name));
> > >>> +     strscpy(bioscfg_drv.ordered_list_data[instance_id].display_na=
me,
> > >>> +             attr_name_kobj->name,
> > >>> +             sizeof(bioscfg_drv.ordered_list_data[instance_id].dis=
play_name));
> > >>> +
> > >>> +     /* Populate ordered list elements */
> > >>> +     populate_ordered_list_elements_from_buffer(order_obj, instanc=
e_id, HPWMI_ORDERED_LIST_TYPE);
> > >>> +
> > >>> +     return sysfs_create_group(attr_name_kobj, &ordered_list_attr_=
group);
> > >>> +}
> > >>> +
> > >>> +int populate_ordered_list_elements_from_buffer(union acpi_object *=
order_obj,
> > >>> +                                            int instance_id, enum =
hp_wmi_data_type type)
> > >>> +{
> > >>> +     int status;
> > >>> +     char *str =3D NULL;
> > >>> +     int elem;
> > >>> +     int reqs;
> > >>> +     int integer;
> > >>> +     int size =3D 0;
> > >>> +     int values;
> > >>> +
> > >>> +     elem =3D 0;
> > >>> +     strscpy(bioscfg_drv.ordered_list_data[instance_id].display_na=
me_language_code,
> > >>> +             LANG_CODE_STR,
> > >>> +             sizeof(bioscfg_drv.ordered_list_data[instance_id].dis=
play_name_language_code));
> > >>> +
> > >>> +     for (elem =3D 1; elem < 3; elem++) {
> > >>> +
> > >>> +             status =3D get_string_from_buffer((u16 **)&order_obj-=
>buffer.pointer, &str);
> > >>> +             if (ACPI_FAILURE(status))
> > >>> +                     continue;
> > >>> +
> > >>> +             switch (elem) {
> > >>> +             case VALUE:
> > >>> +                     strscpy(bioscfg_drv.ordered_list_data[instanc=
e_id].current_value,
> > >>> +                             str, sizeof(bioscfg_drv.ordered_list_=
data[instance_id].current_value));
> > >>> +                     break;
> > >>> +             case PATH:
> > >>> +                     strscpy(bioscfg_drv.ordered_list_data[instanc=
e_id].path, str,
> > >>> +                             sizeof(bioscfg_drv.ordered_list_data[=
instance_id].path));
> > >>> +                     break;
> > >>> +             default:
> > >>> +                     pr_warn("Invalid element: %d found in Ordered=
 list attribute or data may be malformed\n", elem);
> > >>> +                     break;
> > >>> +             }
> > >>> +             kfree(str);
> > >>> +             str =3D NULL;
> > >>> +     }
> > >>> +     for (elem =3D 3; elem < hp_wmi_elements_count[type]; elem++) =
{
> > >>> +
> > >>> +             if (elem !=3D PREREQUISITES && elem !=3D ORD_LIST_ELE=
MENTS)
> > >>> +                     status =3D get_integer_from_buffer((int **)&o=
rder_obj->buffer.pointer, (int *)&integer);
> > >>> +
> > >>> +             if (ACPI_FAILURE(status))
> > >>> +                     continue;
> > >>> +
> > >>> +             switch (elem) {
> > >>> +
> > >>> +             case IS_READONLY:
> > >>> +                     bioscfg_drv.ordered_list_data[instance_id].is=
_readonly =3D integer;
> > >>> +                     break;
> > >>> +             case DISPLAY_IN_UI:
> > >>> +                     bioscfg_drv.ordered_list_data[instance_id].di=
splay_in_ui =3D integer;
> > >>> +                     break;
> > >>> +             case REQUIRES_PHYSICAL_PRESENCE:
> > >>> +                     bioscfg_drv.ordered_list_data[instance_id].re=
quires_physical_presence =3D integer;
> > >>> +                     break;
> > >>> +             case SEQUENCE:
> > >>> +                     bioscfg_drv.ordered_list_data[instance_id].se=
quence =3D integer;
> > >>> +                     break;
> > >>> +             case PREREQUISITE_SIZE:
> > >>> +                     bioscfg_drv.ordered_list_data[instance_id].pr=
erequisitesize =3D integer;
> > >>> +                     if (integer > 20)
> > >>> +                             pr_warn("Prerequisites size value exc=
eeded the maximum number of elements supported or data may be malformed\n")=
;
> > >>> +                     break;
> > >>> +             case PREREQUISITES:
> > >>> +                     size =3D bioscfg_drv.ordered_list_data[instan=
ce_id].prerequisitesize;
> > >>> +                     for (reqs =3D 0; reqs < size; reqs++) {
> > >>> +                             status =3D get_string_from_buffer((u1=
6 **)&order_obj->buffer.pointer, &str);
> > >>> +                             if (ACPI_FAILURE(status))
> > >>> +                                     continue;
> > >>> +
> > >>> +                             strlcat(bioscfg_drv.ordered_list_data=
[instance_id].prerequisites,
> > >>> +                                     str,
> > >>> +                                     sizeof(bioscfg_drv.ordered_li=
st_data[instance_id].prerequisites));
> > >>> +
> > >>> +                             if (reqs !=3D (size - 1))
> > >>> +                                     strlcat(bioscfg_drv.ordered_l=
ist_data[instance_id].prerequisites, ";",
> > >>> +                                             sizeof(bioscfg_drv.or=
dered_list_data[instance_id].prerequisites));
> > >>> +
> > >>> +                             kfree(str);
> > >>> +                             str =3D NULL;
> > >>> +                     }
> > >>> +                     break;
> > >>> +             case SECURITY_LEVEL:
> > >>> +                     bioscfg_drv.ordered_list_data[instance_id].se=
curity_level =3D integer;
> > >>> +                     break;
> > >>> +             case ORD_LIST_SIZE:
> > >>> +                     bioscfg_drv.ordered_list_data[instance_id].si=
ze =3D integer;
> > >>> +                     break;
> > >>> +             case ORD_LIST_ELEMENTS:
> > >>> +                     size =3D bioscfg_drv.ordered_list_data[instan=
ce_id].size;
> > >>> +                     for (values =3D 0; values < size; values++) {
> > >>> +                             status =3D get_string_from_buffer((u1=
6 **)&order_obj->buffer.pointer, &str);
> > >>> +                             if (ACPI_FAILURE(status))
> > >>> +                                     continue;
> > >>> +
> > >>> +                             strlcat(bioscfg_drv.ordered_list_data=
[instance_id].elements,
> > >>> +                                     str,
> > >>> +                                     sizeof(bioscfg_drv.ordered_li=
st_data[instance_id].elements));
> > >>> +
> > >>> +                             if (values !=3D (size - 1))
> > >>> +                                     strlcat(bioscfg_drv.ordered_l=
ist_data[instance_id].elements, ";",
> > >>> +                                             sizeof(bioscfg_drv.or=
dered_list_data[instance_id].elements));
> > >>> +
> > >>> +                             kfree(str);
> > >>> +                             str =3D NULL;
> > >>> +                     }
> > >>> +                     break;
> > >>> +             default:
> > >>> +                     pr_warn("Invalid element: %d found in Ordered=
 list attribute or data may be malformed\n", elem);
> > >>> +                     break;
> > >>> +             }
> > >>> +             kfree(str);
> > >>> +             str =3D NULL;
> > >>> +     }
> > >>> +     kfree(str);
> > >>> +     str =3D NULL;
> > >>> +
> > >>> +     return 0;
> > >>> +}
> > >>> +
> > >>> +
> > >>> +/*
> > >>> + * exit_ordered_list_attributes() - Clear all attribute data
> > >>> + *
> > >>> + * Clears all data allocated for this group of attributes
> > >>> + */
> > >>> +void exit_ordered_list_attributes(void)
> > >>> +{
> > >>> +     int instance_id;
> > >>> +
> > >>> +     for (instance_id =3D 0; instance_id < bioscfg_drv.ordered_lis=
t_instances_count; instance_id++) {
> > >>> +             if (bioscfg_drv.ordered_list_data[instance_id].attr_n=
ame_kobj)
> > >>> +                     sysfs_remove_group(bioscfg_drv.ordered_list_d=
ata[instance_id].attr_name_kobj,
> > >>> +                                                             &orde=
red_list_attr_group);
> > >>> +     }
> > >>> +     bioscfg_drv.ordered_list_instances_count =3D 0;
> > >>> +
> > >>> +     kfree(bioscfg_drv.ordered_list_data);
> > >>> +     bioscfg_drv.ordered_list_data =3D NULL;
> > >>> +}
> > >>> diff --git a/drivers/platform/x86/hp/passwdattr-interface.c b/drive=
rs/platform/x86/hp/passwdattr-interface.c
> > >>> new file mode 100644
> > >>> index 000000000000..ecba2994563c
> > >>> --- /dev/null
> > >>> +++ b/drivers/platform/x86/hp/passwdattr-interface.c
> > >>> @@ -0,0 +1,50 @@
> > >>> +// SPDX-License-Identifier: GPL-2.0
> > >>> +/*
> > >>> + * Functions corresponding to SET password methods under
> > >>> + * HP_WMI_SET_BIOS_SETTING_GUID for use with hp-bioscfg driver.
> > >>> + *
> > >>> + * Copyright (c) 2022 Hewlett-Packard Inc.
> > >>> + */
> > >>> +
> > >>> +#include <linux/wmi.h>
> > >>> +#include "bioscfg.h"
> > >>> +
> > >>> +static int bios_attr_pass_interface_probe(struct wmi_device *wdev,=
 const void *context)
> > >>> +{
> > >>> +     mutex_lock(&bioscfg_drv.mutex);
> > >>> +     bioscfg_drv.password_attr_wdev =3D wdev;
> > >>> +     mutex_unlock(&bioscfg_drv.mutex);
> > >>> +     return 0;
> > >>> +}
> > >>> +
> > >>> +static void bios_attr_pass_interface_remove(struct wmi_device *wde=
v)
> > >>> +{
> > >>> +     mutex_lock(&bioscfg_drv.mutex);
> > >>> +     bioscfg_drv.password_attr_wdev =3D NULL;
> > >>> +     mutex_unlock(&bioscfg_drv.mutex);
> > >>> +}
> > >>> +
> > >>> +static const struct wmi_device_id bios_attr_pass_interface_id_tabl=
e[] =3D {
> > >>> +     { .guid_string =3D HP_WMI_SET_BIOS_SETTING_GUID },
> > >>> +     { },
> > >>> +};
> > >>> +static struct wmi_driver bios_attr_pass_interface_driver =3D {
> > >>> +     .driver =3D {
> > >>> +             .name =3D DRIVER_NAME"-password"
> > >>> +     },
> > >>> +     .probe =3D bios_attr_pass_interface_probe,
> > >>> +     .remove =3D bios_attr_pass_interface_remove,
> > >>> +     .id_table =3D bios_attr_pass_interface_id_table,
> > >>> +};
> > >>> +
> > >>> +int init_bios_attr_pass_interface(void)
> > >>> +{
> > >>> +     return wmi_driver_register(&bios_attr_pass_interface_driver);
> > >>> +}
> > >>> +
> > >>> +void exit_bios_attr_pass_interface(void)
> > >>> +{
> > >>> +     wmi_driver_unregister(&bios_attr_pass_interface_driver);
> > >>> +}
> > >>> +
> > >>> +MODULE_DEVICE_TABLE(wmi, bios_attr_pass_interface_id_table);
> > >>> diff --git a/drivers/platform/x86/hp/passwdobj-attributes.c b/drive=
rs/platform/x86/hp/passwdobj-attributes.c
> > >>> new file mode 100644
> > >>> index 000000000000..75d2f2c1e0e3
> > >>> --- /dev/null
> > >>> +++ b/drivers/platform/x86/hp/passwdobj-attributes.c
> > >>> @@ -0,0 +1,640 @@
> > >>> +// SPDX-License-Identifier: GPL-2.0
> > >>> +/*
> > >>> + * Functions corresponding to password object type attributes unde=
r
> > >>> + * BIOS PASSWORD for use with hp-bioscfg driver.
> > >>> + *
> > >>> + *  Copyright (c) 2022 HP Development Company, L.P.
> > >>> + */
> > >>> +
> > >>> +#include "bioscfg.h"
> > >>> +#include <asm-generic/posix_types.h>
> > >>> +
> > >>> +get_instance_id(password);
> > >>> +
> > >>> +int clear_passwords(const int instance)
> > >>> +{
> > >>> +     if (!bioscfg_drv.password_data[instance].is_enabled)
> > >>> +             return 0;
> > >>> +
> > >>> +     memset(bioscfg_drv.password_data[instance].current_password,
> > >>> +            0, sizeof(bioscfg_drv.password_data[instance].current_=
password));
> > >>> +     memset(bioscfg_drv.password_data[instance].new_password,
> > >>> +            0, sizeof(bioscfg_drv.password_data[instance].new_pass=
word));
> > >>> +
> > >>> +     return 0;
> > >>> +}
> > >>> +
> > >>> +int clear_all_passwords(void)
> > >>> +{
> > >>> +     int instance;
> > >>> +
> > >>> +     for (instance =3D 0; instance < bioscfg_drv.password_instance=
s_count; instance++)
> > >>> +             clear_passwords(instance);
> > >>> +
> > >>> +     return 0;
> > >>> +}
> > >>> +
> > >>> +int get_password_instance_for_type(const char *name)
> > >>> +{
> > >>> +     int count =3D bioscfg_drv.password_instances_count;
> > >>> +     int instance;
> > >>> +
> > >>> +     for (instance =3D 0; instance < count; instance++) {
> > >>> +             if (strcmp(bioscfg_drv.password_data[instance].displa=
y_name, name) =3D=3D 0)
> > >>> +                     return instance;
> > >>> +     }
> > >>> +     return -EINVAL;
> > >>> +}
> > >>> +
> > >>> +int validate_password_input(int instance_id, const char *buf)
> > >>> +{
> > >>> +     int length;
> > >>> +
> > >>> +     length =3D strlen(buf);
> > >>> +     if (buf[length-1] =3D=3D '\n')
> > >>> +             length--;
> > >>> +
> > >>> +     if (length > MAX_PASSWD_SIZE)
> > >>> +             return INVALID_BIOS_AUTH;
> > >>> +
> > >>> +     if (bioscfg_drv.password_data[instance_id].min_password_lengt=
h > length ||
> > >>> +         bioscfg_drv.password_data[instance_id].max_password_lengt=
h < length)
> > >>> +             return INVALID_BIOS_AUTH;
> > >>> +     return SUCCESS;
> > >>> +}
> > >>> +
> > >>> +int password_is_set(const char *name)
> > >>> +{
> > >>> +     int id;
> > >>> +
> > >>> +     id =3D get_password_instance_for_type(name);
> > >>> +     if (id < 0)
> > >>> +             return 0;
> > >>> +
> > >>> +     return bioscfg_drv.password_data[id].is_enabled;
> > >>> +}
> > >>> +
> > >>> +attribute_n_property_show(is_enabled, password);
> > >>> +static struct kobj_attribute password_is_password_set =3D __ATTR_R=
O(is_enabled);
> > >>> +
> > >>> +static ssize_t current_password_store(struct kobject *kobj,
> > >>> +                                   struct kobj_attribute *attr,
> > >>> +                                   const char *buf, size_t count)
> > >>> +{
> > >>> +     char *p, *buf_cp;
> > >>> +     int id, ret =3D 0;
> > >>> +
> > >>> +     buf_cp =3D kstrdup(buf, GFP_KERNEL);
> > >>> +     if (!buf_cp) {
> > >>> +             ret =3D -ENOMEM;
> > >>> +             goto exit_current_password;
> > >>> +     }
> > >>> +
> > >>> +     p =3D memchr(buf_cp, '\n', count);
> > >>> +
> > >>> +     if (p !=3D NULL)
> > >>> +             *p =3D '\0';
> > >>> +
> > >>> +     id =3D get_password_instance_id(kobj);
> > >>> +
> > >>> +     if (id >=3D 0)
> > >>> +             ret =3D validate_password_input(id, buf_cp);
> > >>> +
> > >>> +     if (!ret)
> > >>> +             strscpy(bioscfg_drv.password_data[id].current_passwor=
d,
> > >>> +                     buf_cp,
> > >>> +                     sizeof(bioscfg_drv.password_data[id].current_=
password));
> > >>> +
> > >>> +exit_current_password:
> > >>> +     kfree(buf_cp);
> > >>> +     return ret ? ret : count;
> > >>> +}
> > >>> +static struct kobj_attribute password_current_password =3D __ATTR_=
WO(current_password);
> > >>> +
> > >>> +static ssize_t new_password_store(struct kobject *kobj,
> > >>> +                               struct kobj_attribute *attr,
> > >>> +                               const char *buf, size_t count)
> > >>> +{
> > >>> +     char *p, *buf_cp =3D NULL;
> > >>> +     int id, ret =3D -EIO;
> > >>> +
> > >>> +     buf_cp =3D kstrdup(buf, GFP_KERNEL);
> > >>> +     if (!buf_cp) {
> > >>> +             ret =3D -ENOMEM;
> > >>> +             goto exit_new_password;
> > >>> +     }
> > >>> +
> > >>> +     p =3D memchr(buf_cp, '\n', count);
> > >>> +
> > >>> +     if (p !=3D NULL)
> > >>> +             *p =3D '\0';
> > >>> +
> > >>> +     id =3D get_password_instance_id(kobj);
> > >>> +
> > >>> +     if (id >=3D 0)
> > >>> +             ret =3D validate_password_input(id, buf_cp);
> > >>> +
> > >>> +     if (!ret)
> > >>> +             strscpy(bioscfg_drv.password_data[id].new_password,
> > >>> +                     buf_cp,
> > >>> +                     sizeof(bioscfg_drv.password_data[id].new_pass=
word));
> > >>> +
> > >>> +     if (!ret)
> > >>> +             ret =3D hp_set_attribute(kobj->name, buf_cp);
> > >>> +
> > >>> +exit_new_password:
> > >>> +     /*
> > >>> +      * Regardless of the results both new and current passwords
> > >>> +      * will be set to zero and avoid security issues
> > >>> +      */
> > >>> +     clear_passwords(id);
> > >>> +
> > >>> +     kfree(buf_cp);
> > >>> +     return ret ? ret : count;
> > >>> +}
> > >>> +
> > >>> +static struct kobj_attribute password_new_password =3D __ATTR_WO(n=
ew_password);
> > >>> +
> > >>> +
> > >>> +attribute_n_property_show(min_password_length, password);
> > >>> +static struct kobj_attribute password_min_password_length =3D __AT=
TR_RO(min_password_length);
> > >>> +
> > >>> +attribute_n_property_show(max_password_length, password);
> > >>> +static struct kobj_attribute password_max_password_length =3D __AT=
TR_RO(max_password_length);
> > >>> +
> > >>> +static ssize_t role_show(struct kobject *kobj, struct kobj_attribu=
te *attr,
> > >>> +                      char *buf)
> > >>> +{
> > >>> +     if (strcmp(kobj->name, SETUP_PASSWD) =3D=3D 0)
> > >>> +             return sprintf(buf, "%s\n", role_type[BIOS_ADMIN]);
> > >>> +
> > >>> +     if (strcmp(kobj->name, POWER_ON_PASSWD) =3D=3D 0)
> > >>> +             return sprintf(buf,  "%s\n", role_type[POWER_ON]);
> > >>> +
> > >>> +     return -EIO;
> > >>> +}
> > >>> +static struct kobj_attribute password_role =3D __ATTR_RO(role);
> > >>> +
> > >>> +static ssize_t mechanism_show(struct kobject *kobj, struct kobj_at=
tribute *attr,
> > >>> +                        char *buf)
> > >>> +{
> > >>> +     int i =3D get_password_instance_id(kobj);
> > >>> +
> > >>> +     if (i < 0)
> > >>> +             return i;
> > >>> +
> > >>> +     if (bioscfg_drv.password_data[i].mechanism !=3D PASSWORD)
> > >>> +             return -EINVAL;
> > >>> +
> > >>> +     return sprintf(buf, "%s\n",
> > >>> +                    passwd_mechanism_types[bioscfg_drv.password_da=
ta[i].mechanism]);
> > >>> +}
> > >>> +static struct kobj_attribute password_mechanism =3D __ATTR_RO(mech=
anism);
> > >>> +
> > >>> +static ssize_t type_show(struct kobject *kobj, struct kobj_attribu=
te *attr,
> > >>> +                      char *buf)
> > >>> +{
> > >>> +     return sprintf(buf, "password\n");
> > >>> +}
> > >>> +static struct kobj_attribute password_type =3D __ATTR_RO(type);
> > >>> +
> > >>> +attribute_s_property_show(display_name, password);
> > >>> +static struct kobj_attribute password_display_name =3D
> > >>> +             __ATTR_RO(display_name);
> > >>> +
> > >>> +attribute_s_property_show(display_name_language_code, password);
> > >>> +static struct kobj_attribute password_display_langcode =3D
> > >>> +             __ATTR_RO(display_name_language_code);
> > >>> +
> > >>> +attribute_s_property_show(supported_encoding,  password);
> > >>> +static struct kobj_attribute password_encoding =3D
> > >>> +             __ATTR_RO(supported_encoding);
> > >>> +
> > >>> +attribute_n_property_show(encoding_size,  password);
> > >>> +static struct kobj_attribute password_encoding_size =3D
> > >>> +             __ATTR_RO(encoding_size);
> > >>> +
> > >>> +static struct attribute *password_attrs[] =3D {
> > >>> +     &password_is_password_set.attr,
> > >>> +     &password_min_password_length.attr,
> > >>> +     &password_max_password_length.attr,
> > >>> +     &password_current_password.attr,
> > >>> +     &password_new_password.attr,
> > >>> +     &password_role.attr,
> > >>> +     &password_mechanism.attr,
> > >>> +     &password_type.attr,
> > >>> +     &password_display_name.attr,
> > >>> +     &password_display_langcode.attr,
> > >>> +     &password_encoding.attr,
> > >>> +     &password_encoding_size.attr,
> > >>> +     NULL,
> > >>> +};
> > >>> +
> > >>> +static const struct attribute_group bios_password_attr_group =3D {
> > >>> +     .attrs =3D password_attrs,
> > >>> +};
> > >>> +
> > >>> +static const struct attribute_group system_password_attr_group =3D=
 {
> > >>> +     .attrs =3D password_attrs,
> > >>> +};
> > >>> +
> > >>> +int alloc_password_data(void)
> > >>> +{
> > >>> +     int ret =3D 0;
> > >>> +
> > >>> +     bioscfg_drv.password_instances_count =3D get_instance_count(H=
P_WMI_BIOS_PASSWORD_GUID);
> > >>> +     bioscfg_drv.password_data =3D kcalloc(bioscfg_drv.password_in=
stances_count,
> > >>> +                                         sizeof(struct password_da=
ta), GFP_KERNEL);
> > >>> +     if (!bioscfg_drv.password_data) {
> > >>> +             bioscfg_drv.password_instances_count =3D 0;
> > >>> +             ret =3D -ENOMEM;
> > >>> +     }
> > >>> +
> > >>> +     return ret;
> > >>> +}
> > >>> +
> > >>> +/*
> > >>> + * populate_password_package_data -
> > >>> + *   Populate all properties for an instance under password attrib=
ute
> > >>> + *
> > >>> + * @password_obj: ACPI object with password data
> > >>> + * @instance_id: The instance to enumerate
> > >>> + * @attr_name_kobj: The parent kernel object
> > >>> + */
> > >>> +int populate_password_package_data(union acpi_object *password_obj=
, int instance_id,
> > >>> +                                struct kobject *attr_name_kobj)
> > >>> +{
> > >>> +     char *str_value =3D NULL;
> > >>> +     int str_len;
> > >>> +     int ret =3D 0;
> > >>> +
> > >>> +     bioscfg_drv.password_data[instance_id].type =3D HPWMI_PASSWOR=
D_TYPE;
> > >>> +     bioscfg_drv.password_data[instance_id].attr_name_kobj =3D att=
r_name_kobj;
> > >>> +
> > >>> +     ret =3D convert_hexstr_to_str(&(password_obj[NAME].string.poi=
nter),
> > >>> +                                 password_obj[NAME].string.length,
> > >>> +                                 &str_value, &str_len);
> > >>> +
> > >>> +     if (ACPI_FAILURE(ret)) {
> > >>> +             kfree(str_value);
> > >>> +             return ret;
> > >>> +     }
> > >>> +
> > >>> +     strscpy(bioscfg_drv.password_data[instance_id].attribute_name=
,
> > >>> +             str_value,
> > >>> +             sizeof(bioscfg_drv.password_data[instance_id].attribu=
te_name));
> > >>> +     strscpy(bioscfg_drv.password_data[instance_id].display_name,
> > >>> +             str_value,
> > >>> +             sizeof(bioscfg_drv.password_data[instance_id].display=
_name));
> > >>> +
> > >>> +     kfree(str_value);
> > >>> +     str_value =3D NULL;
> > >>> +
> > >>> +     populate_password_elements_from_package(password_obj, instanc=
e_id, HPWMI_PASSWORD_TYPE);
> > >>> +
> > >>> +     if (strcmp(attr_name_kobj->name, "Setup Password") =3D=3D 0) =
{
> > >>> +             /* Save  system authentication instance for easy acce=
ss */
> > >>> +             return sysfs_create_group(attr_name_kobj, &bios_passw=
ord_attr_group);
> > >>> +     }
> > >>> +
> > >>> +     return sysfs_create_group(attr_name_kobj, &system_password_at=
tr_group);
> > >>> +}
> > >>> +
> > >>> +int populate_password_elements_from_package(union acpi_object *pas=
sword_obj,
> > >>> +                                        int instance_id,
> > >>> +                                        enum hp_wmi_data_type type=
)
> > >>> +{
> > >>> +     char *str_value =3D NULL;
> > >>> +     int value_len;
> > >>> +     int status =3D 0;
> > >>> +     u32 size =3D 0;
> > >>> +     u32 int_value;
> > >>> +     int elem =3D 0;
> > >>> +     int reqs;
> > >>> +     int eloc;
> > >>> +     int pos_values;
> > >>> +
> > >>> +     strscpy(bioscfg_drv.password_data[instance_id].display_name_l=
anguage_code,
> > >>> +             LANG_CODE_STR,
> > >>> +             sizeof(bioscfg_drv.password_data[instance_id].display=
_name_language_code));
> > >>> +
> > >>> +     for (elem =3D 1, eloc =3D 1; elem < hp_wmi_elements_count[typ=
e]; elem++, eloc++) {
> > >>> +
> > >>> +             switch (password_obj[elem].type) {
> > >>> +             case ACPI_TYPE_STRING:
> > >>> +
> > >>> +                     if (PREREQUISITES !=3D elem && ENUM_POSSIBLE_=
VALUES !=3D elem) {
> > >>> +                             status =3D convert_hexstr_to_str(&pas=
sword_obj[elem].string.pointer,
> > >>> +                                                            passwo=
rd_obj[elem].string.length,
> > >>> +                                                            &str_v=
alue, &value_len);
> > >>> +
> > >>> +                             if (ACPI_FAILURE(status))
> > >>> +                                     continue;
> > >>> +
> > >>> +                     }
> > >>> +                     break;
> > >>> +             case ACPI_TYPE_INTEGER:
> > >>> +                     int_value =3D (u32)password_obj[elem].integer=
.value;
> > >>> +                     break;
> > >>> +             default:
> > >>> +                     pr_warn("Unsupported object type [%d]\n", pas=
sword_obj[elem].type);
> > >>> +                     continue;
> > >>> +             }
> > >>> +
> > >>> +             /* stop if extra counter is greater than total number
> > >>> +              * of elements for password type
> > >>> +              */
> > >>> +             if (eloc =3D=3D hp_wmi_elements_count[type])
> > >>> +                     goto exit_password_package;
> > >>> +
> > >>> +             /* Assign appropriate element value to corresponding =
field*/
> > >>> +             switch (eloc) {
> > >>> +             case VALUE:
> > >>> +                     break;
> > >>> +             case PATH:
> > >>> +                     strscpy(bioscfg_drv.password_data[instance_id=
].path, str_value,
> > >>> +                             sizeof(bioscfg_drv.password_data[inst=
ance_id].path));
> > >>> +                     break;
> > >>> +             case IS_READONLY:
> > >>> +                     bioscfg_drv.password_data[instance_id].is_rea=
donly =3D int_value;
> > >>> +                     break;
> > >>> +             case DISPLAY_IN_UI:
> > >>> +                     bioscfg_drv.password_data[instance_id].displa=
y_in_ui =3D int_value;
> > >>> +                     break;
> > >>> +             case REQUIRES_PHYSICAL_PRESENCE:
> > >>> +                     bioscfg_drv.password_data[instance_id].requir=
es_physical_presence =3D int_value;
> > >>> +                     break;
> > >>> +             case SEQUENCE:
> > >>> +                     bioscfg_drv.password_data[instance_id].sequen=
ce =3D int_value;
> > >>> +                     break;
> > >>> +             case PREREQUISITE_SIZE:
> > >>> +                     bioscfg_drv.password_data[instance_id].prereq=
uisitesize =3D int_value;
> > >>> +                     if (int_value > 20)
> > >>> +                             pr_warn("Prerequisites size value exc=
eeded the maximum number of elements supported or data may be malformed\n")=
;
> > >>> +                     /*
> > >>> +                      * prerequisites element is omitted when
> > >>> +                      * prerequisitesSize value is zero.
> > >>> +                      */
> > >>> +                     if (int_value =3D=3D 0)
> > >>> +                             eloc++;
> > >>> +                     break;
> > >>> +             case PREREQUISITES:
> > >>> +                     size =3D bioscfg_drv.password_data[instance_i=
d].prerequisitesize;
> > >>> +
> > >>> +                     for (reqs =3D 0; reqs < size; reqs++) {
> > >>> +                             status =3D convert_hexstr_to_str(&pas=
sword_obj[elem].string.pointer,
> > >>> +                                                            passwo=
rd_obj[elem].string.length,
> > >>> +                                                            &str_v=
alue, &value_len);
> > >>> +
> > >>> +                             if (ACPI_FAILURE(status))
> > >>> +                                     break;
> > >>> +
> > >>> +                             strlcat(bioscfg_drv.password_data[ins=
tance_id].prerequisites,
> > >>> +                                     str_value,
> > >>> +                                     sizeof(bioscfg_drv.password_d=
ata[instance_id].prerequisites));
> > >>> +
> > >>> +                             if (reqs !=3D (size - 1))
> > >>> +                                     strlcat(bioscfg_drv.password_=
data[instance_id].prerequisites, ";",
> > >>> +                                             sizeof(bioscfg_drv.pa=
ssword_data[instance_id].prerequisites));
> > >>> +
> > >>> +                             kfree(str_value);
> > >>> +                             str_value =3D NULL;
> > >>> +                     }
> > >>> +                     break;
> > >>> +
> > >>> +             case SECURITY_LEVEL:
> > >>> +                     bioscfg_drv.password_data[instance_id].securi=
ty_level =3D int_value;
> > >>> +                     break;
> > >>> +
> > >>> +             case PSWD_MIN_LENGTH:
> > >>> +                     bioscfg_drv.password_data[instance_id].min_pa=
ssword_length =3D int_value;
> > >>> +                     break;
> > >>> +             case PSWD_MAX_LENGTH:
> > >>> +                     bioscfg_drv.password_data[instance_id].max_pa=
ssword_length =3D int_value;
> > >>> +                     break;
> > >>> +             case PSWD_SIZE:
> > >>> +                     bioscfg_drv.password_data[instance_id].encodi=
ng_size =3D int_value;
> > >>> +                     break;
> > >>> +             case PSWD_SUPPORTED_ENCODING:
> > >>> +                     size =3D bioscfg_drv.password_data[instance_i=
d].encoding_size;
> > >>> +                     for (pos_values =3D 0; pos_values < size; pos=
_values++) {
> > >>> +                             status =3D convert_hexstr_to_str(&pas=
sword_obj[elem + pos_values].string.pointer,
> > >>> +                                                            passwo=
rd_obj[elem  + pos_values].string.length,
> > >>> +                                                            &str_v=
alue, &value_len);
> > >>> +                             if (ACPI_FAILURE(status))
> > >>> +                                     break;
> > >>> +
> > >>> +                             strlcat(bioscfg_drv.password_data[ins=
tance_id].supported_encoding,
> > >>> +                                     str_value,
> > >>> +                                     sizeof(bioscfg_drv.password_d=
ata[instance_id].supported_encoding));
> > >>> +
> > >>> +                             if (pos_values < (size - 1))
> > >>> +                                     strlcat(bioscfg_drv.password_=
data[instance_id].supported_encoding, ";",
> > >>> +                                             sizeof(bioscfg_drv.pa=
ssword_data[instance_id].supported_encoding));
> > >>> +                             kfree(str_value);
> > >>> +                             str_value =3D NULL;
> > >>> +                     }
> > >>> +                     break;
> > >>> +             case PSWD_IS_SET:
> > >>> +                     bioscfg_drv.password_data[instance_id].is_ena=
bled =3D int_value;
> > >>> +                     break;
> > >>> +
> > >>> +             default:
> > >>> +                     pr_warn("Invalid element: %d found in Passwor=
d attribute or data may be malformed\n", elem);
> > >>> +                     break;
> > >>> +             }
> > >>> +             kfree(str_value);
> > >>> +             str_value =3D NULL;
> > >>> +     }
> > >>> +
> > >>> +exit_password_package:
> > >>> +     kfree(str_value);
> > >>> +     str_value =3D NULL;
> > >>> +     return 0;
> > >>> +}
> > >>> +
> > >>> +/*
> > >>> + * populate_password_buffer_data -
> > >>> + * Populate all properties for an instance under password object a=
ttribute
> > >>> + *
> > >>> + * @password_obj: ACPI object with password object data
> > >>> + * @instance_id: The instance to enumerate
> > >>> + * @attr_name_kobj: The parent kernel object
> > >>> + */
> > >>> +int populate_password_buffer_data(union acpi_object *password_obj,=
 int instance_id,
> > >>> +                        struct kobject *attr_name_kobj)
> > >>> +{
> > >>> +     bioscfg_drv.password_data[instance_id].type =3D HPWMI_PASSWOR=
D_TYPE;
> > >>> +     bioscfg_drv.password_data[instance_id].attr_name_kobj =3D att=
r_name_kobj;
> > >>> +
> > >>> +     strscpy(bioscfg_drv.password_data[instance_id].attribute_name=
,
> > >>> +             attr_name_kobj->name,
> > >>> +             sizeof(bioscfg_drv.password_data[instance_id].attribu=
te_name));
> > >>> +     strscpy(bioscfg_drv.password_data[instance_id].display_name,
> > >>> +             attr_name_kobj->name,
> > >>> +             sizeof(bioscfg_drv.password_data[instance_id].display=
_name));
> > >>> +
> > >>> +     /* Populate Password attributes */
> > >>> +     populate_password_elements_from_buffer(password_obj, instance=
_id, HPWMI_PASSWORD_TYPE);
> > >>> +     if (strcmp(attr_name_kobj->name, "Setup Password") =3D=3D 0)
> > >>> +             return sysfs_create_group(attr_name_kobj, &bios_passw=
ord_attr_group);
> > >>> +
> > >>> +     return sysfs_create_group(attr_name_kobj, &system_password_at=
tr_group);
> > >>> +}
> > >>> +
> > >>> +int populate_password_elements_from_buffer(union acpi_object *pass=
word_obj,
> > >>> +                                        int instance_id,
> > >>> +                                        enum hp_wmi_data_type type=
)
> > >>> +{
> > >>> +     int status;
> > >>> +     char *str =3D NULL;
> > >>> +     int elem;
> > >>> +     int reqs;
> > >>> +     int integer;
> > >>> +     int size =3D 0;
> > >>> +     int values;
> > >>> +
> > >>> +     elem =3D 0;
> > >>> +     strscpy(bioscfg_drv.password_data[instance_id].display_name_l=
anguage_code,
> > >>> +             LANG_CODE_STR,
> > >>> +             sizeof(bioscfg_drv.password_data[instance_id].display=
_name_language_code));
> > >>> +
> > >>> +     for (elem =3D 1; elem < 3; elem++) {
> > >>> +
> > >>> +             status =3D get_string_from_buffer((u16 **)&password_o=
bj->buffer.pointer, &str);
> > >>> +             if (ACPI_FAILURE(status))
> > >>> +                     continue;
> > >>> +
> > >>> +             switch (elem) {
> > >>> +             case VALUE:
> > >>> +                     strscpy(bioscfg_drv.password_data[instance_id=
].current_password,
> > >>> +                             str, sizeof(bioscfg_drv.password_data=
[instance_id].current_password));
> > >>> +                     break;
> > >>> +             case PATH:
> > >>> +                     strscpy(bioscfg_drv.password_data[instance_id=
].path, str,
> > >>> +                             sizeof(bioscfg_drv.password_data[inst=
ance_id].path));
> > >>> +                     break;
> > >>> +             default:
> > >>> +                     pr_warn("Invalid element: %d found in Passwor=
d  attribute or data may be malformed\n", elem);
> > >>> +                     break;
> > >>> +             }
> > >>> +             kfree(str);
> > >>> +             str =3D NULL;
> > >>> +     }
> > >>> +
> > >>> +     for (elem =3D 3; elem < hp_wmi_elements_count[type]; elem++) =
{
> > >>> +
> > >>> +             if (elem !=3D PREREQUISITES  && elem !=3D PSWD_SUPPOR=
TED_ENCODING)
> > >>> +                     status =3D get_integer_from_buffer((int **)&p=
assword_obj->buffer.pointer, (int *)&integer);
> > >>> +
> > >>> +             if (ACPI_FAILURE(status))
> > >>> +                     continue;
> > >>> +
> > >>> +             switch (elem) {
> > >>> +             case IS_READONLY:
> > >>> +                     bioscfg_drv.password_data[instance_id].is_rea=
donly =3D integer;
> > >>> +                     break;
> > >>> +             case DISPLAY_IN_UI:
> > >>> +                     bioscfg_drv.password_data[instance_id].displa=
y_in_ui =3D integer;
> > >>> +                     break;
> > >>> +             case REQUIRES_PHYSICAL_PRESENCE:
> > >>> +                     bioscfg_drv.password_data[instance_id].requir=
es_physical_presence =3D integer;
> > >>> +                     break;
> > >>> +             case SEQUENCE:
> > >>> +                     bioscfg_drv.password_data[instance_id].sequen=
ce =3D integer;
> > >>> +                     break;
> > >>> +             case PREREQUISITE_SIZE:
> > >>> +                     bioscfg_drv.password_data[instance_id].prereq=
uisitesize =3D integer;
> > >>> +                     if (integer > 20)
> > >>> +                             pr_warn("Prerequisites size value exc=
eeded the maximum number of elements supported or data may be malformed\n")=
;
> > >>> +                     break;
> > >>> +             case PREREQUISITES:
> > >>> +                     size =3D bioscfg_drv.password_data[instance_i=
d].prerequisitesize;
> > >>> +                     for (reqs =3D 0; reqs < size; reqs++) {
> > >>> +                             status =3D get_string_from_buffer((u1=
6 **)&password_obj->buffer.pointer, &str);
> > >>> +                             if (ACPI_FAILURE(status))
> > >>> +                                     continue;
> > >>> +
> > >>> +                             strlcat(bioscfg_drv.password_data[ins=
tance_id].prerequisites,
> > >>> +                                     str,
> > >>> +                                     sizeof(bioscfg_drv.password_d=
ata[instance_id].prerequisites));
> > >>> +
> > >>> +                             if (reqs !=3D (size - 1))
> > >>> +                                     strlcat(bioscfg_drv.password_=
data[instance_id].prerequisites, ";",
> > >>> +                                             sizeof(bioscfg_drv.pa=
ssword_data[instance_id].prerequisites));
> > >>> +
> > >>> +                             kfree(str);
> > >>> +                             str =3D NULL;
> > >>> +                     }
> > >>> +                     break;
> > >>> +             case SECURITY_LEVEL:
> > >>> +                     bioscfg_drv.password_data[instance_id].securi=
ty_level =3D integer;
> > >>> +                     break;
> > >>> +
> > >>> +             case PSWD_MIN_LENGTH:
> > >>> +                     bioscfg_drv.password_data[instance_id].min_pa=
ssword_length =3D integer;
> > >>> +                     break;
> > >>> +             case PSWD_MAX_LENGTH:
> > >>> +                     bioscfg_drv.password_data[instance_id].max_pa=
ssword_length =3D integer;
> > >>> +                     break;
> > >>> +             case PSWD_SIZE:
> > >>> +                     bioscfg_drv.password_data[instance_id].encodi=
ng_size =3D integer;
> > >>> +                     break;
> > >>> +             case PSWD_SUPPORTED_ENCODING:
> > >>> +                     size =3D bioscfg_drv.password_data[instance_i=
d].encoding_size;
> > >>> +                     for (values =3D 0; values < size; values++) {
> > >>> +                             status =3D get_string_from_buffer((u1=
6 **)&password_obj->buffer.pointer, &str);
> > >>> +                             if (ACPI_FAILURE(status))
> > >>> +                                     continue;
> > >>> +
> > >>> +                             strlcat(bioscfg_drv.password_data[ins=
tance_id].supported_encoding,
> > >>> +                                     str,
> > >>> +                                     sizeof(bioscfg_drv.password_d=
ata[instance_id].supported_encoding));
> > >>> +
> > >>> +                             if (values !=3D (size - 1))
> > >>> +                                     strlcat(bioscfg_drv.password_=
data[instance_id].supported_encoding, ";",
> > >>> +                                             sizeof(bioscfg_drv.pa=
ssword_data[instance_id].supported_encoding));
> > >>> +
> > >>> +                             kfree(str);
> > >>> +                             str =3D NULL;
> > >>> +                     }
> > >>> +                     break;
> > >>> +             case PSWD_IS_SET:
> > >>> +                     bioscfg_drv.password_data[instance_id].is_ena=
bled =3D integer;
> > >>> +                     break;
> > >>> +             default:
> > >>> +                     pr_warn("Invalid element: %d found in Passwor=
d  attribute or data may be malformed\n", elem);
> > >>> +                     break;
> > >>> +             }
> > >>> +             kfree(str);
> > >>> +             str =3D NULL;
> > >>> +     }
> > >>> +     kfree(str);
> > >>> +     str =3D NULL;
> > >>> +
> > >>> +     return 0;
> > >>> +}
> > >>> +
> > >>> +/*
> > >>> + * exit_password_attributes() - Clear all attribute data
> > >>> + *
> > >>> + * Clears all data allocated for this group of attributes
> > >>> + */
> > >>> +void exit_password_attributes(void)
> > >>> +{
> > >>> +     int instance_id;
> > >>> +
> > >>> +     for (instance_id =3D 0; instance_id < bioscfg_drv.password_in=
stances_count; instance_id++) {
> > >>> +             if (bioscfg_drv.password_data[instance_id].attr_name_=
kobj) {
> > >>> +                     if (strcmp(bioscfg_drv.password_data[instance=
_id].attr_name_kobj->name, SETUP_PASSWD) =3D=3D 0)
> > >>> +                             sysfs_remove_group(bioscfg_drv.passwo=
rd_data[instance_id].attr_name_kobj,
> > >>> +                                                             &bios=
_password_attr_group);
> > >>> +                     else
> > >>> +                             sysfs_remove_group(bioscfg_drv.passwo=
rd_data[instance_id].attr_name_kobj,
> > >>> +                                                             &syst=
em_password_attr_group);
> > >>> +             }
> > >>> +     }
> > >>> +     bioscfg_drv.password_instances_count =3D 0;
> > >>> +     kfree(bioscfg_drv.password_data);
> > >>> +     bioscfg_drv.password_data =3D NULL;
> > >>> +}
> > >>> diff --git a/drivers/platform/x86/hp/spmobj-attributes.c b/drivers/=
platform/x86/hp/spmobj-attributes.c
> > >>> new file mode 100644
> > >>> index 000000000000..631fdbd05be9
> > >>> --- /dev/null
> > >>> +++ b/drivers/platform/x86/hp/spmobj-attributes.c
> > >>> @@ -0,0 +1,408 @@
> > >>> +// SPDX-License-Identifier: GPL-2.0
> > >>> +/*
> > >>> + * Functions corresponding to secure platform management object ty=
pe
> > >>> + * attributes under BIOS PASSWORD for use with hp-bioscfg driver
> > >>> + *
> > >>> + *  Copyright (c) 2022 HP Development Company, L.P.
> > >>> + */
> > >>> +
> > >>> +#include "bioscfg.h"
> > >>> +
> > >>> +#define MAX_KEK_BLOB_SIZE    4160
> > >>> +#define MAX_SK_BLOB_SIZE     516
> > >>> +
> > >>> +enum spm_states_values {
> > >>> +     NOT_PROVISIONED          =3D 0x00,
> > >>> +     PROVISIONED              =3D 0x01,
> > >>> +     PROVISIONING_IN_PROGRESS =3D 0x02
> > >>> +};
> > >>> +
> > >>> +static const char * const spm_state_types[] =3D {
> > >>> +     "not provisioned",
> > >>> +     "provisioned",
> > >>> +     "provisioning in progress"};
> > >>> +
> > >>> +
> > >>> +int check_spm_is_enabled(void)
> > >>> +{
> > >>> +     /* do we need to check the admin password is also configured =
*/
> > >>> +     return bioscfg_drv.spm_data.is_enabled;
> > >>> +}
> > >>> +
> > >>> +/*
> > >>> + * calculate_security_buffer() - determines size of security buffe=
r
> > >>> + * for authentication scheme
> > >>> + *
> > >>> + * @authentication: the authentication content
> > >>> + *
> > >>> + * Currently only supported type is Admin password
> > >>> + */
> > >>> +size_t calculate_security_buffer(const char *authentication)
> > >>> +{
> > >>> +     int size;
> > >>> +
> > >>> +     if (authentication !=3D NULL && strlen(authentication) > 0) {
> > >>> +             size =3D  (sizeof(u16) + (strlen(authentication) * si=
zeof(u16)) +
> > >>> +                     + (strlen(UTF_PREFIX) * sizeof(u16)));
> > >>> +             return size;
> > >>> +     }
> > >>> +
> > >>> +     size  =3D sizeof(u16) * 2;
> > >>> +     return size;
> > >>> +}
> > >>> +
> > >>> +/*
> > >>> + * populate_security_buffer() - builds a security buffer for
> > >>> + * authentication scheme
> > >>> + *
> > >>> + * @buffer: the buffer to populate
> > >>> + * @authentication: the authentication content
> > >>> + *
> > >>> + * Currently only supported type is PLAIN TEXT
> > >>> + */
> > >>> +void populate_security_buffer(u16 *buffer, const char *authenticat=
ion)
> > >>> +{
> > >>> +     u16 *auth =3D buffer;
> > >>> +     char *strprefix =3D NULL;
> > >>> +
> > >>> +     if (strncmp(authentication, BEAM_PREFIX, strlen(BEAM_PREFIX))=
 =3D=3D 0) {
> > >>> +             /*
> > >>> +              * BEAM_PREFIX is append to buffer when a signature
> > >>> +              * is provided and Sure Admin is enabled in BIOS
> > >>> +              */
> > >>> +             // BEAM_PREFIX found, convert part to unicode
> > >>> +             auth =3D ascii_to_utf16_unicode(auth, authentication)=
;
> > >>> +     } else {
> > >>> +             /*
> > >>> +              * UTF-16 prefix is append to the * buffer when a BIO=
S
> > >>> +              * admin password is configured in BIOS
> > >>> +              */
> > >>> +
> > >>> +             // append UTF_PREFIX to part and then convert it to u=
nicode
> > >>> +             strprefix =3D kasprintf(GFP_KERNEL, "%s%s", UTF_PREFI=
X, authentication);
> > >>> +             if (!strprefix)
> > >>> +                     goto out_populate_security_buffer;
> > >>> +
> > >>> +             auth =3D ascii_to_utf16_unicode(auth, strprefix);
> > >>> +     }
> > >>> +out_populate_security_buffer:
> > >>> +
> > >>> +     kfree(strprefix);
> > >>> +     strprefix =3D NULL;
> > >>> +}
> > >>> +
> > >>> +ssize_t update_spm_state(void)
> > >>> +{
> > >>> +     int ret;
> > >>> +     struct secureplatform_provisioning_data *data =3D NULL;
> > >>> +
> > >>> +     data =3D kmalloc(sizeof(struct secureplatform_provisioning_da=
ta), GFP_KERNEL);
> > >>> +     if (!data) {
> > >>> +             ret =3D -ENOMEM;
> > >>> +             goto spm_state_exit;
> > >>> +     }
> > >>> +
> > >>> +     ret =3D hp_wmi_perform_query(HPWMI_SECUREPLATFORM_GET_STATE,
> > >>> +                                    HPWMI_SECUREPLATFORM, data, 0,
> > >>> +                                    sizeof(struct secureplatform_p=
rovisioning_data));
> > >>> +     if (ret < 0)
> > >>> +             goto spm_state_exit;
> > >>> +
> > >>> +     bioscfg_drv.spm_data.mechanism =3D data->state;
> > >>> +     if (bioscfg_drv.spm_data.mechanism)
> > >>> +             bioscfg_drv.spm_data.is_enabled =3D 1;
> > >>> +
> > >>> +spm_state_exit:
> > >>> +     kfree(data);
> > >>> +
> > >>> +     return ret;
> > >>> +}
> > >>> +
> > >>> +/*
> > >>> + * statusbin - Reports SPM status in binary format
> > >>> + *
> > >>> + * @kobj:  Pointer to a kernel object of things that show up as
> > >>> + *      directory in the sysfs filesystem.
> > >>> + * @attr:  Pointer to list of attributes for the operation
> > >>> + * @buf:   Pointer to buffer
> > >>> + *
> > >>> + * Returns number of bytes read on success.  Otherwise,
> > >>> + *         an HP WMI query specific error code (which is positive)
> > >>> + *         -ENODEV if the query was not successful at all
> > >>> + *
> > >>> + */
> > >>> +ssize_t statusbin(struct kobject *kobj,
> > >>> +                   struct kobj_attribute *attr, char *buf)
> > >>> +{
> > >>> +     int ret =3D hp_wmi_perform_query(HPWMI_SECUREPLATFORM_GET_STA=
TE,
> > >>> +                                    HPWMI_SECUREPLATFORM, buf, 0,
> > >>> +                                    sizeof(struct secureplatform_p=
rovisioning_data));
> > >>> +
> > >>> +     return ret ? -ENODEV : sizeof(struct secureplatform_provision=
ing_data);
> > >>> +}
> > >>> +
> > >>> +ssize_t statusbin_show(struct kobject *kobj,
> > >>> +                        struct kobj_attribute *attr, char *buf)
> > >>> +{
> > >>> +     int ret;
> > >>> +     struct secureplatform_provisioning_data *data =3D NULL;
> > >>> +
> > >>> +     data =3D kmalloc(sizeof(struct secureplatform_provisioning_da=
ta), GFP_KERNEL);
> > >>> +     if (!data) {
> > >>> +             ret =3D -ENOMEM;
> > >>> +             goto statusbin_show_exit;
> > >>> +     }
> > >>> +
> > >>> +     ret =3D statusbin(kobj, attr, (char *)data);
> > >>> +     if (ret < 0)
> > >>> +             goto statusbin_show_exit;
> > >>> +
> > >>> +     /* copy data to spm local structure */
> > >>> +     memcpy(buf, data, sizeof(struct secureplatform_provisioning_d=
ata));
> > >>> +
> > >>> +statusbin_show_exit:
> > >>> +     kfree(data);
> > >>> +
> > >>> +     return ret ? ret : strnlen(buf, PAGE_SIZE);
> > >>> +}
> > >>> +struct kobj_attribute password_spm_statusbin =3D __ATTR_RO(statusb=
in);
> > >>> +
> > >>> +/*
> > >>> + * status_show - Reads SPM status
> > >>> + *
> > >>> + * @kobj:  Pointer to a kernel object of things that show up as
> > >>> + *      directory in the sysfs filesystem.
> > >>> + * @attr:  Pointer to list of attributes for the operation
> > >>> + * @buf:   Pointer to buffer
> > >>> + *
> > >>> + * Returns number of bytes read on success.  Otherwise,
> > >>> + *         an HP WMI query specific error code (which is positive)
> > >>> + *         -ENODEV if the query was not successful at all
> > >>> + *         -ENOMEM if cannot allocate required memory size
> > >>> + *
> > >>> + */
> > >>> +ssize_t status_show(struct kobject *kobj, struct kobj_attribute
> > >>> +                     *attr, char *buf)
> > >>> +{
> > >>> +     int ret, i;
> > >>> +     struct secureplatform_provisioning_data *data =3D NULL;
> > >>> +
> > >>> +     data =3D kmalloc(sizeof(struct secureplatform_provisioning_da=
ta), GFP_KERNEL);
> > >>> +     if (!data) {
> > >>> +             ret =3D -ENOMEM;
> > >>> +             goto status_show_exit;
> > >>> +     }
> > >>> +
> > >>> +     ret =3D statusbin(kobj, attr, (char *)data);
> > >>> +     if (ret < 0)
> > >>> +             goto status_show_exit;
> > >>> +
> > >>> +     snprintf(buf, PAGE_SIZE, "%sState: %d\n", buf, data->state);
> > >>> +     snprintf(buf, PAGE_SIZE, "%sVersion: %d.%d\n", buf, data->ver=
sion[0],
> > >>> +              data->version[1]);
> > >>> +
> > >>> +     /* state =3D=3D 0 means secure platform management feature is=
 not configured in BIOS. */
> > >>> +     if (data->state =3D=3D 0)
> > >>> +             goto status_show_exit;
> > >>> +
> > >>> +     snprintf(buf, PAGE_SIZE, "%sNonce: %d\n", buf, data->nonce);
> > >>> +     snprintf(buf, PAGE_SIZE, "%sFeaturesInUse: %d\n", buf, data->=
features);
> > >>> +     snprintf(buf, PAGE_SIZE, "%sEndorsementKeyMod: {", buf);
> > >>> +
> > >>> +     for (i =3D 255; i >=3D 0; i--)
> > >>> +             snprintf(buf, PAGE_SIZE, "%s %u", buf, data->kek_mod[=
i]);
> > >>> +
> > >>> +     snprintf(buf, PAGE_SIZE, "%s }\n", buf);
> > >>> +     snprintf(buf, PAGE_SIZE, "%sSigningKeyMod: {", buf);
> > >>> +
> > >>> +     for (i =3D 255; i >=3D 0; i--)
> > >>> +             snprintf(buf, PAGE_SIZE, "%s %u", buf, data->sk_mod[i=
]);
> > >>> +     snprintf(buf, PAGE_SIZE, "%s }\n", buf);
> > >>> +
> > >>> +status_show_exit:
> > >>> +     kfree(data);
> > >>> +
> > >>> +     return strnlen(buf, PAGE_SIZE);
> > >>> +}
> > >>> +
> > >>> +struct kobj_attribute password_spm_status =3D __ATTR_RO(status);
> > >>> +
> > >>> +attribute_spm_n_property_show(is_enabled, spm);
> > >>> +static struct kobj_attribute password_spm_is_key_enabled =3D __ATT=
R_RO(is_enabled);
> > >>> +
> > >>> +
> > >>> +static ssize_t key_mechanism_show(struct kobject *kobj, struct kob=
j_attribute *attr,
> > >>> +                        char *buf)
> > >>> +{
> > >>> +     int ret;
> > >>> +
> > >>> +     ret =3D snprintf(buf, PAGE_SIZE, "%s\n",
> > >>> +                    spm_mechanism_types[bioscfg_drv.spm_data.mecha=
nism]);
> > >>> +     return ret;
> > >>> +}
> > >>> +static struct kobj_attribute password_spm_key_mechanism =3D __ATTR=
_RO(key_mechanism);
> > >>> +
> > >>> +static ssize_t sk_store(struct kobject *kobj,
> > >>> +                               struct kobj_attribute *attr,
> > >>> +                               const char *buf, size_t count)
> > >>> +{
> > >>> +     int ret;
> > >>> +     int length;
> > >>> +
> > >>> +     length =3D count;
> > >>> +     if (buf[length-1] =3D=3D '\n')
> > >>> +             length--;
> > >>> +
> > >>> +     /* allocate space and copy current signing key */
> > >>> +     bioscfg_drv.spm_data.signing_key =3D kmalloc(length, GFP_KERN=
EL);
> > >>> +     if (!bioscfg_drv.spm_data.signing_key) {
> > >>> +             ret =3D -ENOMEM;
> > >>> +             goto exit_signing_key;
> > >>> +     }
> > >>> +
> > >>> +     memcpy(bioscfg_drv.spm_data.signing_key, buf, length);
> > >>> +     bioscfg_drv.spm_data.signing_key[length] =3D '\0';
> > >>> +
> > >>> +     /* submit signing key payload */
> > >>> +     ret =3D hp_wmi_perform_query(HPWMI_SECUREPLATFORM_SET_SK,
> > >>> +                                HPWMI_SECUREPLATFORM,
> > >>> +                                (void *)bioscfg_drv.spm_data.signi=
ng_key,
> > >>> +                                length, 0);
> > >>> +
> > >>> +     if (!ret) {
> > >>> +             bioscfg_drv.spm_data.mechanism =3D SIGNING_KEY;
> > >>> +             bioscfg_drv.pending_reboot =3D TRUE;
> > >>> +     }
> > >>> +
> > >>> +exit_signing_key:
> > >>> +     kfree(bioscfg_drv.spm_data.signing_key);
> > >>> +     bioscfg_drv.spm_data.signing_key =3D NULL;
> > >>> +
> > >>> +     return ret ? ret : count;
> > >>> +}
> > >>> +
> > >>> +static struct kobj_attribute password_spm_signing_key =3D __ATTR_W=
O(sk);
> > >>> +
> > >>> +static ssize_t kek_store(struct kobject *kobj,
> > >>> +                               struct kobj_attribute *attr,
> > >>> +                               const char *buf, size_t count)
> > >>> +{
> > >>> +     int ret;
> > >>> +     int length;
> > >>> +
> > >>> +     length =3D count;
> > >>> +     if (buf[length-1] =3D=3D '\n')
> > >>> +             length--;
> > >>> +
> > >>> +     /* allocate space and copy current signing key */
> > >>> +     bioscfg_drv.spm_data.endorsement_key =3D kmalloc(length, GFP_=
KERNEL);
> > >>> +     if (!bioscfg_drv.spm_data.endorsement_key) {
> > >>> +             ret =3D -ENOMEM;
> > >>> +             goto exit_endorsement_key;
> > >>> +     }
> > >>> +
> > >>> +     memcpy(bioscfg_drv.spm_data.endorsement_key, buf, length);
> > >>> +     bioscfg_drv.spm_data.endorsement_key[length] =3D '\0';
> > >>> +
> > >>> +     ret =3D hp_wmi_perform_query(HPWMI_SECUREPLATFORM_SET_KEK,
> > >>> +                                HPWMI_SECUREPLATFORM,
> > >>> +                                (void *)bioscfg_drv.spm_data.endor=
sement_key,
> > >>> +                                count, 0);
> > >>> +
> > >>> +     if (!ret) {
> > >>> +             bioscfg_drv.spm_data.mechanism =3D ENDORSEMENT_KEY;
> > >>> +             bioscfg_drv.pending_reboot =3D TRUE;
> > >>> +     }
> > >>> +
> > >>> +exit_endorsement_key:
> > >>> +     kfree(bioscfg_drv.spm_data.endorsement_key);
> > >>> +     bioscfg_drv.spm_data.endorsement_key =3D NULL;
> > >>> +
> > >>> +     return ret ? ret : count;
> > >>> +}
> > >>> +static struct kobj_attribute password_spm_endorsement_key =3D __AT=
TR_WO(kek);
> > >>> +
> > >>> +static ssize_t display_name_language_code_show(struct kobject *kob=
j,
> > >>> +                                            struct kobj_attribute =
*attr,
> > >>> +                                            char *buf)
> > >>> +{
> > >>> +     return sprintf(buf, "%s\n", LANG_CODE_STR);
> > >>> +}
> > >>> +
> > >>> +static struct kobj_attribute password_spm_display_langcode =3D
> > >>> +             __ATTR_RO(display_name_language_code);
> > >>> +
> > >>> +
> > >>> +static ssize_t display_name_show(struct kobject *kobj,
> > >>> +                              struct kobj_attribute *attr, char *b=
uf)
> > >>> +{
> > >>> +     return sprintf(buf, "%s\n", SPM_STR_DESC);
> > >>> +}
> > >>> +static struct kobj_attribute password_spm_display_name =3D __ATTR_=
RO(display_name);
> > >>> +
> > >>> +static ssize_t type_show(struct kobject *kobj, struct kobj_attribu=
te *attr,
> > >>> +                      char *buf)
> > >>> +{
> > >>> +     return sprintf(buf, "secure-platform-management\n");
> > >>> +}
> > >>> +static struct kobj_attribute password_spm_type =3D __ATTR_RO(type)=
;
> > >>> +
> > >>> +static ssize_t role_show(struct kobject *kobj, struct kobj_attribu=
te *attr,
> > >>> +                      char *buf)
> > >>> +{
> > >>> +     return sprintf(buf, "%s\n", role_type[BIOS_SPM]);
> > >>> +}
> > >>> +static struct kobj_attribute password_spm_role =3D __ATTR_RO(role)=
;
> > >>> +
> > >>> +static struct attribute *secure_platform_attrs[] =3D {
> > >>> +     &password_spm_display_name.attr,
> > >>> +     &password_spm_display_langcode.attr,
> > >>> +     &password_spm_is_key_enabled.attr,
> > >>> +     &password_spm_signing_key.attr,
> > >>> +     &password_spm_endorsement_key.attr,
> > >>> +     &password_spm_key_mechanism.attr,
> > >>> +     &password_spm_status.attr,
> > >>> +     &password_spm_statusbin.attr,
> > >>> +     &password_spm_type.attr,
> > >>> +     &password_spm_role.attr,
> > >>> +     NULL,
> > >>> +};
> > >>> +
> > >>> +static const struct attribute_group secure_platform_attr_group =3D=
 {
> > >>> +     .attrs =3D secure_platform_attrs,
> > >>> +};
> > >>> +
> > >>> +void exit_secure_platform_attributes(void)
> > >>> +{
> > >>> +     /* remove secure platform sysfs entry and free key data*/
> > >>> +
> > >>> +     kfree(bioscfg_drv.spm_data.endorsement_key);
> > >>> +     bioscfg_drv.spm_data.endorsement_key =3D NULL;
> > >>> +
> > >>> +     kfree(bioscfg_drv.spm_data.signing_key);
> > >>> +     bioscfg_drv.spm_data.signing_key =3D NULL;
> > >>> +
> > >>> +     sysfs_remove_group(bioscfg_drv.spm_data.attr_name_kobj, &secu=
re_platform_attr_group);
> > >>> +}
> > >>> +
> > >>> +int populate_secure_platform_data(struct kobject *attr_name_kobj)
> > >>> +{
> > >>> +     /* Populate data for Secure Platform Management */
> > >>> +     bioscfg_drv.spm_data.type =3D HPWMI_SECURE_PLATFORM_TYPE;
> > >>> +     bioscfg_drv.spm_data.attr_name_kobj =3D attr_name_kobj;
> > >>> +
> > >>> +     strscpy(bioscfg_drv.spm_data.attribute_name, SPM_STR,
> > >>> +             sizeof(bioscfg_drv.spm_data.attribute_name));
> > >>> +     strscpy(bioscfg_drv.spm_data.display_name, SPM_STR_DESC,
> > >>> +             sizeof(bioscfg_drv.spm_data.display_name));
> > >>> +
> > >>> +     bioscfg_drv.spm_data.is_enabled =3D 0;
> > >>> +     bioscfg_drv.spm_data.mechanism =3D 0;
> > >>> +     bioscfg_drv.pending_reboot =3D FALSE;
> > >>> +     update_spm_state();
> > >>> +
> > >>> +     bioscfg_drv.spm_data.endorsement_key =3D NULL;
> > >>> +     bioscfg_drv.spm_data.signing_key =3D NULL;
> > >>> +
> > >>> +     return sysfs_create_group(attr_name_kobj, &secure_platform_at=
tr_group);
> > >>> +}
> > >>> diff --git a/drivers/platform/x86/hp/string-attributes.c b/drivers/=
platform/x86/hp/string-attributes.c
> > >>> new file mode 100644
> > >>> index 000000000000..c85688cfbccc
> > >>> --- /dev/null
> > >>> +++ b/drivers/platform/x86/hp/string-attributes.c
> > >>> @@ -0,0 +1,447 @@
> > >>> +// SPDX-License-Identifier: GPL-2.0
> > >>> +/*
> > >>> + * Functions corresponding to string type attributes under
> > >>> + * HP_WMI_BIOS_STRING_GUID for use with hp-bioscfg driver.
> > >>> + *
> > >>> + * Copyright (c) 2022 HP Development Company, L.P.
> > >>> + */
> > >>> +
> > >>> +#include "bioscfg.h"
> > >>> +
> > >>> +#define WMI_STRING_TYPE "HPBIOS_BIOSString"
> > >>> +
> > >>> +get_instance_id(string);
> > >>> +
> > >>> +static ssize_t current_value_show(struct kobject *kobj, struct kob=
j_attribute *attr, char *buf)
> > >>> +{
> > >>> +     int instance_id =3D get_string_instance_id(kobj);
> > >>> +     union acpi_object *obj =3D NULL;
> > >>> +     ssize_t ret;
> > >>> +
> > >>> +     if (instance_id < 0)
> > >>> +             return -EIO;
> > >>> +
> > >>> +     /* need to use specific instance_id and guid combination to g=
et right data */
> > >>> +     obj =3D get_wmiobj_pointer(instance_id, HP_WMI_BIOS_STRING_GU=
ID);
> > >>> +     if (!obj)
> > >>> +             return -EIO;
> > >>> +
> > >>> +     ret =3D snprintf(buf, PAGE_SIZE, "%s\n",
> > >>> +                    bioscfg_drv.string_data[instance_id].current_v=
alue);
> > >>> +
> > >>> +     kfree(obj);
> > >>> +     return ret;
> > >>> +}
> > >>> +
> > >>> +/*
> > >>> + * validate_string_input() -
> > >>> + * Validate input of current_value against min and max lengths
> > >>> + *
> > >>> + * @instance_id: The instance on which input is validated
> > >>> + * @buf: Input value
> > >>> + */
> > >>> +static int validate_string_input(int instance_id, const char *buf)
> > >>> +{
> > >>> +     int in_len =3D strlen(buf);
> > >>> +
> > >>> +     /* BIOS treats it as a read only attribute */
> > >>> +     if (bioscfg_drv.string_data[instance_id].is_readonly)
> > >>> +             return -EIO;
> > >>> +
> > >>> +     if ((in_len < bioscfg_drv.string_data[instance_id].min_length=
) ||
> > >>> +         (in_len > bioscfg_drv.string_data[instance_id].max_length=
))
> > >>> +             return -EINVAL;
> > >>> +
> > >>> +     strscpy(bioscfg_drv.string_data[instance_id].new_value,
> > >>> +             buf,
> > >>> +             sizeof(bioscfg_drv.string_data[instance_id].new_value=
));
> > >>> +
> > >>> +     return 0;
> > >>> +}
> > >>> +
> > >>> +static void update_string_value(int instance_id)
> > >>> +{
> > >>> +     /* Write settings to BIOS */
> > >>> +     strscpy(bioscfg_drv.string_data[instance_id].current_value,
> > >>> +             bioscfg_drv.string_data[instance_id].new_value,
> > >>> +             sizeof(bioscfg_drv.string_data[instance_id].current_v=
alue));
> > >>> +}
> > >>> +
> > >>> +attribute_s_property_show(display_name_language_code, string);
> > >>> +static struct kobj_attribute string_display_langcode =3D
> > >>> +             __ATTR_RO(display_name_language_code);
> > >>> +
> > >>> +attribute_s_property_show(display_name, string);
> > >>> +static struct kobj_attribute string_display_name =3D
> > >>> +             __ATTR_RO(display_name);
> > >>> +
> > >>> +attribute_property_store(current_value, string);
> > >>> +static struct kobj_attribute string_current_val =3D
> > >>> +             __ATTR_RW_MODE(current_value, 0600);
> > >>> +
> > >>> +attribute_n_property_show(min_length, string);
> > >>> +static struct kobj_attribute string_min_length =3D
> > >>> +             __ATTR_RO(min_length);
> > >>> +
> > >>> +attribute_n_property_show(max_length, string);
> > >>> +static struct kobj_attribute string_max_length =3D
> > >>> +             __ATTR_RO(max_length);
> > >>> +
> > >>> +static ssize_t type_show(struct kobject *kobj, struct kobj_attribu=
te *attr,
> > >>> +                      char *buf)
> > >>> +{
> > >>> +     return sprintf(buf, "string\n");
> > >>> +}
> > >>> +
> > >>> +static struct kobj_attribute string_type =3D
> > >>> +     __ATTR_RO(type);
> > >>> +
> > >>> +static struct attribute *string_attrs[] =3D {
> > >>> +     &string_display_langcode.attr,
> > >>> +     &string_display_name.attr,
> > >>> +     &string_current_val.attr,
> > >>> +     &string_min_length.attr,
> > >>> +     &string_max_length.attr,
> > >>> +     &string_type.attr,
> > >>> +     NULL
> > >>> +};
> > >>> +
> > >>> +static const struct attribute_group string_attr_group =3D {
> > >>> +     .attrs =3D string_attrs,
> > >>> +};
> > >>> +
> > >>> +int alloc_string_data(void)
> > >>> +{
> > >>> +     int ret =3D 0;
> > >>> +
> > >>> +     bioscfg_drv.string_instances_count =3D get_instance_count(HP_=
WMI_BIOS_STRING_GUID);
> > >>> +     bioscfg_drv.string_data =3D kcalloc(bioscfg_drv.string_instan=
ces_count,
> > >>> +                                     sizeof(struct string_data), G=
FP_KERNEL);
> > >>> +     if (!bioscfg_drv.string_data) {
> > >>> +             bioscfg_drv.string_instances_count =3D 0;
> > >>> +             ret =3D -ENOMEM;
> > >>> +     }
> > >>> +     return ret;
> > >>> +}
> > >>> +
> > >>> +/*
> > >>> + * populate_string_package_data() -
> > >>> + * Populate all properties of an instance under string attribute
> > >>> + *
> > >>> + * @elements: ACPI object with string data
> > >>> + * @instance_id: The instance to enumerate
> > >>> + * @attr_name_kobj: The parent kernel object
> > >>> + */
> > >>> +int populate_string_package_data(union acpi_object *elements, int =
instance_id,
> > >>> +                     struct kobject *attr_name_kobj)
> > >>> +{
> > >>> +     char *str_value =3D NULL;
> > >>> +     int str_len;
> > >>> +     int ret =3D 0;
> > >>> +
> > >>> +     bioscfg_drv.string_data[instance_id].type =3D HPWMI_STRING_TY=
PE;
> > >>> +     bioscfg_drv.string_data[instance_id].attr_name_kobj =3D attr_=
name_kobj;
> > >>> +
> > >>> +     ret =3D convert_hexstr_to_str(&(elements[NAME].string.pointer=
),
> > >>> +                                    elements[NAME].string.length,
> > >>> +                                    &str_value, &str_len);
> > >>> +
> > >>> +     if (ACPI_FAILURE(ret)) {
> > >>> +             pr_warn("Failed to populate string package data. Erro=
r [0%0x]\n", ret);
> > >>> +             kfree(str_value);
> > >>> +             return ret;
> > >>> +     }
> > >>> +
> > >>> +     strscpy(bioscfg_drv.string_data[instance_id].attribute_name,
> > >>> +             str_value,
> > >>> +             sizeof(bioscfg_drv.string_data[instance_id].attribute=
_name));
> > >>> +
> > >>> +     strscpy(bioscfg_drv.string_data[instance_id].display_name,
> > >>> +             str_value,
> > >>> +             sizeof(bioscfg_drv.string_data[instance_id].display_n=
ame));
> > >>> +
> > >>> +     kfree(str_value);
> > >>> +     str_value =3D NULL;
> > >>> +
> > >>> +     populate_string_elements_from_package(elements, instance_id, =
HPWMI_STRING_TYPE);
> > >>> +
> > >>> +     return sysfs_create_group(attr_name_kobj, &string_attr_group)=
;
> > >>> +}
> > >>> +
> > >>> +int populate_string_elements_from_package(union acpi_object *eleme=
nts,
> > >>> +                                        int instance_id,
> > >>> +                                        enum hp_wmi_data_type type=
)
> > >>> +{
> > >>> +     char *str_value =3D NULL;
> > >>> +     int value_len;
> > >>> +     int status =3D 0;
> > >>> +     u32 size =3D 0;
> > >>> +     u32 int_value;
> > >>> +     int elem =3D 0;
> > >>> +     int reqs;
> > >>> +     int eloc;
> > >>> +
> > >>> +     if (!elements)
> > >>> +             return -EINVAL;
> > >>> +
> > >>> +     strscpy(bioscfg_drv.string_data[instance_id].display_name_lan=
guage_code,
> > >>> +             LANG_CODE_STR,
> > >>> +             sizeof(bioscfg_drv.string_data[instance_id].display_n=
ame_language_code));
> > >>> +
> > >>> +     for (elem =3D 1, eloc =3D 1; elem < hp_wmi_elements_count[typ=
e]; elem++, eloc++) {
> > >>> +
> > >>> +             switch (elements[elem].type) {
> > >>> +             case ACPI_TYPE_STRING:
> > >>> +
> > >>> +                     if (elem !=3D PREREQUISITES) {
> > >>> +                             status =3D convert_hexstr_to_str(&ele=
ments[elem].string.pointer,
> > >>> +                                                            elemen=
ts[elem].string.length,
> > >>> +                                                            &str_v=
alue, &value_len);
> > >>> +
> > >>> +                             if (ACPI_FAILURE(status))
> > >>> +                                     continue;
> > >>> +                     }
> > >>> +                     break;
> > >>> +             case ACPI_TYPE_INTEGER:
> > >>> +                     int_value =3D (u32)elements[elem].integer.val=
ue;
> > >>> +                     break;
> > >>> +             default:
> > >>> +                     pr_warn("Unsupported object type [%d]\n", ele=
ments[elem].type);
> > >>> +                     continue;
> > >>> +             }
> > >>> +
> > >>> +             /*
> > >>> +              * Stop if extra counter is greater than total number
> > >>> +              * of elements for string type
> > >>> +              */
> > >>> +             if (eloc =3D=3D hp_wmi_elements_count[type])
> > >>> +                     goto exit_string_package;
> > >>> +
> > >>> +             /* Assign appropriate element value to corresponding =
field*/
> > >>> +             switch (eloc) {
> > >>> +             case VALUE:
> > >>> +                     strscpy(bioscfg_drv.string_data[instance_id].=
current_value,
> > >>> +                             str_value, sizeof(bioscfg_drv.string_=
data[instance_id].current_value));
> > >>> +                     break;
> > >>> +             case PATH:
> > >>> +                     strscpy(bioscfg_drv.string_data[instance_id].=
path, str_value,
> > >>> +                             sizeof(bioscfg_drv.string_data[instan=
ce_id].path));
> > >>> +                     break;
> > >>> +             case IS_READONLY:
> > >>> +                     bioscfg_drv.string_data[instance_id].is_reado=
nly =3D int_value;
> > >>> +                     break;
> > >>> +             case DISPLAY_IN_UI:
> > >>> +                     bioscfg_drv.string_data[instance_id].display_=
in_ui =3D int_value;
> > >>> +                     break;
> > >>> +             case REQUIRES_PHYSICAL_PRESENCE:
> > >>> +                     bioscfg_drv.string_data[instance_id].requires=
_physical_presence =3D int_value;
> > >>> +                     break;
> > >>> +             case SEQUENCE:
> > >>> +                     bioscfg_drv.string_data[instance_id].sequence=
 =3D int_value;
> > >>> +                     break;
> > >>> +             case PREREQUISITE_SIZE:
> > >>> +                     bioscfg_drv.string_data[instance_id].prerequi=
sitesize =3D int_value;
> > >>> +                     if (size > 20)
> > >>> +                             pr_warn("Prerequisites size value exc=
eeded the maximum number of elements supported or data may be malformed\n")=
;
> > >>> +
> > >>> +                     /*
> > >>> +                      * prerequisites element is omitted when
> > >>> +                      * prerequisitesSize value is zero.
> > >>> +                      */
> > >>> +                     if (int_value =3D=3D 0)
> > >>> +                             eloc++;
> > >>> +                     break;
> > >>> +             case PREREQUISITES:
> > >>> +                     size =3D bioscfg_drv.string_data[instance_id]=
.prerequisitesize;
> > >>> +
> > >>> +                     for (reqs =3D 0; reqs < size; reqs++) {
> > >>> +                             status =3D convert_hexstr_to_str(&ele=
ments[elem].string.pointer,
> > >>> +                                                            elemen=
ts[elem].string.length,
> > >>> +                                                            &str_v=
alue, &value_len);
> > >>> +
> > >>> +                             if (ACPI_FAILURE(status))
> > >>> +                                     continue;
> > >>> +                             pr_warn("Prerequisite String  value [=
%s]\n", str_value);
> > >>> +
> > >>> +                             strlcat(bioscfg_drv.string_data[insta=
nce_id].prerequisites,
> > >>> +                                     str_value,
> > >>> +                                     sizeof(bioscfg_drv.string_dat=
a[instance_id].prerequisites));
> > >>> +
> > >>> +                             if (reqs !=3D (size - 1))
> > >>> +                                     strlcat(bioscfg_drv.string_da=
ta[instance_id].prerequisites, ";",
> > >>> +                                             sizeof(bioscfg_drv.st=
ring_data[instance_id].prerequisites));
> > >>> +
> > >>> +                             kfree(str_value);
> > >>> +                             str_value =3D NULL;
> > >>> +                     }
> > >>> +                     break;
> > >>> +
> > >>> +             case SECURITY_LEVEL:
> > >>> +                     bioscfg_drv.string_data[instance_id].security=
_level =3D int_value;
> > >>> +                     break;
> > >>> +             case STR_MIN_LENGTH:
> > >>> +                     bioscfg_drv.string_data[instance_id].min_leng=
th =3D int_value;
> > >>> +                     break;
> > >>> +             case STR_MAX_LENGTH:
> > >>> +                     bioscfg_drv.string_data[instance_id].max_leng=
th =3D int_value;
> > >>> +                     break;
> > >>> +             default:
> > >>> +                     pr_warn("Invalid element: %d found in String =
attribute or data may be malformed\n", elem);
> > >>> +                     break;
> > >>> +             }
> > >>> +             kfree(str_value);
> > >>> +             str_value =3D NULL;
> > >>> +     }
> > >>> +exit_string_package:
> > >>> +     kfree(str_value);
> > >>> +     str_value =3D NULL;
> > >>> +
> > >>> +     return 0;
> > >>> +}
> > >>> +
> > >>> +/*
> > >>> + * populate_string_data() -
> > >>> + * Populate all properties of an instance under string attribute
> > >>> + *
> > >>> + * @string_obj: ACPI object with string data
> > >>> + * @instance_id: The instance to enumerate
> > >>> + * @attr_name_kobj: The parent kernel object
> > >>> + */
> > >>> +int populate_string_buffer_data(union acpi_object *string_obj, int=
 instance_id, struct kobject *attr_name_kobj)
> > >>> +{
> > >>> +     bioscfg_drv.string_data[instance_id].type =3D HPWMI_STRING_TY=
PE;
> > >>> +     bioscfg_drv.string_data[instance_id].attr_name_kobj =3D attr_=
name_kobj;
> > >>> +     strscpy(bioscfg_drv.string_data[instance_id].attribute_name,
> > >>> +             attr_name_kobj->name,
> > >>> +             sizeof(bioscfg_drv.string_data[instance_id].attribute=
_name));
> > >>> +
> > >>> +     strscpy(bioscfg_drv.string_data[instance_id].display_name,
> > >>> +             attr_name_kobj->name,
> > >>> +             sizeof(bioscfg_drv.string_data[instance_id].display_n=
ame));
> > >>> +     /* Populate string elements */
> > >>> +
> > >>> +     populate_string_elements_from_buffer(string_obj, instance_id,=
 HPWMI_STRING_TYPE);
> > >>> +
> > >>> +     return sysfs_create_group(attr_name_kobj, &string_attr_group)=
;
> > >>> +}
> > >>> +
> > >>> +int populate_string_elements_from_buffer(union acpi_object *string=
_obj, int instance_id, enum hp_wmi_data_type type)
> > >>> +{
> > >>> +     int status;
> > >>> +     char *str =3D NULL;
> > >>> +     int elem;
> > >>> +     int reqs;
> > >>> +     int int_value;
> > >>> +     int size =3D 0;
> > >>> +
> > >>> +     strscpy(bioscfg_drv.string_data[instance_id].display_name_lan=
guage_code,
> > >>> +             LANG_CODE_STR,
> > >>> +             sizeof(bioscfg_drv.string_data[instance_id].display_n=
ame_language_code));
> > >>> +
> > >>> +     for (elem =3D 1; elem < 3; elem++) {
> > >>> +             status =3D get_string_from_buffer((u16 **)&string_obj=
->buffer.pointer, &str);
> > >>> +             if (ACPI_FAILURE(status))
> > >>> +                     continue;
> > >>> +
> > >>> +             switch (elem) {
> > >>> +             case VALUE:
> > >>> +                     strscpy(bioscfg_drv.string_data[instance_id].=
current_value,
> > >>> +                             str, sizeof(bioscfg_drv.string_data[i=
nstance_id].current_value));
> > >>> +                     break;
> > >>> +             case PATH:
> > >>> +                     strscpy(bioscfg_drv.string_data[instance_id].=
path, str, sizeof(bioscfg_drv.string_data[instance_id].path));
> > >>> +                     break;
> > >>> +             default:
> > >>> +                     pr_warn("Invalid element: %d found in String =
attribute or data may be malformed\n", elem);
> > >>> +                     break;
> > >>> +             }
> > >>> +             kfree(str);
> > >>> +             str =3D NULL;
> > >>> +     }
> > >>> +
> > >>> +     for (elem =3D 3; elem < hp_wmi_elements_count[type]; elem++) =
{
> > >>> +
> > >>> +             if (elem !=3D PREREQUISITES)
> > >>> +                     status =3D get_integer_from_buffer((int **)&s=
tring_obj->buffer.pointer, (int *)&int_value);
> > >>> +
> > >>> +             if (ACPI_FAILURE(status))
> > >>> +                     continue;
> > >>> +
> > >>> +             switch (elem) {
> > >>> +             case IS_READONLY:
> > >>> +                     bioscfg_drv.string_data[instance_id].is_reado=
nly =3D int_value;
> > >>> +                     break;
> > >>> +             case DISPLAY_IN_UI:
> > >>> +                     bioscfg_drv.string_data[instance_id].display_=
in_ui =3D int_value;
> > >>> +                     break;
> > >>> +             case REQUIRES_PHYSICAL_PRESENCE:
> > >>> +                     bioscfg_drv.string_data[instance_id].requires=
_physical_presence =3D int_value;
> > >>> +                     break;
> > >>> +             case SEQUENCE:
> > >>> +                     bioscfg_drv.string_data[instance_id].sequence=
 =3D int_value;
> > >>> +                     break;
> > >>> +             case PREREQUISITE_SIZE:
> > >>> +                     bioscfg_drv.string_data[instance_id].prerequi=
sitesize =3D int_value;
> > >>> +                     if (int_value > 20)
> > >>> +                             pr_warn("Prerequisites size value exc=
eeded the maximum number of elements supported or data may be malformed\n")=
;
> > >>> +                     break;
> > >>> +             case PREREQUISITES:
> > >>> +                     size =3D bioscfg_drv.string_data[instance_id]=
.prerequisitesize;
> > >>> +                     for (reqs =3D 0; reqs < size; reqs++) {
> > >>> +                             status =3D get_string_from_buffer((u1=
6 **)&string_obj->buffer.pointer, &str);
> > >>> +                             if (ACPI_FAILURE(status))
> > >>> +                                     continue;
> > >>> +
> > >>> +                             strlcat(bioscfg_drv.string_data[insta=
nce_id].prerequisites,
> > >>> +                                     str,
> > >>> +                                     sizeof(bioscfg_drv.string_dat=
a[instance_id].prerequisites));
> > >>> +
> > >>> +                             if (reqs !=3D (size - 1))
> > >>> +                                     strlcat(bioscfg_drv.string_da=
ta[instance_id].prerequisites, ";",
> > >>> +                                             sizeof(bioscfg_drv.st=
ring_data[instance_id].prerequisites));
> > >>> +
> > >>> +                             kfree(str);
> > >>> +                             str =3D NULL;
> > >>> +                     }
> > >>> +                     break;
> > >>> +             case SECURITY_LEVEL:
> > >>> +                     bioscfg_drv.string_data[instance_id].security=
_level =3D int_value;
> > >>> +                     break;
> > >>> +             case STR_MIN_LENGTH:
> > >>> +                     bioscfg_drv.string_data[instance_id].min_leng=
th =3D int_value;
> > >>> +                     break;
> > >>> +             case STR_MAX_LENGTH:
> > >>> +                     bioscfg_drv.string_data[instance_id].max_leng=
th =3D int_value;
> > >>> +                     break;
> > >>> +             default:
> > >>> +                     pr_warn("Invalid element: %d found in String =
attribute or data may be malformed\n", elem);
> > >>> +                     break;
> > >>> +             }
> > >>> +             kfree(str);
> > >>> +             str =3D NULL;
> > >>> +     }
> > >>> +     kfree(str);
> > >>> +     str =3D NULL;
> > >>> +
> > >>> +     return 0;
> > >>> +}
> > >>> +
> > >>> +/*
> > >>> + * exit_string_attributes() - Clear all attribute data
> > >>> + *
> > >>> + * Clears all data allocated for this group of attributes
> > >>> + */
> > >>> +void exit_string_attributes(void)
> > >>> +{
> > >>> +     int instance_id;
> > >>> +
> > >>> +     for (instance_id =3D 0; instance_id < bioscfg_drv.string_inst=
ances_count; instance_id++) {
> > >>> +             if (bioscfg_drv.string_data[instance_id].attr_name_ko=
bj)
> > >>> +                     sysfs_remove_group(bioscfg_drv.string_data[in=
stance_id].attr_name_kobj,
> > >>> +                                                             &stri=
ng_attr_group);
> > >>> +     }
> > >>> +     bioscfg_drv.string_instances_count =3D 0;
> > >>> +
> > >>> +     kfree(bioscfg_drv.string_data);
> > >>> +     bioscfg_drv.string_data =3D NULL;
> > >>> +}
> > >>> diff --git a/drivers/platform/x86/hp/sureadmin-attributes.c b/drive=
rs/platform/x86/hp/sureadmin-attributes.c
> > >>> new file mode 100644
> > >>> index 000000000000..dba5f94e8c9a
> > >>> --- /dev/null
> > >>> +++ b/drivers/platform/x86/hp/sureadmin-attributes.c
> > >>> @@ -0,0 +1,984 @@
> > >>> +// SPDX-License-Identifier: GPL-2.0
> > >>> +/*
> > >>> + * Functions corresponding to sure admin object type attributes un=
der
> > >>> + * BIOS for use with hp-bioscfg driver
> > >>> + *
> > >>> + *  Copyright (c) 2022 HP Development Company, L.P.
> > >>> + */
> > >>> +
> > >>> +#include "bioscfg.h"
> > >>> +
> > >>> +static int bios_settings_size;
> > >>> +static int buf_alloc_size;
> > >>> +static char *bios_settings_buffer;
> > >>> +
> > >>> +const char *hp_wmi_classes[] =3D {
> > >>> +     "HPBIOS_BIOSString",
> > >>> +     "HPBIOS_BIOSInteger",
> > >>> +     "HPBIOS_BIOSEnumeration",
> > >>> +     "HPBIOS_BIOSOrderedList",
> > >>> +     "HPBIOS_BIOSPassword"
> > >>> +};
> > >>> +
> > >>> +get_instance_id_for_attribute(string);
> > >>> +get_instance_id_for_attribute(integer);
> > >>> +get_instance_id_for_attribute(enumeration);
> > >>> +get_instance_id_for_attribute(ordered_list);
> > >>> +
> > >>> +static ssize_t sure_admin_settings_write(struct file *filp, struct=
 kobject *kobj,
> > >>> +                                      struct bin_attribute *attr,
> > >>> +                                      char *buf, loff_t off, size_=
t count)
> > >>> +{
> > >>> +     int status =3D 0;
> > >>> +     char *part =3D NULL;
> > >>> +     char *attr_name =3D NULL;
> > >>> +     char *attr_value =3D NULL;
> > >>> +     int part_len =3D 0;
> > >>> +     unsigned short *buffer =3D NULL;
> > >>> +     unsigned short *tmpstr =3D NULL;
> > >>> +     int buffer_size =3D (count + strlen(UTF_PREFIX)) * sizeof(uns=
igned short);
> > >>> +
> > >>> +     buffer =3D kmalloc(buffer_size, GFP_KERNEL);
> > >>> +     if (!buffer)
> > >>> +             return -ENOMEM;
> > >>> +
> > >>> +     tmpstr =3D buffer;
> > >>> +     part =3D strsep(&buf, ",");
> > >>> +     if (!part) {
> > >>> +             status =3D -EINVAL;
> > >>> +             goto exit_settings;
> > >>> +     }
> > >>> +     // Save attr_name
> > >>> +     attr_name =3D kmalloc(strlen(part) + 1, GFP_KERNEL);
> > >>> +     if (!attr_name) {
> > >>> +             status =3D -EINVAL;
> > >>> +             goto exit_settings;
> > >>> +     }
> > >>> +     strncpy(attr_name, part, strlen(part));
> > >>> +
> > >>> +     tmpstr =3D ascii_to_utf16_unicode(tmpstr, part);
> > >>> +     part =3D strsep(&buf, ",");
> > >>> +     if (!part) {
> > >>> +             status =3D -EINVAL;
> > >>> +             goto exit_settings;
> > >>> +     }
> > >>> +
> > >>> +     part_len =3D strlen(part);
> > >>> +
> > >>> +     /* Add extra buffer space when encountering an empty string *=
/
> > >>> +     if (!part_len) {
> > >>> +             buffer_size +=3D sizeof(unsigned short);
> > >>> +             part_len +=3D sizeof(unsigned short);
> > >>> +     }
> > >>> +
> > >>> +     // Save attr_value
> > >>> +     attr_value =3D kmalloc(part_len + 1, GFP_KERNEL);
> > >>> +     if (!attr_value) {
> > >>> +             status =3D -EINVAL;
> > >>> +             goto exit_settings;
> > >>> +     }
> > >>> +     strncpy(attr_value, part, part_len);
> > >>> +
> > >>> +     tmpstr =3D ascii_to_utf16_unicode(tmpstr, part);
> > >>> +     part =3D strsep(&buf, ",");
> > >>> +     if (!part) {
> > >>> +             status =3D -EINVAL;
> > >>> +             goto exit_settings;
> > >>> +     }
> > >>> +     part_len =3D strlen(part) - 1;
> > >>> +     part[part_len] =3D '\0';
> > >>> +
> > >>> +     if (strncmp(part, BEAM_PREFIX, strlen(BEAM_PREFIX)) =3D=3D 0)=
 {
> > >>> +            /*
> > >>> +             * BEAM_PREFIX is append to buffer when a signature
> > >>> +             * is provided and Sure Admin is enabled in BIOS
> > >>> +             */
> > >>> +             // BEAM_PREFIX found, convert part to unicode
> > >>> +             tmpstr =3D ascii_to_utf16_unicode(tmpstr, part);
> > >>> +             // decrease buffer size allocated initially for UTF_P=
REFIX
> > >>> +             buffer_size -=3D strlen(UTF_PREFIX) * sizeof(unsigned=
 short);
> > >>> +     } else {
> > >>> +             /*
> > >>> +              * UTF-16 prefix is append to the * buffer when a BIO=
S
> > >>> +              * admin password is configured in BIOS
> > >>> +              */
> > >>> +
> > >>> +             // append UTF_PREFIX to part and then convert it to u=
nicode
> > >>> +             part =3D kasprintf(GFP_KERNEL, "%s%s", UTF_PREFIX, pa=
rt);
> > >>> +             if (!part)
> > >>> +                     goto exit_settings;
> > >>> +
> > >>> +             tmpstr =3D ascii_to_utf16_unicode(tmpstr, part);
> > >>> +             kfree(part);
> > >>> +     }
> > >>> +
> > >>> +     part =3D strsep(&buf, ",");
> > >>> +     if (part) {
> > >>> +             status =3D -EINVAL;
> > >>> +             goto exit_settings;
> > >>> +     }
> > >>> +
> > >>> +     status =3D hp_wmi_set_bios_setting(buffer, buffer_size);
> > >>> +     if (ACPI_FAILURE(status)) {
> > >>> +             status =3D -EINVAL;
> > >>> +             goto exit_settings;
> > >>> +     }
> > >>> +
> > >>> +     if (attr_name =3D=3D NULL)
> > >>> +             pr_warn("Name is null\n");
> > >>> +     if (attr_value =3D=3D NULL)
> > >>> +             pr_warn("Value is null\n");
> > >>> +
> > >>> +     update_attribute_value(attr_name, attr_value);
> > >>> +
> > >>> +
> > >>> +exit_settings:
> > >>> +     kfree(buffer);
> > >>> +     kfree(attr_name);
> > >>> +     kfree(attr_value);
> > >>> +
> > >>> +     if (ACPI_SUCCESS(status))
> > >>> +             return count;
> > >>> +
> > >>> +     return status;
> > >>> +}
> > >>> +
> > >>> +int update_attribute_value(char *attr_name, char *attr_value)
> > >>> +{
> > >>> +     int instance =3D -EIO;
> > >>> +     int int_val;
> > >>> +     int ret;
> > >>> +
> > >>> +     if (!attr_name || !attr_value)
> > >>> +             return -EIO;
> > >>> +
> > >>> +     /* update value for the attribute */
> > >>> +     instance =3D get_instance_id_for_string(attr_name);
> > >>> +     if (instance >=3D 0) {
> > >>> +             strscpy(bioscfg_drv.string_data[instance].current_val=
ue,
> > >>> +                     attr_value,
> > >>> +                     sizeof(bioscfg_drv.string_data[instance].curr=
ent_value));
> > >>> +             goto exit_update_attribute;
> > >>> +     }
> > >>> +
> > >>> +     instance =3D get_instance_id_for_integer(attr_name);
> > >>> +     if (instance >=3D 0) {
> > >>> +             ret =3D kstrtoint(attr_value, 10, &int_val);
> > >>> +             if (!ret)
> > >>> +                     bioscfg_drv.integer_data[instance].current_va=
lue =3D int_val;
> > >>> +             goto exit_update_attribute;
> > >>> +     }
> > >>> +
> > >>> +     instance =3D get_instance_id_for_enumeration(attr_name);
> > >>> +     if (instance >=3D 0) {
> > >>> +             strscpy(bioscfg_drv.enumeration_data[instance].curren=
t_value,
> > >>> +                     attr_value,
> > >>> +                     sizeof(bioscfg_drv.enumeration_data[instance]=
.current_value));
> > >>> +             goto exit_update_attribute;
> > >>> +     }
> > >>> +     instance =3D get_instance_id_for_ordered_list(attr_name);
> > >>> +     if (instance >=3D 0)
> > >>> +             strscpy(bioscfg_drv.ordered_list_data[instance].curre=
nt_value,
> > >>> +                     attr_value,
> > >>> +                     sizeof(bioscfg_drv.ordered_list_data[instance=
].current_value));
> > >>> +
> > >>> +exit_update_attribute:
> > >>> +     return instance;
> > >>> +}
> > >>> +
> > >>> +static ssize_t sure_admin_settings_read(struct file *filp, struct =
kobject *kobj,
> > >>> +                                     struct bin_attribute *attr, c=
har *buf,
> > >>> +                                     loff_t off, size_t count)
> > >>> +{
> > >>> +     ssize_t ret;
> > >>> +
> > >>> +     /* clear the buffer when offset is pointing to the last posit=
ion */
> > >>> +     if (off >=3D bios_settings_size && bios_settings_size > 0) {
> > >>> +             hp_bios_settings_free_buffer();
> > >>> +             return 0;
> > >>> +     }
> > >>> +
> > >>> +     /* clear the buffer whenever the read starts from the first p=
osition */
> > >>> +     if (off =3D=3D 0 && bios_settings_size > 0)
> > >>> +             hp_bios_settings_free_buffer();
> > >>> +
> > >>> +     if (bios_settings_size =3D=3D 0)
> > >>> +             hp_bios_settings_fill_buffer();
> > >>> +
> > >>> +     mutex_lock(&bioscfg_drv.mutex);
> > >>> +     ret =3D memory_read_from_buffer(buf, count, &off, bios_settin=
gs_buffer,
> > >>> +                                   bios_settings_size);
> > >>> +     mutex_unlock(&bioscfg_drv.mutex);
> > >>> +
> > >>> +     return ret;
> > >>> +}
> > >>> +
> > >>> +HPWMI_BINATTR_RW(sure_admin, settings, 0);
> > >>> +
> > >>> +static struct bin_attribute *sure_admin_binattrs[] =3D {
> > >>> +     &sure_admin_settings,
> > >>> +     NULL,
> > >>> +};
> > >>> +
> > >>> +static ssize_t type_show(struct kobject *kobj, struct kobj_attribu=
te *attr,
> > >>> +                      char *buf)
> > >>> +{
> > >>> +     return sprintf(buf, "sure-admin\n");
> > >>> +}
> > >>> +static struct kobj_attribute sure_admin_type =3D __ATTR_RO(type);
> > >>> +
> > >>> +static ssize_t display_name_language_code_show(struct kobject *kob=
j,
> > >>> +                                            struct kobj_attribute =
*attr,
> > >>> +                                            char *buf)
> > >>> +{
> > >>> +     return sprintf(buf, "%s\n", LANG_CODE_STR);
> > >>> +}
> > >>> +
> > >>> +static struct kobj_attribute sure_admin_display_langcode =3D
> > >>> +             __ATTR_RO(display_name_language_code);
> > >>> +
> > >>> +
> > >>> +static ssize_t display_name_show(struct kobject *kobj,
> > >>> +                              struct kobj_attribute *attr, char *b=
uf)
> > >>> +{
> > >>> +     return sprintf(buf, "%s\n", SURE_ADMIN_DESC);
> > >>> +}
> > >>> +static struct kobj_attribute sure_admin_display_name =3D __ATTR_RO=
(display_name);
> > >>> +
> > >>> +static struct attribute *sure_admin_attrs[] =3D {
> > >>> +     &sure_admin_display_name.attr,
> > >>> +     &sure_admin_display_langcode.attr,
> > >>> +     &sure_admin_type.attr,
> > >>> +     NULL,
> > >>> +};
> > >>> +
> > >>> +static const struct attribute_group sure_admin_attr_group =3D {
> > >>> +     .attrs =3D sure_admin_attrs,
> > >>> +     .bin_attrs =3D sure_admin_binattrs,
> > >>> +};
> > >>> +
> > >>> +void exit_sure_admin_attributes(void)
> > >>> +{
> > >>> +     sysfs_remove_group(bioscfg_drv.sure_admin_attr_kobj, &sure_ad=
min_attr_group);
> > >>> +}
> > >>> +
> > >>> +int populate_sure_admin_data(struct kobject *attr_name_kobj)
> > >>> +{
> > >>> +     bioscfg_drv.sure_admin_attr_kobj =3D attr_name_kobj;
> > >>> +     return sysfs_create_group(attr_name_kobj, &sure_admin_attr_gr=
oup);
> > >>> +}
> > >>> +
> > >>> +int hp_bios_settings_fill_buffer(void)
> > >>> +{
> > >>> +     int status =3D 0;
> > >>> +     int initial_buffer_size =3D 20 * PAGE_SIZE;
> > >>> +
> > >>> +     mutex_lock(&bioscfg_drv.mutex);
> > >>> +     bios_settings_buffer =3D kmalloc(initial_buffer_size, GFP_KER=
NEL);
> > >>> +     mutex_unlock(&bioscfg_drv.mutex);
> > >>> +     if (!bios_settings_buffer)
> > >>> +             return -ENOMEM;
> > >>> +
> > >>> +     mutex_lock(&bioscfg_drv.mutex);
> > >>> +     buf_alloc_size =3D ksize(bios_settings_buffer);
> > >>> +     memset(bios_settings_buffer, 0x00, buf_alloc_size);
> > >>> +     bios_settings_size =3D snprintf(bios_settings_buffer,
> > >>> +                                     buf_alloc_size, "[\n");
> > >>> +     mutex_unlock(&bioscfg_drv.mutex);
> > >>> +
> > >>> +     status =3D append_read_settings(HPWMI_STRING_TYPE,
> > >>> +                                        &bios_settings_buffer,
> > >>> +                                        &bios_settings_size,
> > >>> +                                        &buf_alloc_size);
> > >>> +     if (ACPI_FAILURE(status))
> > >>> +             pr_err("error 0x%x occurred retrieving string instanc=
es\n", status);
> > >>> +
> > >>> +     status =3D append_read_settings(HPWMI_INTEGER_TYPE,
> > >>> +                                        &bios_settings_buffer,
> > >>> +                                        &bios_settings_size,
> > >>> +                                        &buf_alloc_size);
> > >>> +     if (ACPI_FAILURE(status))
> > >>> +             pr_err("error 0x%x occurred retrieving integer instan=
ces\n", status);
> > >>> +
> > >>> +     status =3D append_read_settings(HPWMI_ENUMERATION_TYPE,
> > >>> +                                        &bios_settings_buffer,
> > >>> +                                        &bios_settings_size,
> > >>> +                                        &buf_alloc_size);
> > >>> +     if (ACPI_FAILURE(status))
> > >>> +             pr_err("error 0x%x occurred retrieving enumeration in=
stances\n", status);
> > >>> +
> > >>> +     status =3D append_read_settings(HPWMI_ORDERED_LIST_TYPE,
> > >>> +                                        &bios_settings_buffer,
> > >>> +                                        &bios_settings_size,
> > >>> +                                        &buf_alloc_size);
> > >>> +     if (ACPI_FAILURE(status))
> > >>> +             pr_err("error 0x%x occurred retrieving ordered list i=
nstances\n", status);
> > >>> +
> > >>> +     status =3D append_read_settings(HPWMI_PASSWORD_TYPE,
> > >>> +                                        &bios_settings_buffer,
> > >>> +                                        &bios_settings_size,
> > >>> +                                        &buf_alloc_size);
> > >>> +     if (ACPI_FAILURE(status))
> > >>> +             pr_err("error 0x%x occurred retrieving password list =
instances\n", status);
> > >>> +
> > >>> +     mutex_lock(&bioscfg_drv.mutex);
> > >>> +     /*
> > >>> +      * remove trailing comma
> > >>> +      */
> > >>> +     if (bios_settings_size >=3D 3) {
> > >>> +             if (bios_settings_buffer[bios_settings_size - 2] =3D=
=3D ',')
> > >>> +                     bios_settings_buffer[bios_settings_size - 2] =
=3D ' ';
> > >>> +     }
> > >>> +     bios_settings_size =3D snprintf(bios_settings_buffer,
> > >>> +                                     buf_alloc_size, "%s]\n",
> > >>> +                                     bios_settings_buffer);
> > >>> +     mutex_unlock(&bioscfg_drv.mutex);
> > >>> +
> > >>> +     return bios_settings_size;
> > >>> +}
> > >>> +
> > >>> +int hp_bios_settings_free_buffer(void)
> > >>> +{
> > >>> +     mutex_lock(&bioscfg_drv.mutex);
> > >>> +     kfree(bios_settings_buffer);
> > >>> +     bios_settings_size =3D 0;
> > >>> +     buf_alloc_size =3D 0;
> > >>> +     mutex_unlock(&bioscfg_drv.mutex);
> > >>> +
> > >>> +     return 0;
> > >>> +}
> > >>> +int hp_bios_settings_realloc_buffer(char **buf, int *buf_size, int=
 *alloc_size)
> > >>> +{
> > >>> +     int new_buffer_size;
> > >>> +     char *new_buf =3D NULL;
> > >>> +     int ret =3D 0;
> > >>> +
> > >>> +     if (*buf_size + PAGE_SIZE >=3D *alloc_size) {
> > >>> +             new_buffer_size =3D buf_alloc_size + 2 * PAGE_SIZE;
> > >>> +
> > >>> +             mutex_lock(&bioscfg_drv.mutex);
> > >>> +             new_buf =3D krealloc(*buf, new_buffer_size, GFP_KERNE=
L);
> > >>> +             mutex_unlock(&bioscfg_drv.mutex);
> > >>> +             if (new_buf) {
> > >>> +                     mutex_lock(&bioscfg_drv.mutex);
> > >>> +                     *buf =3D new_buf;
> > >>> +                     *alloc_size =3D ksize(new_buf);
> > >>> +                     mutex_unlock(&bioscfg_drv.mutex);
> > >>> +             } else {
> > >>> +                     hp_bios_settings_free_buffer();
> > >>> +                     ret =3D -ENOMEM;
> > >>> +             }
> > >>> +     }
> > >>> +
> > >>> +     return ret;
> > >>> +}
> > >>> +
> > >>> +int append_read_settings(enum hp_wmi_data_type type, char **buf,
> > >>> +                      int *buf_size, int *alloc_size)
> > >>> +{
> > >>> +     int ret =3D 0;
> > >>> +     int status =3D 0;
> > >>> +     int instance =3D 0;
> > >>> +     int instance_count =3D 0;
> > >>> +
> > >>> +     switch (type) {
> > >>> +     case HPWMI_STRING_TYPE:
> > >>> +             instance_count =3D bioscfg_drv.string_instances_count=
;
> > >>> +             break;
> > >>> +     case HPWMI_INTEGER_TYPE:
> > >>> +             instance_count =3D bioscfg_drv.integer_instances_coun=
t;
> > >>> +             break;
> > >>> +     case HPWMI_ENUMERATION_TYPE:
> > >>> +             instance_count =3D bioscfg_drv.enumeration_instances_=
count;
> > >>> +             break;
> > >>> +     case HPWMI_ORDERED_LIST_TYPE:
> > >>> +             instance_count =3D bioscfg_drv.ordered_list_instances=
_count;
> > >>> +             break;
> > >>> +     case HPWMI_PASSWORD_TYPE:
> > >>> +             instance_count =3D bioscfg_drv.password_instances_cou=
nt;
> > >>> +             break;
> > >>> +     default:
> > >>> +             return -EINVAL;
> > >>> +     }
> > >>> +
> > >>> +     /*
> > >>> +      * Query all the instances
> > >>> +      */
> > >>> +     for (instance =3D 0; instance < instance_count; instance++) {
> > >>> +             mutex_lock(&bioscfg_drv.mutex);
> > >>> +             status =3D append_read_attributes(buf, *alloc_size,
> > >>> +                                                  instance, type);
> > >>> +             if (status > 0)
> > >>> +                     *buf_size =3D status;
> > >>> +
> > >>> +             mutex_unlock(&bioscfg_drv.mutex);
> > >>> +
> > >>> +             ret =3D hp_bios_settings_realloc_buffer(buf, buf_size=
,
> > >>> +                                                   alloc_size);
> > >>> +     }
> > >>> +     return ret;
> > >>> +}
> > >>> +
> > >>> +int append_read_attributes(char **buf, int alloc_size,
> > >>> +                        int instance, enum hp_wmi_data_type type)
> > >>> +{
> > >>> +     int status =3D 0;
> > >>> +
> > >>> +     switch (type) {
> > >>> +     case HPWMI_STRING_TYPE:
> > >>> +             status =3D append_read_string_attributes(*buf, alloc_=
size,
> > >>> +                                                    instance, type=
);
> > >>> +             break;
> > >>> +     case HPWMI_INTEGER_TYPE:
> > >>> +             status =3D append_read_integer_attributes(*buf, alloc=
_size,
> > >>> +                                                     instance, typ=
e);
> > >>> +             break;
> > >>> +     case HPWMI_ENUMERATION_TYPE:
> > >>> +             status =3D append_read_enumeration_attributes(*buf,
> > >>> +                                                         alloc_siz=
e,
> > >>> +                                                         instance,=
 type);
> > >>> +             break;
> > >>> +     case HPWMI_ORDERED_LIST_TYPE:
> > >>> +             status =3D append_read_ordered_list_attributes(*buf,
> > >>> +                                                          alloc_si=
ze,
> > >>> +                                                          instance=
, type);
> > >>> +             break;
> > >>> +     case HPWMI_PASSWORD_TYPE:
> > >>> +             status =3D append_read_password_attributes(*buf,
> > >>> +                                                      alloc_size,
> > >>> +                                                      instance, ty=
pe);
> > >>> +             break;
> > >>> +     default:
> > >>> +             status =3D -EINVAL;
> > >>> +             break;
> > >>> +     }
> > >>> +     return status;
> > >>> +}
> > >>> +
> > >>> +
> > >>> +int append_read_string_attributes(char *buf, int alloc_size,
> > >>> +                               int instance,
> > >>> +                               enum hp_wmi_data_type type)
> > >>> +{
> > >>> +     int buf_size;
> > >>> +     char *part_tmp =3D NULL;
> > >>> +     char *part =3D NULL;
> > >>> +
> > >>> +     if (type >=3D ARRAY_SIZE(hp_wmi_classes) || !buf)
> > >>> +             return -EINVAL;
> > >>> +
> > >>> +     buf_size =3D snprintf(buf, alloc_size, "%s{\n", buf);
> > >>> +     buf_size =3D snprintf(buf, alloc_size, "%s\t\"Class\": \"%s\"=
,\n",
> > >>> +                         buf, hp_wmi_classes[type]);
> > >>> +
> > >>> +     buf_size =3D snprintf(buf, alloc_size,
> > >>> +                         "%s\t\"Name\": \"%s\",\n",
> > >>> +                         buf,
> > >>> +                         bioscfg_drv.string_data[instance].display=
_name);
> > >>> +
> > >>> +     buf_size =3D snprintf(buf, alloc_size,
> > >>> +                         "%s\t\"Value\": \"%s\",\n",
> > >>> +                         buf,
> > >>> +                         bioscfg_drv.string_data[instance].current=
_value);
> > >>> +
> > >>> +     buf_size =3D snprintf(buf, alloc_size,
> > >>> +                         "%s\t\"Path\": \"%s\",\n",
> > >>> +                         buf,
> > >>> +                         bioscfg_drv.string_data[instance].path);
> > >>> +
> > >>> +     buf_size =3D snprintf(buf, alloc_size,
> > >>> +                         "%s\t\"IsReadOnly\": %d,\n",
> > >>> +                         buf,
> > >>> +                         bioscfg_drv.string_data[instance].is_read=
only);
> > >>> +
> > >>> +     buf_size =3D snprintf(buf, alloc_size,
> > >>> +                         "%s\t\"DisplayInUI\": %d,\n",
> > >>> +                         buf,
> > >>> +                         bioscfg_drv.string_data[instance].display=
_in_ui);
> > >>> +
> > >>> +     buf_size =3D snprintf(buf, alloc_size,
> > >>> +                         "%s\t\"RequiresPhysicalPresence\": %d,\n"=
,
> > >>> +                         buf,
> > >>> +                         bioscfg_drv.string_data[instance].require=
s_physical_presence);
> > >>> +
> > >>> +     buf_size =3D snprintf(buf, alloc_size,
> > >>> +                         "%s\t\"Sequence\": %d,\n",
> > >>> +                         buf,
> > >>> +                         bioscfg_drv.string_data[instance].sequenc=
e);
> > >>> +
> > >>> +     buf_size =3D snprintf(buf, alloc_size,
> > >>> +                         "%s\t\"PrerequisiteSize\": %d,\n",
> > >>> +                         buf,
> > >>> +                         bioscfg_drv.string_data[instance].prerequ=
isitesize);
> > >>> +
> > >>> +     buf_size =3D snprintf(buf, alloc_size, "%s\t\"Prerequisites\"=
: [\n", buf);
> > >>> +
> > >>> +     if (bioscfg_drv.string_data[instance].prerequisitesize) {
> > >>> +             part_tmp =3D kstrdup(bioscfg_drv.string_data[instance=
].prerequisites,
> > >>> +                                GFP_KERNEL);
> > >>> +             part =3D strsep(&part_tmp, ";");
> > >>> +             while (part) {
> > >>> +                     buf_size =3D snprintf(buf, alloc_size, "%s\t\=
t\"%s\"", buf, part);
> > >>> +                     part =3D strsep(&part_tmp, ";");
> > >>> +                     if (part)
> > >>> +                             buf_size =3D snprintf(buf, alloc_size=
, "%s,\n", buf);
> > >>> +                     else
> > >>> +                             buf_size =3D snprintf(buf, alloc_size=
, "%s\n", buf);
> > >>> +             }
> > >>> +             kfree(part_tmp);
> > >>> +             part_tmp =3D NULL;
> > >>> +     }
> > >>> +     buf_size =3D snprintf(buf, alloc_size, "%s\t],\n", buf);
> > >>> +
> > >>> +
> > >>> +     buf_size =3D snprintf(buf, alloc_size,
> > >>> +                         "%s\t\"SecurityLevel\": %d,\n",
> > >>> +                         buf,
> > >>> +                         bioscfg_drv.string_data[instance].securit=
y_level);
> > >>> +
> > >>> +     buf_size =3D snprintf(buf, alloc_size,
> > >>> +                         "%s\t\"MinLength\": %d,\n",
> > >>> +                         buf,
> > >>> +                         bioscfg_drv.string_data[instance].min_len=
gth);
> > >>> +
> > >>> +     buf_size =3D snprintf(buf, alloc_size,
> > >>> +                         "%s\t\"MaxLength\": %d\n",
> > >>> +                         buf,
> > >>> +                         bioscfg_drv.string_data[instance].max_len=
gth);
> > >>> +
> > >>> +     return snprintf(buf, alloc_size, "%s},\n", buf);
> > >>> +}
> > >>> +
> > >>> +
> > >>> +int append_read_integer_attributes(char *buf, int alloc_size,
> > >>> +                                int instance,
> > >>> +                                enum hp_wmi_data_type type)
> > >>> +{
> > >>> +     int buf_size;
> > >>> +     char *part_tmp =3D NULL;
> > >>> +     char *part =3D NULL;
> > >>> +
> > >>> +     if (type >=3D ARRAY_SIZE(hp_wmi_classes) || !buf)
> > >>> +             return -EINVAL;
> > >>> +
> > >>> +     buf_size =3D snprintf(buf, alloc_size, "%s{\n", buf);
> > >>> +     buf_size =3D snprintf(buf, alloc_size, "%s\t\"Class\": \"%s\"=
,\n",
> > >>> +                         buf, hp_wmi_classes[type]);
> > >>> +
> > >>> +     buf_size =3D snprintf(buf, alloc_size,
> > >>> +                         "%s\t\"Name\": \"%s\",\n",
> > >>> +                         buf,
> > >>> +                         bioscfg_drv.integer_data[instance].displa=
y_name);
> > >>> +
> > >>> +     buf_size =3D snprintf(buf, alloc_size,
> > >>> +                         "%s\t\"Value\": \"%d\",\n",
> > >>> +                         buf,
> > >>> +                         bioscfg_drv.integer_data[instance].curren=
t_value);
> > >>> +
> > >>> +     buf_size =3D snprintf(buf, alloc_size,
> > >>> +                         "%s\t\"Path\": \"%s\",\n",
> > >>> +                         buf,
> > >>> +                         bioscfg_drv.integer_data[instance].path);
> > >>> +
> > >>> +     buf_size =3D snprintf(buf, alloc_size,
> > >>> +                         "%s\t\"IsReadOnly\": %d,\n",
> > >>> +                         buf,
> > >>> +                         bioscfg_drv.integer_data[instance].is_rea=
donly);
> > >>> +
> > >>> +     buf_size =3D snprintf(buf, alloc_size,
> > >>> +                         "%s\t\"DisplayInUI\": %d,\n",
> > >>> +                         buf,
> > >>> +                         bioscfg_drv.integer_data[instance].displa=
y_in_ui);
> > >>> +
> > >>> +     buf_size =3D snprintf(buf, alloc_size,
> > >>> +                         "%s\t\"RequiresPhysicalPresence\": %d,\n"=
,
> > >>> +                         buf,
> > >>> +                         bioscfg_drv.integer_data[instance].requir=
es_physical_presence);
> > >>> +
> > >>> +     buf_size =3D snprintf(buf, alloc_size,
> > >>> +                         "%s\t\"Sequence\": %d,\n",
> > >>> +                         buf,
> > >>> +                         bioscfg_drv.integer_data[instance].sequen=
ce);
> > >>> +
> > >>> +     buf_size =3D snprintf(buf, alloc_size,
> > >>> +                         "%s\t\"PrerequisiteSize\": %d,\n",
> > >>> +                         buf,
> > >>> +                         bioscfg_drv.integer_data[instance].prereq=
uisitesize);
> > >>> +
> > >>> +     buf_size =3D snprintf(buf, alloc_size, "%s\t\"Prerequisites\"=
: [\n", buf);
> > >>> +
> > >>> +     if (bioscfg_drv.integer_data[instance].prerequisitesize) {
> > >>> +             part_tmp =3D kstrdup(bioscfg_drv.integer_data[instanc=
e].prerequisites,
> > >>> +                                GFP_KERNEL);
> > >>> +             part =3D strsep(&part_tmp, ";");
> > >>> +             while (part) {
> > >>> +                     buf_size =3D snprintf(buf, alloc_size, "%s\t\=
t\"%s\"", buf, part);
> > >>> +                     part =3D strsep(&part_tmp, ";");
> > >>> +                     if (part)
> > >>> +                             buf_size =3D snprintf(buf, alloc_size=
, "%s,\n", buf);
> > >>> +                     else
> > >>> +                             buf_size =3D snprintf(buf, alloc_size=
, "%s\n", buf);
> > >>> +             }
> > >>> +             kfree(part_tmp);
> > >>> +             part_tmp =3D NULL;
> > >>> +     }
> > >>> +     buf_size =3D snprintf(buf, alloc_size, "%s\t],\n", buf);
> > >>> +
> > >>> +     buf_size =3D snprintf(buf, alloc_size,
> > >>> +                         "%s\t\"SecurityLevel\": %d,\n",
> > >>> +                         buf,
> > >>> +                         bioscfg_drv.integer_data[instance].securi=
ty_level);
> > >>> +
> > >>> +     buf_size =3D snprintf(buf, alloc_size,
> > >>> +                         "%s\t\"LowerBound\": %d,\n",
> > >>> +                         buf,
> > >>> +                         bioscfg_drv.integer_data[instance].lower_=
bound);
> > >>> +
> > >>> +     buf_size =3D snprintf(buf, alloc_size,
> > >>> +                         "%s\t\"UpperBound\": %d,\n",
> > >>> +                         buf,
> > >>> +                         bioscfg_drv.integer_data[instance].upper_=
bound);
> > >>> +
> > >>> +     buf_size =3D snprintf(buf, alloc_size,
> > >>> +                         "%s\t\"IntValue\": %d\n",
> > >>> +                         buf,
> > >>> +                         bioscfg_drv.integer_data[instance].scalar=
_increment);
> > >>> +
> > >>> +     return snprintf(buf, alloc_size, "%s},\n", buf);
> > >>> +}
> > >>> +
> > >>> +int append_read_enumeration_attributes(char *buf, int alloc_size,
> > >>> +                                    int instance,
> > >>> +                                    enum hp_wmi_data_type type)
> > >>> +{
> > >>> +     int buf_size;
> > >>> +     char *part_tmp =3D NULL;
> > >>> +     char *part =3D NULL;
> > >>> +
> > >>> +     if (type >=3D ARRAY_SIZE(hp_wmi_classes) || !buf)
> > >>> +             return -EINVAL;
> > >>> +
> > >>> +     buf_size =3D snprintf(buf, alloc_size, "%s{\n", buf);
> > >>> +     buf_size =3D snprintf(buf, alloc_size, "%s\t\"Class\": \"%s\"=
,\n",
> > >>> +                         buf, hp_wmi_classes[type]);
> > >>> +
> > >>> +     buf_size =3D snprintf(buf, alloc_size,
> > >>> +                         "%s\t\"Name\": \"%s\",\n",
> > >>> +                         buf,
> > >>> +                         bioscfg_drv.enumeration_data[instance].di=
splay_name);
> > >>> +
> > >>> +     buf_size =3D snprintf(buf, alloc_size,
> > >>> +                         "%s\t\"Path\": \"%s\",\n",
> > >>> +                         buf,
> > >>> +                         bioscfg_drv.enumeration_data[instance].pa=
th);
> > >>> +
> > >>> +     buf_size =3D snprintf(buf, alloc_size,
> > >>> +                         "%s\t\"IsReadOnly\": %d,\n",
> > >>> +                         buf,
> > >>> +                         bioscfg_drv.enumeration_data[instance].is=
_readonly);
> > >>> +
> > >>> +     buf_size =3D snprintf(buf, alloc_size,
> > >>> +                         "%s\t\"DisplayInUI\": %d,\n",
> > >>> +                         buf,
> > >>> +                         bioscfg_drv.enumeration_data[instance].di=
splay_in_ui);
> > >>> +
> > >>> +     buf_size =3D snprintf(buf, alloc_size,
> > >>> +                         "%s\t\"RequiresPhysicalPresence\": %d,\n"=
,
> > >>> +                         buf,
> > >>> +                         bioscfg_drv.enumeration_data[instance].re=
quires_physical_presence);
> > >>> +
> > >>> +     buf_size =3D snprintf(buf, alloc_size,
> > >>> +                         "%s\t\"Sequence\": %d,\n",
> > >>> +                         buf,
> > >>> +                         bioscfg_drv.enumeration_data[instance].se=
quence);
> > >>> +
> > >>> +     buf_size =3D snprintf(buf, alloc_size,
> > >>> +                         "%s\t\"PrerequisiteSize\": %d,\n",
> > >>> +                         buf,
> > >>> +                         bioscfg_drv.enumeration_data[instance].pr=
erequisitesize);
> > >>> +
> > >>> +     buf_size =3D snprintf(buf, alloc_size, "%s\t\"Prerequisites\"=
: [\n", buf);
> > >>> +
> > >>> +     if (bioscfg_drv.enumeration_data[instance].prerequisitesize) =
{
> > >>> +             part_tmp =3D kstrdup(bioscfg_drv.enumeration_data[ins=
tance].prerequisites,
> > >>> +                                GFP_KERNEL);
> > >>> +             part =3D strsep(&part_tmp, ";");
> > >>> +             while (part) {
> > >>> +                     buf_size =3D snprintf(buf, alloc_size, "%s\t\=
t\"%s\"", buf, part);
> > >>> +                     part =3D strsep(&part_tmp, ";");
> > >>> +                     if (part)
> > >>> +                             buf_size =3D snprintf(buf, alloc_size=
, "%s,\n", buf);
> > >>> +                     else
> > >>> +                             buf_size =3D snprintf(buf, alloc_size=
, "%s\n", buf);
> > >>> +             }
> > >>> +             kfree(part_tmp);
> > >>> +             part_tmp =3D NULL;
> > >>> +     }
> > >>> +     buf_size =3D snprintf(buf, alloc_size, "%s\t],\n", buf);
> > >>> +
> > >>> +     buf_size =3D snprintf(buf, alloc_size,
> > >>> +                         "%s\t\"SecurityLevel\": %d,\n",
> > >>> +                         buf,
> > >>> +                         bioscfg_drv.enumeration_data[instance].se=
curity_level);
> > >>> +
> > >>> +     buf_size =3D snprintf(buf, alloc_size,
> > >>> +                         "%s\t\"Value\": \"%s\",\n",
> > >>> +                         buf,
> > >>> +                         bioscfg_drv.enumeration_data[instance].cu=
rrent_value);
> > >>> +
> > >>> +     buf_size =3D snprintf(buf, alloc_size,
> > >>> +                         "%s\t\"Size\": %d,\n",
> > >>> +                         buf,
> > >>> +                         bioscfg_drv.enumeration_data[instance].si=
ze);
> > >>> +
> > >>> +     buf_size =3D snprintf(buf, alloc_size, "%s\t\"PossibleValues\=
": [\n", buf);
> > >>> +
> > >>> +     if (bioscfg_drv.enumeration_data[instance].size) {
> > >>> +             part_tmp =3D kstrdup(bioscfg_drv.enumeration_data[ins=
tance].possible_values,
> > >>> +                                GFP_KERNEL);
> > >>> +             part =3D strsep(&part_tmp, ";");
> > >>> +             while (part) {
> > >>> +                     buf_size =3D snprintf(buf, alloc_size, "%s\t\=
t\"%s\"", buf, part);
> > >>> +                     part =3D strsep(&part_tmp, ";");
> > >>> +                     if (part)
> > >>> +                             buf_size =3D snprintf(buf, alloc_size=
, "%s,\n", buf);
> > >>> +                     else
> > >>> +                             buf_size =3D snprintf(buf, alloc_size=
, "%s\n", buf);
> > >>> +             }
> > >>> +             kfree(part_tmp);
> > >>> +             part_tmp =3D NULL;
> > >>> +     }
> > >>> +     buf_size =3D snprintf(buf, alloc_size, "%s\t]\n", buf);
> > >>> +
> > >>> +     return snprintf(buf, alloc_size, "%s},\n", buf);
> > >>> +}
> > >>> +
> > >>> +int append_read_ordered_list_attributes(char *buf, int alloc_size,
> > >>> +                                     int instance,
> > >>> +                                     enum hp_wmi_data_type type)
> > >>> +{
> > >>> +     int buf_size;
> > >>> +     char *part_tmp =3D NULL;
> > >>> +     char *part =3D NULL;
> > >>> +
> > >>> +     if (type >=3D ARRAY_SIZE(hp_wmi_classes) || !buf)
> > >>> +             return -EINVAL;
> > >>> +
> > >>> +     buf_size =3D snprintf(buf, alloc_size, "%s{\n", buf);
> > >>> +     buf_size =3D snprintf(buf, alloc_size, "%s\t\"Class\": \"%s\"=
,\n",
> > >>> +                         buf, hp_wmi_classes[type]);
> > >>> +
> > >>> +
> > >>> +     buf_size =3D snprintf(buf, alloc_size,
> > >>> +                         "%s\t\"Name\": \"%s\",\n",
> > >>> +                         buf,
> > >>> +                         bioscfg_drv.ordered_list_data[instance].d=
isplay_name);
> > >>> +
> > >>> +     buf_size =3D snprintf(buf, alloc_size,
> > >>> +                         "%s\t\"Value\": \"%s\",\n",
> > >>> +                         buf,
> > >>> +                         bioscfg_drv.ordered_list_data[instance].c=
urrent_value);
> > >>> +
> > >>> +     buf_size =3D snprintf(buf, alloc_size,
> > >>> +                         "%s\t\"Path\": \"%s\",\n",
> > >>> +                         buf,
> > >>> +                         bioscfg_drv.ordered_list_data[instance].p=
ath);
> > >>> +
> > >>> +     buf_size =3D snprintf(buf, alloc_size,
> > >>> +                         "%s\t\"IsReadOnly\": %d,\n",
> > >>> +                         buf,
> > >>> +                         bioscfg_drv.ordered_list_data[instance].i=
s_readonly);
> > >>> +
> > >>> +     buf_size =3D snprintf(buf, alloc_size,
> > >>> +                         "%s\t\"DisplayInUI\": %d,\n",
> > >>> +                         buf,
> > >>> +                         bioscfg_drv.ordered_list_data[instance].d=
isplay_in_ui);
> > >>> +
> > >>> +     buf_size =3D snprintf(buf, alloc_size,
> > >>> +                         "%s\t\"RequiresPhysicalPresence\": %d,\n"=
,
> > >>> +                         buf,
> > >>> +                         bioscfg_drv.ordered_list_data[instance].r=
equires_physical_presence);
> > >>> +
> > >>> +     buf_size =3D snprintf(buf, alloc_size,
> > >>> +                         "%s\t\"Sequence\": %d,\n",
> > >>> +                         buf,
> > >>> +                         bioscfg_drv.ordered_list_data[instance].s=
equence);
> > >>> +
> > >>> +     buf_size =3D snprintf(buf, alloc_size,
> > >>> +                         "%s\t\"PrerequisiteSize\": %d,\n",
> > >>> +                         buf,
> > >>> +                         bioscfg_drv.ordered_list_data[instance].p=
rerequisitesize);
> > >>> +
> > >>> +     buf_size =3D snprintf(buf, alloc_size, "%s\t\"Prerequisites\"=
: [\n", buf);
> > >>> +
> > >>> +     if (bioscfg_drv.ordered_list_data[instance].prerequisitesize)=
 {
> > >>> +             part_tmp =3D kstrdup(bioscfg_drv.ordered_list_data[in=
stance].prerequisites,
> > >>> +                                GFP_KERNEL);
> > >>> +             part =3D strsep(&part_tmp, ";");
> > >>> +             while (part) {
> > >>> +                     buf_size =3D snprintf(buf, alloc_size, "%s\t\=
t\"%s\"", buf, part);
> > >>> +                     part =3D strsep(&part_tmp, ";");
> > >>> +                     if (part)
> > >>> +                             buf_size =3D snprintf(buf, alloc_size=
, "%s,\n", buf);
> > >>> +                     else
> > >>> +                             buf_size =3D snprintf(buf, alloc_size=
, "%s\n", buf);
> > >>> +             }
> > >>> +             kfree(part_tmp);
> > >>> +             part_tmp =3D NULL;
> > >>> +     }
> > >>> +     buf_size =3D snprintf(buf, alloc_size, "%s\t],\n", buf);
> > >>> +
> > >>> +     buf_size =3D snprintf(buf, alloc_size,
> > >>> +                         "%s\t\"SecurityLevel\": %d,\n",
> > >>> +                         buf,
> > >>> +                         bioscfg_drv.ordered_list_data[instance].s=
ecurity_level);
> > >>> +
> > >>> +     buf_size =3D snprintf(buf, alloc_size,
> > >>> +                         "%s\t\"Size\": %d,\n",
> > >>> +                         buf,
> > >>> +                         bioscfg_drv.ordered_list_data[instance].s=
ize);
> > >>> +
> > >>> +     buf_size =3D snprintf(buf, alloc_size, "%s\t\"Elements\": [\n=
", buf);
> > >>> +
> > >>> +     if (bioscfg_drv.ordered_list_data[instance].size) {
> > >>> +             part_tmp =3D kstrdup(bioscfg_drv.ordered_list_data[in=
stance].elements,
> > >>> +                                GFP_KERNEL);
> > >>> +             part =3D strsep(&part_tmp, ";");
> > >>> +             while (part) {
> > >>> +                     buf_size =3D snprintf(buf, alloc_size, "%s\t\=
t\"%s\"", buf, part);
> > >>> +                     part =3D strsep(&part_tmp, ";");
> > >>> +                     if (part)
> > >>> +                             buf_size =3D snprintf(buf, alloc_size=
, "%s,\n", buf);
> > >>> +                     else
> > >>> +                             buf_size =3D snprintf(buf, alloc_size=
, "%s\n", buf);
> > >>> +             }
> > >>> +             kfree(part_tmp);
> > >>> +             part_tmp =3D NULL;
> > >>> +     }
> > >>> +     buf_size =3D snprintf(buf, alloc_size, "%s\t]\n", buf);
> > >>> +
> > >>> +     return snprintf(buf, alloc_size, "%s},\n", buf);
> > >>> +}
> > >>> +
> > >>> +
> > >>> +int append_read_password_attributes(char *buf, int alloc_size,
> > >>> +                                 int instance,
> > >>> +                                 enum hp_wmi_data_type type)
> > >>> +{
> > >>> +     int buf_size;
> > >>> +     char *part_tmp =3D NULL;
> > >>> +     char *part =3D NULL;
> > >>> +
> > >>> +     if (type >=3D ARRAY_SIZE(hp_wmi_classes) || !buf)
> > >>> +             return -EINVAL;
> > >>> +
> > >>> +     buf_size =3D snprintf(buf, alloc_size, "%s{\n", buf);
> > >>> +     buf_size =3D snprintf(buf, alloc_size, "%s\t\"Class\": \"%s\"=
,\n",
> > >>> +                         buf, hp_wmi_classes[type]);
> > >>> +
> > >>> +
> > >>> +     buf_size =3D snprintf(buf, alloc_size,
> > >>> +                         "%s\t\"Name\": \"%s\",\n",
> > >>> +                         buf,
> > >>> +                         bioscfg_drv.password_data[instance].displ=
ay_name);
> > >>> +
> > >>> +     buf_size =3D snprintf(buf, alloc_size,
> > >>> +                         "%s\t\"Value\": \"%s\",\n",
> > >>> +                         buf,
> > >>> +                         bioscfg_drv.password_data[instance].curre=
nt_password);
> > >>> +
> > >>> +     buf_size =3D snprintf(buf, alloc_size,
> > >>> +                         "%s\t\"Path\": \"%s\",\n",
> > >>> +                         buf,
> > >>> +                         bioscfg_drv.password_data[instance].path)=
;
> > >>> +
> > >>> +     buf_size =3D snprintf(buf, alloc_size,
> > >>> +                         "%s\t\"IsReadOnly\": %d,\n",
> > >>> +                         buf,
> > >>> +                         bioscfg_drv.password_data[instance].is_re=
adonly);
> > >>> +
> > >>> +     buf_size =3D snprintf(buf, alloc_size,
> > >>> +                         "%s\t\"DisplayInUI\": %d,\n",
> > >>> +                         buf,
> > >>> +                         bioscfg_drv.password_data[instance].displ=
ay_in_ui);
> > >>> +
> > >>> +     buf_size =3D snprintf(buf, alloc_size,
> > >>> +                         "%s\t\"RequiresPhysicalPresence\": %d,\n"=
,
> > >>> +                         buf,
> > >>> +                         bioscfg_drv.password_data[instance].requi=
res_physical_presence);
> > >>> +
> > >>> +     buf_size =3D snprintf(buf, alloc_size,
> > >>> +                         "%s\t\"Sequence\": %d,\n",
> > >>> +                         buf,
> > >>> +                         bioscfg_drv.password_data[instance].seque=
nce);
> > >>> +
> > >>> +     buf_size =3D snprintf(buf, alloc_size,
> > >>> +                         "%s\t\"PrerequisiteSize\": %d,\n",
> > >>> +                         buf,
> > >>> +                         bioscfg_drv.password_data[instance].prere=
quisitesize);
> > >>> +
> > >>> +     buf_size =3D snprintf(buf, alloc_size, "%s\t\"Prerequisites\"=
: [\n", buf);
> > >>> +
> > >>> +     if (bioscfg_drv.password_data[instance].prerequisitesize) {
> > >>> +             part_tmp =3D kstrdup(bioscfg_drv.password_data[instan=
ce].prerequisites,
> > >>> +                                GFP_KERNEL);
> > >>> +             part =3D strsep(&part_tmp, ";");
> > >>> +             while (part) {
> > >>> +                     buf_size =3D snprintf(buf, alloc_size, "%s\t\=
t\"%s\"", buf, part);
> > >>> +                     part =3D strsep(&part_tmp, ";");
> > >>> +                     if (part)
> > >>> +                             buf_size =3D snprintf(buf, alloc_size=
, "%s,\n", buf);
> > >>> +                     else
> > >>> +                             buf_size =3D snprintf(buf, alloc_size=
, "%s\n", buf);
> > >>> +             }
> > >>> +             kfree(part_tmp);
> > >>> +             part_tmp =3D NULL;
> > >>> +     }
> > >>> +     buf_size =3D snprintf(buf, alloc_size, "%s\t],\n", buf);
> > >>> +
> > >>> +     buf_size =3D snprintf(buf, alloc_size,
> > >>> +                         "%s\t\"SecurityLevel\": %d,\n",
> > >>> +                         buf,
> > >>> +                         bioscfg_drv.password_data[instance].secur=
ity_level);
> > >>> +
> > >>> +     buf_size =3D snprintf(buf, alloc_size,
> > >>> +                         "%s\t\"MinLength\": %d,\n",
> > >>> +                         buf,
> > >>> +                         bioscfg_drv.password_data[instance].min_p=
assword_length);
> > >>> +
> > >>> +     buf_size =3D snprintf(buf, alloc_size,
> > >>> +                         "%s\t\"MaxLength\": %d,\n",
> > >>> +                         buf,
> > >>> +                         bioscfg_drv.password_data[instance].max_p=
assword_length);
> > >>> +
> > >>> +     buf_size =3D snprintf(buf, alloc_size,
> > >>> +                         "%s\t\"Size\": %d,\n",
> > >>> +                         buf,
> > >>> +                         bioscfg_drv.password_data[instance].encod=
ing_size);
> > >>> +
> > >>> +     buf_size =3D snprintf(buf, alloc_size, "%s\t\"SupportedEncodi=
ng\": [\n", buf);
> > >>> +
> > >>> +     if (bioscfg_drv.password_data[instance].encoding_size) {
> > >>> +             part_tmp =3D kstrdup(bioscfg_drv.password_data[instan=
ce].supported_encoding,
> > >>> +                                GFP_KERNEL);
> > >>> +             part =3D strsep(&part_tmp, ";");
> > >>> +             while (part) {
> > >>> +                     buf_size =3D snprintf(buf, alloc_size, "%s\t\=
t\"%s\"", buf, part);
> > >>> +                     part =3D strsep(&part_tmp, ";");
> > >>> +                     if (part)
> > >>> +                             buf_size =3D snprintf(buf, alloc_size=
, "%s,\n", buf);
> > >>> +                     else
> > >>> +                             buf_size =3D snprintf(buf, alloc_size=
, "%s\n", buf);
> > >>> +             }
> > >>> +             kfree(part_tmp);
> > >>> +             part_tmp =3D NULL;
> > >>> +     }
> > >>> +     buf_size =3D snprintf(buf, alloc_size, "%s\t],\n", buf);
> > >>> +
> > >>> +     buf_size =3D snprintf(buf, alloc_size,
> > >>> +                         "%s\t\"IsSet\": %d\n",
> > >>> +                         buf,
> > >>> +                         bioscfg_drv.password_data[instance].is_en=
abled);
> > >>> +
> > >>> +     return snprintf(buf, alloc_size, "%s},\n", buf);
> > >>> +}
> > >>> diff --git a/drivers/platform/x86/hp/surestart-attributes.c b/drive=
rs/platform/x86/hp/surestart-attributes.c
> > >>> new file mode 100644
> > >>> index 000000000000..41c5a549f2ca
> > >>> --- /dev/null
> > >>> +++ b/drivers/platform/x86/hp/surestart-attributes.c
> > >>> @@ -0,0 +1,145 @@
> > >>> +// SPDX-License-Identifier: GPL-2.0
> > >>> +/*
> > >>> + * Functions corresponding to sure start object type attributes un=
der
> > >>> + * BIOS for use with hp-bioscfg driver
> > >>> + *
> > >>> + *  Copyright (c) 2022 HP Development Company, L.P.
> > >>> + */
> > >>> +
> > >>> +#include "bioscfg.h"
> > >>> +#include <asm-generic/posix_types.h>
> > >>> +
> > >>> +#define LOG_MAX_ENTRIES      254
> > >>> +#define LOG_ENTRY_SIZE       16
> > >>> +
> > >>> +/*
> > >>> + * audit_log_entry_count_show - Reports the number of
> > >>> + *                           existing audit log entries available
> > >>> + *                           to be read
> > >>> + *
> > >>> + * @kobj:  Pointer to a kernel object of things that show up as di=
rectory
> > >>> + *      in the sysfs filesystem.
> > >>> + * @attr:  Pointer to list of attributes for the operation
> > >>> + * @buf:   Pointer to buffer
> > >>> + *
> > >>> + * Returns number of existing audit log entries available to be re=
ad,
> > >>> + *         audit log entry size, and maximum number of entries
> > >>> + *         supported. Otherwise, an HP WMI query specific error co=
de
> > >>> + *         (which is negative)
> > >>> + *
> > >>> + *         [No of entries],[log entry size],[Max number of entries=
 supported]
> > >>> + */
> > >>> +static ssize_t audit_log_entry_count_show(struct kobject *kobj,
> > >>> +                                       struct kobj_attribute *attr=
, char *buf)
> > >>> +{
> > >>> +     int ret;
> > >>> +     u32 count =3D 0;
> > >>> +
> > >>> +     ret =3D hp_wmi_perform_query(HPWMI_SURESTART_GET_LOG_COUNT, H=
PWMI_SURESTART,
> > >>> +                                &count, 0, sizeof(count));
> > >>> +     if (ret < 0)
> > >>> +             return ret;
> > >>> +
> > >>> +     return snprintf(buf, PAGE_SIZE, "%d,%d,%d\n", count, LOG_ENTR=
Y_SIZE, LOG_MAX_ENTRIES);
> > >>> +}
> > >>> +
> > >>> +/*
> > >>> + * audit_log_entries_show() - Return all entries found in log file
> > >>> + *
> > >>> + * @kobj:  Pointer to a kernel object of things that show up as
> > >>> + *      directory in the sysfs filesystem.
> > >>> + * @attr:  Pointer to list of attributes for the operation
> > >>> + * @buf:   Pointer to buffer
> > >>> + *
> > >>> + * Returns number of bytes needed to read all audit logs entries t=
o be read.
> > >>> + *         Otherwise, an HP WMI query specific error code (which i=
s negative)
> > >>> + *      -EFAULT if the audit logs size exceeds 4KB
> > >>> + *
> > >>> + */
> > >>> +static ssize_t audit_log_entries_show(struct kobject *kobj,
> > >>> +                                   struct kobj_attribute *attr, ch=
ar *buf)
> > >>> +{
> > >>> +     int ret;
> > >>> +     int i;
> > >>> +     u32 count =3D 0;
> > >>> +
> > >>> +     // Get the number of event logs
> > >>> +     ret =3D hp_wmi_perform_query(HPWMI_SURESTART_GET_LOG_COUNT, H=
PWMI_SURESTART,
> > >>> +                                &count, 1, 4);
> > >>> +
> > >>> +     /*
> > >>> +      * The show() api will not work if the audit logs ever go
> > >>> +      *  beyond 4KB
> > >>> +      */
> > >>> +     if (count * LOG_ENTRY_SIZE > PAGE_SIZE)
> > >>> +             return -EFAULT;
> > >>> +
> > >>> +     if (ret < 0)
> > >>> +             return ret;
> > >>> +
> > >>> +     /*
> > >>> +      * We are guaranteed the buffer is 4KB so today all the event
> > >>> +      * logs will fit
> > >>> +      */
> > >>> +     for (i =3D 0; ((i < count) & (ret >=3D 0)); i++) {
> > >>> +             *buf =3D (i + 1);
> > >>> +             ret =3D hp_wmi_perform_query(HPWMI_SURESTART_GET_LOG,
> > >>> +                                        HPWMI_SURESTART,
> > >>> +                                        buf, 1, 128);
> > >>> +             if (ret >=3D 0)
> > >>> +                     buf +=3D LOG_ENTRY_SIZE;
> > >>> +     }
> > >>> +     return (count * LOG_ENTRY_SIZE);
> > >>> +}
> > >>> +
> > >>> +static struct kobj_attribute sure_start_audit_log_entry_count =3D =
__ATTR_RO(audit_log_entry_count);
> > >>> +struct kobj_attribute sure_start_audit_log_entries =3D __ATTR_RO(a=
udit_log_entries);
> > >>> +
> > >>> +static ssize_t type_show(struct kobject *kobj, struct kobj_attribu=
te *attr,
> > >>> +                      char *buf)
> > >>> +{
> > >>> +     return sprintf(buf, "sure-start\n");
> > >>> +}
> > >>> +static struct kobj_attribute sure_start_type =3D __ATTR_RO(type);
> > >>> +
> > >>> +static ssize_t display_name_language_code_show(struct kobject *kob=
j,
> > >>> +                                            struct kobj_attribute =
*attr,
> > >>> +                                            char *buf)
> > >>> +{
> > >>> +     return sprintf(buf, "%s\n", LANG_CODE_STR);
> > >>> +}
> > >>> +
> > >>> +static struct kobj_attribute sure_start_display_langcode =3D
> > >>> +             __ATTR_RO(display_name_language_code);
> > >>> +
> > >>> +
> > >>> +static ssize_t display_name_show(struct kobject *kobj,
> > >>> +                              struct kobj_attribute *attr, char *b=
uf)
> > >>> +{
> > >>> +     return sprintf(buf, "%s\n", SURE_START_DESC);
> > >>> +}
> > >>> +static struct kobj_attribute sure_start_display_name =3D __ATTR_RO=
(display_name);
> > >>> +
> > >>> +static struct attribute *sure_start_attrs[] =3D {
> > >>> +     &sure_start_display_name.attr,
> > >>> +     &sure_start_display_langcode.attr,
> > >>> +     &sure_start_audit_log_entry_count.attr,
> > >>> +     &sure_start_audit_log_entries.attr,
> > >>> +     &sure_start_type.attr,
> > >>> +     NULL,
> > >>> +};
> > >>> +
> > >>> +static const struct attribute_group sure_start_attr_group =3D {
> > >>> +     .attrs =3D sure_start_attrs,
> > >>> +};
> > >>> +
> > >>> +void exit_sure_start_attributes(void)
> > >>> +{
> > >>> +     sysfs_remove_group(bioscfg_drv.sure_start_attr_kobj, &sure_st=
art_attr_group);
> > >>> +}
> > >>> +
> > >>> +int populate_sure_start_data(struct kobject *attr_name_kobj)
> > >>> +{
> > >>> +     bioscfg_drv.sure_start_attr_kobj =3D attr_name_kobj;
> > >>> +     return sysfs_create_group(attr_name_kobj, &sure_start_attr_gr=
oup);
> > >>> +}
> > >>
> >
