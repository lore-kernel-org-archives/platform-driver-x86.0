Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85F70C433DB
	for <platform-driver-x86@archiver.kernel.org>; Thu, 18 Feb 2021 17:22:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 48ADF64EB3
	for <platform-driver-x86@archiver.kernel.org>; Thu, 18 Feb 2021 17:22:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232153AbhBRRVb (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 18 Feb 2021 12:21:31 -0500
Received: from mout.gmx.net ([212.227.17.20]:47061 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232130AbhBRN4H (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 18 Feb 2021 08:56:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1613656417;
        bh=nL0h5WLRZnMiclGvWrL8LqqJJ6KoSYx7HI2GK+mbzVc=;
        h=X-UI-Sender-Class:Subject:From:To:Cc:References:Date:In-Reply-To;
        b=BJ+FK/oEHfFI35BnlCGXoKzGuw0WaJLxf0yVWk1Oo7qgfp+DPwGOgwVQkwrOKyd8S
         MKFPwb+YNmti5s0Dvj2jZvg6iQkxk1VUBcR22YniFWebMwV4j8VKo5RUc+5yJc1sHu
         EWFB96DzjnBWKS8DSD4lNobLDGubengB8cYcj5vo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.10.160] ([79.200.198.71]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M26vB-1lAosD3yXp-002ann; Thu, 18
 Feb 2021 14:53:37 +0100
Subject: Re: dell-wmi-sysman: New possibility to set BIOS values for Dell
 systems has some bugs
From:   Alexander Naumann <alexandernaumann@gmx.de>
To:     divya.bharathi@dell.com, mario.limonciello@dell.com
Cc:     platform-driver-x86@vger.kernel.org
References: <14c6da2c-1e8f-294c-a11d-1656a611d7d8@gmx.de>
Autocrypt: addr=alexandernaumann@gmx.de; prefer-encrypt=mutual; keydata=
 mQENBFHyVjkBCADAn/Pi+LQwfLTF6LlTO3iZImlG6194GmeSIP35pWjqdUX8D6f+9sM34dRg
 8vugNTRF/QgcFZT4hk+SP8I5h+E2in/lZXdPKvnS/FGWU8768SMVUFdv7wNpVVJ4cok9KZ2w
 vIDsvI6nNlwD9ktdEVuXqVsnbuyXQ5oRrXwftUOtEbPgXjqKoFjp2ADiS689YTeXbT2OhrQH
 BZ4x0J3QxVggqvKYaUnG09q6DbWH95CL4J03eotlen07/lBBqLaoFK6rBA3M67cqntpgpFA7
 pwmDNmaxfsmqE9FiimS/1LS4xrZ+TNu3XqVqRec9QG8EpJpt/4nbY5wDAxk/jE9rI2zlABEB
 AAG0K0FsZXhhbmRlciBOYXVtYW5uIDxhbGV4YW5kZXJuYXVtYW5uQGdteC5kZT6JAU8EEwEC
 ADkCGyMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAFiEEqkCOgb0FadYTrK5vgjQuacJeHpwF
 Al7OOkIACgkQgjQuacJeHpwx+wf/Zc0vigQLYUi/ozTI3Jf2cPOPwGNtcA73bXszpm2t4Pl2
 0PemDqrg5rfREC0N2lBebymP9cfczAlsxlrIYRZg0mxTlLPf6nqKwVuQii9LWKMsRu39Kkwb
 TJXwaCqqXUUTI5t0AY7XFDwXEfq2AUxkmJk0YcwbN8/0F6vCz6rvr/Tzm0QhNEtk1SacpmPr
 AI6lj3iqcE4XGbeIGWykJySmVpaAamaMc5mVFve1mU/SUOSpG9H1LwAM4ZipN4Kjv/nmb3rZ
 rcAd1iOA/vH7FwTaHNeO+46Q0N0ihsWLJaABCrXaq7BWq/b+jqEb80KUp3sxO9NSaytaCN67
 uF4PH5m5IrkBDQRR8lY5AQgAu/hKLzWfto5/iP0JLuTGzAXdeR1DqTGbRe/EYlfSSOq4Dtks
 dTbcQGn5ri7kIyZcr/iRXLHiVXeSIz4ov2++PQ+q6p0UFY97ctX9zCs1uyzHVMpr4uGsCzzh
 pVeyw5TjpRBHtTrucahZ9NjUcH05PLTIh4jlzA1X/OVsAjp9DHIVXC6hOgZNJqOWP3cdTWux
 6Yr8JprgKoIVJ6yU7uT7Gl6hk1HV7ou+/i5m+iVmXCA+Rui2/1bbFd6dl+jkdBF1tR5zpC62
 RTWiEbMpEAFk+QkIxdZLY5Yb7AM4a91MZk1BoIelMgzNXb6CNZATZ56oVJkKl1cqh2OhjxSk
 DS/YuwARAQABiQE2BBgBAgAgAhsMFiEEqkCOgb0FadYTrK5vgjQuacJeHpwFAl7OOkMACgkQ
 gjQuacJeHpzTVQgAvIH8gdMskOjwl3dr2U6FzYx7tj3r4j7HDdqxmIGYE8L28n66uRhxxAYM
 aUy4mZP3VC2sj4G3z2SrTVjUWIB9YfTyWieRo85+7FHugzLMCLm5RV5UYpugFKn61sV8vIOe
 D3l2XHvmGmlwtscR5IY1YRqhMLgxTr52EwkkKrZpopL8YO4fTS4iu3tYLag3xKjBP5HDqaFh
 qxmE8N7Mt38PzWugy9SAWw9lvp8TUQHdQ3VxJEl7OaAY83+GATyvjKX7Md/0No8H/BupSsZB
 bWO8nJru/2C2fsLcW8tFGc7p8JSQNqePThpjo4Wtgjq0lK0Sf4TvqKCx2GssFU0T9orO4g==
Message-ID: <2aa89ef2-3fca-dd0a-a5e9-ab6762ac7c1d@gmx.de>
Date:   Thu, 18 Feb 2021 14:53:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <14c6da2c-1e8f-294c-a11d-1656a611d7d8@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: de-DE
X-Provags-ID: V03:K1:8Vr7WUPdJnU0GKkMDdlLJ0319k0Z/sfYcqTqzurjpSqZtOnXJH9
 K6/cTgc7Rs8IBlxNH3PBv+Fnm49qJxDV+BOfnNAwB3eJzW74qWOdfFoINtXE8sYg3KbmquC
 bl9IPJpryQslEYEzDl13XpE9AF0NXzaYLUkSUNRcA0niUii7BlV9ySRNrJ23y3J37SVtI3q
 KzpqhC24J4OnV/4A8ebFQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:DGa2V363+Lc=:sWQ8PmZjMSnzlvx3ohSvd1
 90DGFTiSDIGuYGykaAnOe12VMLCsZIMnihAw7Z4XfDP3jCkMWUkhIALGPthnevmcV8NWNpZ04
 sWqnKLn1gkzpVySsw1uIwaFKk+CwUoZ75RrUH/tk6yUrGb+3e6DVNJ1Mixl6eRvynKEQDVB2B
 6J314+7BpXX9FZK58adeg+0m9SeyZnN5T7SymnMvo0tqBFOmzziFOSHhHipkwRp1HsICvGvxC
 o6ZVDyP7T7TjCmvnxiH5ZMf/sdpWETSR57zCWbAZkDXnp+NMc0W5zeiCKoGUZmipmpO0ePTm4
 aGpN34/GkjW2AW30Crs/4RWatWlt8TNJYxiFA2PKTLuSVb7yXga3QEp0/elZcWNnoKgvgaG56
 SE3t26Z4s77sgYTcFSklFU9VmKJwOARh27yOMhPR9cvphZgzS0PwSZJPp/TScq5+X1SrQYLyC
 9TzHwcT0aSziz8csumyWWcI0uqd7x0kiUDiODgaxBiAiayxcRXKKIPCOvRaOD+Yz8CnJ7CZcc
 NKsbgqmlbeVwrBGt/w5bZdzvxJSulxRpB6zkIBqpSmpS0rHjCPcixmMvViaD8l1AQkswmGyZ7
 qxKOcBbxBasollncW3acKk9ApHkVu9VPRoxdTs+6uFP3CZJxOjzldFskGzTmok/OeWzcZ1On2
 B0TKhrPvG7C/kV7I6/WGq9eSLbyiqetbKEcLAGeJfxpX7mbi33EuK39fhf/XJT6UeZBPWb9Y8
 oxCrQvRQglbv4191TnvOOTrYnTfWTdc+028JZT9SAUE8tjav8r3WdRWl8vmAqFMs8AEE8x4n3
 SDl7AweFILDlvGUygFvqwVo1CU2gSYgc3b4lhPbhNmNsJ3XeX89HNt6OokrewRyXFiWf2cUK4
 gLd7eyHmWSg9W67o8NoK1pQ5QonOdaZ5DAqvFnXQk=
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Here is the stacktrace I spoke about:


rmmod dell-wmi-sysman



[=C2=A0=C2=A0 81.809783] BUG: kernel NULL pointer dereference, address:
0000000000000048
[=C2=A0=C2=A0 81.809786] #PF: supervisor read access in kernel mode
[=C2=A0=C2=A0 81.809787] #PF: error_code(0x0000) - not-present page
[=C2=A0=C2=A0 81.809788] PGD 101fbf067 P4D 101fbf067 PUD 100e23067 PMD 0
[=C2=A0=C2=A0 81.809792] Oops: 0000 [#1] SMP
[=C2=A0=C2=A0 81.809793] CPU: 1 PID: 6833 Comm: rmmod Tainted: G=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 O=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0
5.11.0-64bit #1
[=C2=A0=C2=A0 81.809795] Hardware name:=C2=A0 /0DRR0P, BIOS 2.4.1 09/27/20=
18
[=C2=A0=C2=A0 81.809796] RIP: 0010:sysfs_remove_file_ns+0x0/0x10
[=C2=A0=C2=A0 81.809800] Code: 8b 47 08 48 8b 68 60 e8 7e e5 ff ff 48 89 d=
f e8 06
d6 ff ff 48 89 ef 5b 5d e9 5c b7 20 00 66 66 66 2e 0f 1f 84 00 00 00 00
00 <48> 8b 7f 30 48 8b 36 e9 64 e6 ff ff 0f 1f 40 00 41 54 55 49 89 fc
[=C2=A0=C2=A0 81.809802] RSP: 0018:ffffc9000113beb0 EFLAGS: 00010246
[=C2=A0=C2=A0 81.809803] RAX: 0000000000000000 RBX: ffffffffa01b6dc0 RCX:
0000000000000000
[=C2=A0=C2=A0 81.809804] RDX: 0000000000000000 RSI: ffffffffa01b6060 RDI:
0000000000000018
[=C2=A0=C2=A0 81.809805] RBP: 0000000000000081 R08: 0000000000000000 R09:
000000000000006e
[=C2=A0=C2=A0 81.809806] R10: ff6d606c7278725e R11: 006e616d7379735f R12:
0000000000000880
[=C2=A0=C2=A0 81.809807] R13: 0000000000000880 R14: 0000000000000000 R15:
0000000000000000
[=C2=A0=C2=A0 81.809808] FS:=C2=A0 0000000000000000(0000) GS:ffff88846ed00=
000(0063)
knlGS:00000000f7d21940
[=C2=A0=C2=A0 81.809810] CS:=C2=A0 0010 DS: 002b ES: 002b CR0: 00000000800=
50033
[=C2=A0=C2=A0 81.809811] CR2: 0000000000000048 CR3: 0000000100e20001 CR4:
00000000003706e0
[=C2=A0=C2=A0 81.809812] Call Trace:
[=C2=A0=C2=A0 81.809814]=C2=A0 release_attributes_data+0x19/0xa3 [dell_wmi=
_sysman]
[=C2=A0=C2=A0 81.809817]=C2=A0 sysman_exit+0x5/0xd8b [dell_wmi_sysman]
[=C2=A0=C2=A0 81.809819]=C2=A0 __ia32_sys_delete_module+0x16b/0x240
[=C2=A0=C2=A0 81.809822]=C2=A0 __do_fast_syscall_32+0x56/0x80
[=C2=A0=C2=A0 81.809826]=C2=A0 do_fast_syscall_32+0x2f/0x70
[=C2=A0=C2=A0 81.809828]=C2=A0 entry_SYSENTER_compat_after_hwframe+0x4d/0x=
5c
[=C2=A0=C2=A0 81.809830] RIP: 0023:0xf7edc549
[=C2=A0=C2=A0 81.809831] Code: b8 01 10 06 03 74 b4 01 10 07 03 74 b0 01 1=
0 08 03
74 d8 01 00 00 00 00 00 00 00 00 00 00 00 00 00 51 52 55 89 e5 0f 34 cd
80 <5d> 5a 59 c3 90 90 90 90 eb 0d 90 90 90 90 90 90 90 90 90 90 90 90
[=C2=A0=C2=A0 81.809833] RSP: 002b:00000000ffe08bc8 EFLAGS: 00000246 ORIG_=
RAX:
0000000000000081
[=C2=A0=C2=A0 81.809834] RAX: ffffffffffffffda RBX: 00000000ffe08c00 RCX:
0000000000000880
[=C2=A0=C2=A0 81.809835] RDX: 00000000ffe0b454 RSI: 0000000000000003 RDI:
00000000ffe08c00
[=C2=A0=C2=A0 81.809836] RBP: 00000000ffe0b4a8 R08: 0000000000000000 R09:
0000000000000000
[=C2=A0=C2=A0 81.809837] R10: 0000000000000000 R11: 0000000000000000 R12:
0000000000000000
[=C2=A0=C2=A0 81.809838] R13: 0000000000000000 R14: 0000000000000000 R15:
0000000000000000
[=C2=A0=C2=A0 81.809839] Modules linked in: dell_wmi_sysman(O-) wmi
scsi_transport_fc scsi_dh_rdac scsi_dh_emc scsi_dh_alua scsi_dh_hp_sw
xt_nat xt_REDIRECT iptable_nat nf_nat ipt_REJECT nf_reject_ipv4 xt_state
iptable_filter ip_tables thermal fan ipv6 fuse dm_snapshot dm_bufio
dm_round_robin dm_multipath psmouse ipmi_ssif pcspkr acpi_ipmi iTCO_wdt
iTCO_vendor_support ipmi_si ipmi_msghandler ac intel_pch_thermal
ie31200_edac [last unloaded: qla2xxx]
[=C2=A0=C2=A0 81.809857] CR2: 0000000000000048
[=C2=A0=C2=A0 81.809859] ---[ end trace 175f62942dce486b ]---
[=C2=A0=C2=A0 81.809859] RIP: 0010:sysfs_remove_file_ns+0x0/0x10
[=C2=A0=C2=A0 81.809861] Code: 8b 47 08 48 8b 68 60 e8 7e e5 ff ff 48 89 d=
f e8 06
d6 ff ff 48 89 ef 5b 5d e9 5c b7 20 00 66 66 66 2e 0f 1f 84 00 00 00 00
00 <48> 8b 7f 30 48 8b 36 e9 64 e6 ff ff 0f 1f 40 00 41 54 55 49 89 fc
[=C2=A0=C2=A0 81.809863] RSP: 0018:ffffc9000113beb0 EFLAGS: 00010246
[=C2=A0=C2=A0 81.809864] RAX: 0000000000000000 RBX: ffffffffa01b6dc0 RCX:
0000000000000000
[=C2=A0=C2=A0 81.809865] RDX: 0000000000000000 RSI: ffffffffa01b6060 RDI:
0000000000000018
[=C2=A0=C2=A0 81.809866] RBP: 0000000000000081 R08: 0000000000000000 R09:
000000000000006e
[=C2=A0=C2=A0 81.809866] R10: ff6d606c7278725e R11: 006e616d7379735f R12:
0000000000000880
[=C2=A0=C2=A0 81.809867] R13: 0000000000000880 R14: 0000000000000000 R15:
0000000000000000
[=C2=A0=C2=A0 81.809868] FS:=C2=A0 0000000000000000(0000) GS:ffff88846ed00=
000(0063)
knlGS:00000000f7d21940
[=C2=A0=C2=A0 81.809869] CS:=C2=A0 0010 DS: 002b ES: 002b CR0: 00000000800=
50033
[=C2=A0=C2=A0 81.809870] CR2: 0000000000000048 CR3: 0000000100e20001 CR4:
00000000003706e0


Am 18.02.21 um 11:57 schrieb Alexander Naumann:
> I have seen this new option and wanted to test it on an R240 (OEM device=
).
>
> But it is not working.
>
>
> I did compile this as a module and it was loading fine. But actually it
> is not.
>
> This function call here returns 0:
>
> ret =3D init_bios_attr_set_interface();
>
>
> But "wmi_priv.bios_attr_wdev" is not set!
>
> So loading the module is returning with exit code 0 (what is wrong!).
> Variable "ret" should be set to 1 in this case
>
>
> Also unloading the module will crash (I guess because the sys entries do
> not exists).
>
> I can send you an crashdump later on.
>
>
> Any ideas why it is not working at all?
>
>
>
>
