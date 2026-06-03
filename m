Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D993A2544
	for <platform-driver-x86@vger.kernel.org>; Wed,  3 Jun 2026 20:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780517598; cv=none; b=dfuJYheq2f+8slcWZPQ2D/Ak/Nqu/3QlAK6FrcJe5Ga6HChAYui8xLGO+h0kxD1TG+55EFzxhk+wIDDi75pEKVVoiTEtCqeBHwzq9tVDGbVRefcIbZSFUyDD8jegrcwJ2Wbgt6A1O0lDEaAF9Fq+LiKdx5ruePjG8sUhP6NBtnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780517598; c=relaxed/simple;
	bh=d/qoz2gBerpMigakzWAv6iFaS06P8tzpUeGth8BRHbw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oPxcRKo5tStWvWt42mCPPBY7Z6LfBUAgg3VNApOp4LVDga0G7Jr/5f5lktozYZk+hRL8N/g4a0i+feTbMvshTv1f6ZFob3G40qqhVVz75WHm/OuMLfKNswIDI8OPK326f90N2cN3NcKcxCA46TC01R+9D84/kzBUG280RN3Kg4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z609fEOT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z609fEOT"
Received: by smtp.kernel.org (Postfix) with ESMTPS id ED246C2BCC6
	for <platform-driver-x86@vger.kernel.org>; Wed,  3 Jun 2026 20:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780517598;
	bh=d/qoz2gBerpMigakzWAv6iFaS06P8tzpUeGth8BRHbw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Z609fEOT4bxPTV/2ls0v512w2+GZTkB8b1VA4+dygU/09MeMjJhIB9mhtVZMbuZ61
	 vu/xh0UDwVZ1gJKjX6aMvG2NmHvVU/CH+HDrtYlyF7z6GZ9mHUtqE/gWpEvzhqa/v+
	 Nxg/sXeV0qAbavd50pDTENk3sBR4tuwEYKzCtiVUgsVxOJTacy+ifxGaPsvAt4oglR
	 PoM6eL0DtwmslStT5pToLUSnfq5aZIDyRWHKt5nUok7tCnr7OlvLd9rnbjaEt/ZSjk
	 pl3puBnhkZgg/VrxiiC1qZtdv4iViu/Ur2B52YTFVTpfLcchyv65ZZIyPVt8VqFZaB
	 wi7alp+azna1Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id CB5ADC3279F; Wed,  3 Jun 2026 20:13:17 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221583] Lenovo 82KU: keyboard backlight works via Fn+Space but
 no kbd_backlight LED device exposed
Date: Wed, 03 Jun 2026 20:13:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: i@rong.moe
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221583-215701-AcKLJvGdw0@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221583-215701@https.bugzilla.kernel.org/>
References: <bug-221583-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

https://bugzilla.kernel.org/show_bug.cgi?id=3D221583

--- Comment #5 from Rong Zhang (i@rong.moe) ---
Hi George,

Based on the debugfs dump and acpidump you provided, ideapad-laptop may not=
 be
able to adjust keyboard backlight brightness as it does for other devices d=
ue
to the lack of relevant support in the ACPI table.

That being said, if you would like to debug more, enable dynamic debug for =
EC
with...

  echo file drivers/acpi/ec.c +p | sudo tee /proc/dynamic_debug/control

...and cycle through all keyboard backlight brightness levels. Then dump dm=
esg
to see if any EC queries were executed.

I also have a script (attached at the end) to dump the EC's MMIO region.
Dumping it with different keyboard brightness levels and comparing the dumps
may show some additional information:

  sudo bash /path/to/script.sh 0xFE00D400 0xFF 1

Note that dumping MMIO regions could be dangerous, so please save your open
files and sync them to the disk before running the script.

```bash
#!/bin/bash

err() {
        echo "$*" >&2
        exit 1
}

declare -i base=3D$1
declare -i len=3D$2
((base >=3D 0 && len > 0)) || err "Nothing to dump"

declare -l acc=3D$3
declare -A supp=3D(
        [1]=3D1 [2]=3D2 [4]=3D4 [8]=3D8
        [byte]=3D1 [word]=3D2 [dword]=3D4 [qword]=3D8
)
align=3D${supp[$acc]}
[[ -n "$align" ]] || err "Unsupported access type: $acc"
(( len < align )) && err "Length is too short: $len"
bits=3D$((align * 8))
mask=3D$((align - 1))
(( base & mask )) && err "Misaligned base: $base"

declare -A hex2bin=3D(
        [0]=3D0000 [1]=3D0001 [2]=3D0010 [3]=3D0011
        [4]=3D0100 [5]=3D0101 [6]=3D0110 [7]=3D0111
        [8]=3D1000 [9]=3D1001 [A]=3D1010 [B]=3D1011
        [C]=3D1100 [D]=3D1101 [E]=3D1110 [F]=3D1111
)
for ((off =3D base; off <=3D base + len - align; off +=3D align)); do
        printf '0x%016X:' "$off"
        if ! out=3D$(busybox devmem "$off" "$bits" 2>&1); then
                echo " $out"
                continue
        fi
        printf -v hex "%0$((align * 2))X" "$((out))"
        for ((i =3D ${#hex} - 2; i >=3D 0; i -=3D 2)); do
                high=3D${hex:i:1}
                low=3D${hex:i+1:1}
                echo -n " ${hex2bin[$high]}${hex2bin[$low]}"
        done
        echo
done
```

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
