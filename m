From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: re: drivers/platform/x86/sony-laptop.c: fix scancodes
Date: Wed, 30 Nov 2011 15:55:45 +0300
Message-ID: <20111130125545.GA5815@elgon.mountain>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from acsinet15.oracle.com ([141.146.126.227]:38194 "EHLO
	acsinet15.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751142Ab1K3M4U (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 30 Nov 2011 07:56:20 -0500
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: John Hughes <john@calvaedi.com>
Cc: platform-driver-x86@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

Hi John,

Commit 04840b50f395 "drivers/platform/x86/sony-laptop.c: fix scancodes"
introduces a gcc warning:

drivers/platform/x86/sony-laptop.c:395:14: warning:
	=E2=80=98scancode=E2=80=99 may be used uninitialized in this function =
[-Wuninitialized]

   345  static void sony_laptop_report_input_event(u8 event)
   346  {
   347          struct input_dev *jog_dev =3D sony_laptop_input.jog_dev=
;
   348          struct input_dev *key_dev =3D sony_laptop_input.key_dev=
;
   349          struct sony_laptop_keypress kp =3D { NULL };
   350          int scancode;
   351 =20

-- [snip] --

   373          /* key_dev events */
   374          case SONYPI_EVENT_JOGDIAL_PRESSED:
   375                  kp.key =3D BTN_MIDDLE;
   376                  kp.dev =3D jog_dev;
   377                  break;

scancode doesn't get initialized on this path, but kp.dev is set.

   378 =20
   379          default:
   380                  if (event >=3D ARRAY_SIZE(sony_laptop_input_ind=
ex)) {
   381                          dprintk("sony_laptop_report_input_event=
, event not known: %d\n", event);
   382                          break;
   383                  }
   384                  scancode =3D sony_laptop_input_index[event];
   385                  if (scancode !=3D -1) {
   386                          kp.key =3D sony_laptop_input_keycode_ma=
p[scancode];
   387                          if (kp.key !=3D KEY_UNKNOWN)
   388                                  kp.dev =3D key_dev;
   389                  }
   390                  break;
   391          }
   392 =20
   393          if (kp.dev) {
   394                  /* we emit the scancode so we can always remap =
the key */
   395                  input_event(kp.dev, EV_MSC, MSC_SCAN, scancode)=
;

We use scancode here.

regards,
dan carpenter
