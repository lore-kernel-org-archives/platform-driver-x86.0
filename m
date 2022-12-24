Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD739C4332F
	for <platform-driver-x86@archiver.kernel.org>; Sat, 24 Dec 2022 14:42:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229831AbiLXOmJ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 24 Dec 2022 09:42:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229570AbiLXOmI (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 24 Dec 2022 09:42:08 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52B59DE8D
        for <platform-driver-x86@vger.kernel.org>; Sat, 24 Dec 2022 06:42:07 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id CD8AEB8015A
        for <platform-driver-x86@vger.kernel.org>; Sat, 24 Dec 2022 14:42:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 517CEC433EF
        for <platform-driver-x86@vger.kernel.org>; Sat, 24 Dec 2022 14:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1671892924;
        bh=yF8bSimnOwtRmTiwCxN6vdN6Ie3C2jwwHNzUYje6wj4=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=bDTRh8LJwSFzQS7dx5UXj8qH+Pxb6yE1XPsvjkli4P3+Bj4kiFr0wZwUvODylo65x
         2XBg42nRfCKJ1bBsuH54DB9xGusvSI5/FdcROotkRsD+xMtg+NcQN2FsN3PBjNaId6
         +qWi5bf9WMIFaVcoDYl3oUph0Q75Vr2M6fS9WYHWpWm22/qsJvf8k5WCMks+t/Swpu
         StIMp8fTGjHfBJHtGvUIl5bSu0Gt27MdleU0urMCEpICwqpbDgAMn6cp2q9ZkqDV3A
         UPPptfL5nO2o/urRUOmTCNHhFCxA1JPqEOlzDcBy8Aof86L9umhZDJOH+bLb+AI13A
         EjpVZWDi0tJDQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 42031C43143; Sat, 24 Dec 2022 14:42:04 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sat, 24 Dec 2022 14:42:01 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: pauk.denis@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-204807-215701-I78FT9ykvi@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204807-215701@https.bugzilla.kernel.org/>
References: <bug-204807-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D204807

Denis Pauk (pauk.denis@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #303333|0                           |1
        is obsolete|                            |

--- Comment #278 from Denis Pauk (pauk.denis@gmail.com) ---
Created attachment 303466
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303466&action=3Dedit
Asus WMI for nct6775 v6.1 base (2022.12.24)

Simplified version of patch with removed custom i2c adapter and reworked ac=
cess
to sensors on previous generation of boards (<=3DAMD B550/X570) and additio=
nal
new generation boards(AMD B650/X670).

B550/X570 style:
        "CROSSHAIR VI HERO", // use custom port definition
        "PRIME B360-PLUS",
        "PRIME B450-PLUS", // use custom port definition
        "PRIME B450M-GAMING II", // use custom port definition
        "PRIME B450M-GAMING/BR", // use custom port definition
        "PRIME B460-PLUS",
        "PRIME B550-PLUS",
        "PRIME B550M-A",
        "PRIME B550M-A (WI-FI)",
        "PRIME B550M-A AC",
        "PRIME B550M-A WIFI II",
        "PRIME B550M-K",
        "PRIME H410M-R",
        "PRIME X370-PRO", // use custom port definition
        "PRIME X470-PRO", // use custom port definition
        "PRIME X570-P",
        "PRIME X570-PRO",
        "PRO H410T",
        "Pro B550M-C",
        "Pro WS X570-ACE",
        "ProArt B550-CREATOR",
        "ProArt X570-CREATOR WIFI",
        "ProArt Z490-CREATOR 10G",
        "ROG CROSSHAIR VI EXTREME", // use custom port definition
        "ROG CROSSHAIR VI HERO (WI-FI AC)", // use custom port definition
        "ROG CROSSHAIR VII HERO", // use custom port definition
        "ROG CROSSHAIR VII HERO (WI-FI)", // use custom port definition
        "ROG CROSSHAIR VIII DARK HERO",
        "ROG CROSSHAIR VIII EXTREME",
        "ROG CROSSHAIR VIII FORMULA",
        "ROG CROSSHAIR VIII HERO",
        "ROG CROSSHAIR VIII HERO (WI-FI)",
        "ROG CROSSHAIR VIII IMPACT",
        "ROG MAXIMUS XI HERO",
        "ROG MAXIMUS XI HERO (WI-FI)",
        "ROG STRIX B350-F GAMING", // use custom port definition
        "ROG STRIX B350-I GAMING", // use custom port definition
        "ROG STRIX B450-E GAMING", // use custom port definition
        "ROG STRIX B450-F GAMING", // use custom port definition
        "ROG STRIX B450-F GAMING II", // use custom port definition
        "ROG STRIX B450-I GAMING", // use custom port definition
        "ROG STRIX B550-A GAMING",
        "ROG STRIX B550-E GAMING",
        "ROG STRIX B550-F GAMING",
        "ROG STRIX B550-F GAMING (WI-FI)",
        "ROG STRIX B550-F GAMING WIFI II",
        "ROG STRIX B550-I GAMING",
        "ROG STRIX B550-XE GAMING (WI-FI)",
        "ROG STRIX X370-F GAMING", // use custom port definition
        "ROG STRIX X370-I GAMING", // use custom port definition
        "ROG STRIX X470-F GAMING", // use custom port definition
        "ROG STRIX X470-I GAMING", // use custom port definition
        "ROG STRIX X570-E GAMING",
        "ROG STRIX X570-E GAMING WIFI II",
        "ROG STRIX X570-F GAMING",
        "ROG STRIX X570-I GAMING",
        "ROG STRIX Z390-E GAMING",
        "ROG STRIX Z390-F GAMING",
        "ROG STRIX Z390-H GAMING",
        "ROG STRIX Z390-I GAMING",
        "ROG STRIX Z490-A GAMING",
        "ROG STRIX Z490-E GAMING",
        "ROG STRIX Z490-F GAMING",
        "ROG STRIX Z490-G GAMING",
        "ROG STRIX Z490-G GAMING (WI-FI)",
        "ROG STRIX Z490-H GAMING",
        "ROG STRIX Z490-I GAMING",
        "TUF B450 PLUS GAMING", // use custom port definition
        "TUF GAMING B450-PLUS II", // use custom port definition
        "TUF GAMING B550-PLUS",
        "TUF GAMING B550-PLUS WIFI II",
        "TUF GAMING B550-PRO",
        "TUF GAMING B550M-E",
        "TUF GAMING B550M-E (WI-FI)",
        "TUF GAMING B550M-PLUS",
        "TUF GAMING B550M-PLUS (WI-FI)",
        "TUF GAMING B550M-PLUS WIFI II",
        "TUF GAMING X570-PLUS",
        "TUF GAMING X570-PLUS (WI-FI)",
        "TUF GAMING X570-PRO (WI-FI)",
        "TUF GAMING Z490-PLUS",
        "TUF GAMING Z490-PLUS (WI-FI)",
        "Z490-GUNDAM (WI-FI)",

B650/X670:
        "PRIME B650-PLUS",
        "PRIME B650M-A",
        "PRIME B650M-A (WI-FI)",
        "ProArt B660-CREATOR D4",
        "ProArt X670E-CREATOR WIFI",
        "ProArt Z790-CREATOR WIFI", // use custom port definition
        "ROG CROSSHAIR X670E EXTREME",
        "ROG CROSSHAIR X670E GENE",
        "ROG CROSSHAIR X670E HERO",
        "ROG MAXIMUS XIII EXTREME GLACIAL",
        "ROG MAXIMUS Z690 EXTREME",
        "ROG MAXIMUS Z690 EXTREME GLACIAL",
        "ROG MAXIMUS Z790 EXTREME", // use custom port definition
        "ROG STRIX B650E-E GAMING (WI-FI)",
        "ROG STRIX B650E-F GAMING (WI-FI)",
        "ROG STRIX B660-I GAMING WIFI",
        "ROG STRIX X670E-A GAMING WIFI",
        "ROG STRIX X670E-E GAMING WIFI",
        "ROG STRIX X670E-F GAMING WIFI",
        "ROG STRIX X670E-I GAMING WIFI",
        "ROG STRIX Z590-A GAMING WIFI II",
        "ROG STRIX Z690-A GAMING WIFI D4",
        "TUF GAMING Z590-PLUS WIFI",

By mutex lock:
        DMI_MATCH_ASUS_NONWMI_BOARD("P8Z68-V LX", &acpi_board_LPCB_MUTEX),
        DMI_MATCH_ASUS_WMI_BOARD("CROSSHAIR VI HERO", &acpi_board_SBRG_MUTE=
X),
        DMI_MATCH_ASUS_WMI_BOARD("MAXIMUS IX APEX", &acpi_board_GPEM_MUTEX),
        DMI_MATCH_ASUS_WMI_BOARD("MAXIMUS IX CODE", &acpi_board_GPEM_MUTEX),
        DMI_MATCH_ASUS_WMI_BOARD("MAXIMUS IX EXTREME", &acpi_board_GPEM_MUT=
EX),
        DMI_MATCH_ASUS_WMI_BOARD("MAXIMUS IX FORMULA", &acpi_board_GPEM_MUT=
EX),
        DMI_MATCH_ASUS_WMI_BOARD("MAXIMUS IX HERO", &acpi_board_GPEM_MUTEX),
        DMI_MATCH_ASUS_WMI_BOARD("MAXIMUS VII HERO", &acpi_board_GPEM_MUTEX=
),
        DMI_MATCH_ASUS_WMI_BOARD("P8H67", &acpi_board_LPCB_MUTEX),
        DMI_MATCH_ASUS_WMI_BOARD("PRIME B450M-GAMING/BR",
&acpi_board_SBRG_MUTEX),
        DMI_MATCH_ASUS_WMI_BOARD("PRIME B450M-GAMING II",
&acpi_board_SBRG_MUTEX),
        DMI_MATCH_ASUS_WMI_BOARD("PRIME B450-PLUS", &acpi_board_SBRG_MUTEX),
        DMI_MATCH_ASUS_WMI_BOARD("PRIME X370-PRO", &acpi_board_SBRG_MUTEX),
        DMI_MATCH_ASUS_WMI_BOARD("PRIME X470-PRO", &acpi_board_SBRG_MUTEX),
        DMI_MATCH_ASUS_WMI_BOARD("PRIME Z270-A", &acpi_board_GPEM_MUTEX),
        DMI_MATCH_ASUS_WMI_BOARD("ProArt Z790-CREATOR WIFI",
&acpi_board_0LPC_MUTEX),
        DMI_MATCH_ASUS_WMI_BOARD("ROG CROSSHAIR VI EXTREME",
&acpi_board_SBRG_MUTEX),
        DMI_MATCH_ASUS_WMI_BOARD("ROG CROSSHAIR VI HERO (WI-FI AC)",
&acpi_board_SBRG_MUTEX),
        DMI_MATCH_ASUS_WMI_BOARD("ROG CROSSHAIR VII HERO",
&acpi_board_SBRG_MUTEX),
        DMI_MATCH_ASUS_WMI_BOARD("ROG CROSSHAIR VII HERO (WI-FI)",
&acpi_board_SBRG_MUTEX),
        DMI_MATCH_ASUS_WMI_BOARD("ROG MAXIMUS X HERO", &acpi_board_GPEM_MUT=
EX),
        DMI_MATCH_ASUS_WMI_BOARD("ROG MAXIMUS Z790 EXTREME",
&acpi_board_0LPC_MUTEX),
        DMI_MATCH_ASUS_WMI_BOARD("ROG STRIX B350-F GAMING",
&acpi_board_SBRG_MUTEX),
        DMI_MATCH_ASUS_WMI_BOARD("ROG STRIX B350-I GAMING",
&acpi_board_SBRG_MUTEX),
        DMI_MATCH_ASUS_WMI_BOARD("ROG STRIX B450-E GAMING",
&acpi_board_SBRG_MUTEX),
        DMI_MATCH_ASUS_WMI_BOARD("ROG STRIX B450-F GAMING",
&acpi_board_SBRG_MUTEX),
        DMI_MATCH_ASUS_WMI_BOARD("ROG STRIX B450-F GAMING II",
&acpi_board_SBRG_MUTEX),
        DMI_MATCH_ASUS_WMI_BOARD("ROG STRIX B450-I GAMING",
&acpi_board_SBRG_MUTEX),
        DMI_MATCH_ASUS_WMI_BOARD("ROG STRIX X370-F GAMING",
&acpi_board_SBRG_MUTEX),
        DMI_MATCH_ASUS_WMI_BOARD("ROG STRIX X370-I GAMING",
&acpi_board_SBRG_MUTEX),
        DMI_MATCH_ASUS_WMI_BOARD("ROG STRIX X470-F GAMING",
&acpi_board_SBRG_MUTEX),
        DMI_MATCH_ASUS_WMI_BOARD("ROG STRIX X470-I GAMING",
&acpi_board_SBRG_MUTEX),
        DMI_MATCH_ASUS_WMI_BOARD("ROG STRIX Z370-H GAMING",
&acpi_board_GPEM_MUTEX),
        DMI_MATCH_ASUS_WMI_BOARD("STRIX-Z270E-GAMING", &acpi_board_GPEM_MUT=
EX),
        DMI_MATCH_ASUS_WMI_BOARD("STRIX-Z270F-GAMING", &acpi_board_GPEM_MUT=
EX),
        DMI_MATCH_ASUS_WMI_BOARD("STRIX-Z270G-GAMING", &acpi_board_GPEM_MUT=
EX),
        DMI_MATCH_ASUS_WMI_BOARD("STRIX-Z270H-GAMING", &acpi_board_GPEM_MUT=
EX),
        DMI_MATCH_ASUS_WMI_BOARD("TUF B450 PLUS GAMING",
&acpi_board_SBRG_MUTEX),
        DMI_MATCH_ASUS_WMI_BOARD("TUF GAMING B450-PLUS II",
&acpi_board_SBRG_MUTEX),
        DMI_MATCH_ASUS_WMI_BOARD("TUF Z270 MARK 1", &acpi_board_GPEM_MUTEX),
        DMI_MATCH_ASUS_WMI_BOARD("Z170-DELUXE", &acpi_board_GPEM_MUTEX),
        DMI_MATCH_ASUS_WMI_BOARD("Z170M-PLUS", &acpi_board_GPEM_MUTEX),
        DMI_MATCH_ASUS_WMI_BOARD("Z270-WS", &acpi_board_GPEM_MUTEX),

If boards are in several lists, access could be possible by several methods.

If new patch will work for you, I will start to prepare patches for upstream
review(except mutex changes).

Boards with "use custom port definition" mark could be in such patches only
after test with real board as such boards use little different method
definitions than in fully tested boards.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
