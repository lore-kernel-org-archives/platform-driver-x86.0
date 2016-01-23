From: Eric Curtin <ericcurtin17-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] Remove logging for "Unsupported
	brightness interface"
Date: Sat, 23 Jan 2016 00:28:23 +0000
Message-ID: <CANpvso5EHVvFeOmi312cf4wDrZavZZFegMvNyj7ZzoBNMcpr8g@mail.gmail.com>
References: <CANpvso6S3jH0qYoPRmoNAc7sCsRd4UkosfzXFBAuLLUuZaPKCw@mail.gmail.com>
	<CANpvso4NpQgTj2x-65PxXw3VEY2rMiMpP+qT2Xjbx9q_n1g0zg@mail.gmail.com>
	<1453384483.1258747.498568498.27762FC4@webmail.messagingengine.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1279042732219941179=="
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <1453384483.1258747.498568498.27762FC4-2RFepEojUI2N1INw9kWLP6GC3tUn3ZHUQQ4Iyu8u01E@public.gmane.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
	<mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
	<mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Henrique de Moraes Holschuh <hmh-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>
Cc: ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, ibm-acpi-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org, Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Kernel development list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: platform-driver-x86.vger.kernel.org

--===============1279042732219941179==
Content-Type: multipart/alternative; boundary=001a1148ea88e3eb9d0529f56957

--001a1148ea88e3eb9d0529f56957
Content-Type: text/plain; charset=UTF-8

Message gets logged on machines that are well supported.

Signed-off-by: Eric Curtin <ericcurtin17-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/platform/x86/thinkpad_acpi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c
b/drivers/platform/x86/thinkpad_acpi.c
index a268a7a..4eb41aa 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -6661,7 +6661,6 @@ static void __init
tpacpi_detect_brightness_capabilities(void)
                pr_info("detected a 8-level brightness capable ThinkPad\n");
                break;
        default:
-               pr_info("Unsupported brightness interface\n");
                tp_features.bright_unkfw = 1;
                bright_maxlvl = b - 1;
        }
-- 
2.5.0

--001a1148ea88e3eb9d0529f56957
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div><span style=3D"color:rgb(8=
0,0,80);font-size:12.8px">Message gets logged on machines that are well sup=
ported.</span><br></div><div><br></div><div>Signed-off-by: Eric Curtin &lt;=
<a href=3D"mailto:ericcurtin17-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org">ericcurtin17-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt;</d=
iv><div>---</div><div>=C2=A0drivers/platform/x86/thinkpad_acpi.c | 1 -</div=
><div>=C2=A01 file changed, 1 deletion(-)</div><div><br></div><div>diff --g=
it a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_a=
cpi.c</div><div>index a268a7a..4eb41aa 100644</div><div>--- a/drivers/platf=
orm/x86/thinkpad_acpi.c</div><div>+++ b/drivers/platform/x86/thinkpad_acpi.=
c</div><div>@@ -6661,7 +6661,6 @@ static void __init tpacpi_detect_brightne=
ss_capabilities(void)</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 pr_info(&quot;detected a 8-level brightness capable ThinkPad\=
n&quot;);</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 break;</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 default:</div><div>- =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_info(&quot;Unsupported brightn=
ess interface\n&quot;);</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 tp_features.bright_unkfw =3D 1;</div><div>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bright_maxlvl =3D b - 1;</div><div>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }</div><div>--=C2=A0</div><div>2.5.0</div><div>=
<br></div></div></div>

--001a1148ea88e3eb9d0529f56957--


--===============1279042732219941179==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

------------------------------------------------------------------------------
Site24x7 APM Insight: Get Deep Visibility into Application Performance
APM + Mobile APM + RUM: Monitor 3 App instances at just $35/Month
Monitor end-to-end web transactions and take corrective actions now
Troubleshoot faster and improve end-user experience. Signup Now!
http://pubads.g.doubleclick.net/gampad/clk?id=272487151&iu=/4140
--===============1279042732219941179==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ibm-acpi-devel mailing list
ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel

--===============1279042732219941179==--
