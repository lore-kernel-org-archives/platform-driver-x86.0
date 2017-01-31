From: Adam Goode <agoode-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/1] thinkpad_acpi: Add support for
 status (external cover) LED
Date: Tue, 31 Jan 2017 14:49:11 -0500
Message-ID: <CAOf41Nka4UNk_XUegEXAOHE-Xf0eOs71fuZgBKr0PHEL9sGyag@mail.gmail.com>
References: <20170119172132.36029-1-agoode@google.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8117441427051605578=="
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <20170119172132.36029-1-agoode-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
	<mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
	<mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Henrique de Moraes Holschuh <ibm-acpi-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>, Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: Adam Goode <agoode-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: platform-driver-x86.vger.kernel.org

--===============8117441427051605578==
Content-Type: multipart/alternative; boundary=001a113abbb04b7f720547693ce6

--001a113abbb04b7f720547693ce6
Content-Type: text/plain; charset=UTF-8

On Thu, Jan 19, 2017 at 12:21 PM, Adam Goode <agoode-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org> wrote:

> This allows the control of the red status LED, which is the dot of the "i"
> in the word "ThinkPad" on the outside cover of newer models.
>
> In the manual, both this LED and the power LED are referred to as
> the "system-status indicators" without distinction between the two, so
> I chose "status" as the LED name.
>
> Signed-off-by: Adam Goode <agoode-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
>
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/
> thinkpad_acpi.c
> index cacb43fb1df7..6577bf8e5635 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -5611,11 +5611,11 @@ static const char * const
> tpacpi_led_names[TPACPI_LED_NUMLEDS] = {
>         "tpacpi::standby",
>         "tpacpi::dock_status1",
>         "tpacpi::dock_status2",
> -       "tpacpi::unknown_led2",
> +       "tpacpi::status",
>         "tpacpi::unknown_led3",
>         "tpacpi::thinkvantage",
>  };
> -#define TPACPI_SAFE_LEDS       0x1081U
> +#define TPACPI_SAFE_LEDS       0x1481U
>
>  static inline bool tpacpi_is_led_restricted(const unsigned int led)
>  {
> --
> 2.11.0.390.gc69c2f50cf-goog
>
>

ping ?

--001a113abbb04b7f720547693ce6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On T=
hu, Jan 19, 2017 at 12:21 PM, Adam Goode <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:agoode-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org" target=3D"_blank">agoode-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">This allows the control of the re=
d status LED, which is the dot of the &quot;i&quot;<br>
in the word &quot;ThinkPad&quot; on the outside cover of newer models.<br>
<br>
In the manual, both this LED and the power LED are referred to as<br>
the &quot;system-status indicators&quot; without distinction between the tw=
o, so<br>
I chose &quot;status&quot; as the LED name.<br>
<br>
Signed-off-by: Adam Goode &lt;<a href=3D"mailto:agoode-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org">agoode@g=
oogle.com</a>&gt;<br>
<br>
diff --git a/drivers/platform/x86/<wbr>thinkpad_acpi.c b/drivers/platform/x=
86/<wbr>thinkpad_acpi.c<br>
index cacb43fb1df7..6577bf8e5635 100644<br>
--- a/drivers/platform/x86/<wbr>thinkpad_acpi.c<br>
+++ b/drivers/platform/x86/<wbr>thinkpad_acpi.c<br>
@@ -5611,11 +5611,11 @@ static const char * const tpacpi_led_names[TPACPI_L=
ED_<wbr>NUMLEDS] =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;tpacpi::standby&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;tpacpi::dock_status1&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;tpacpi::dock_status2&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;tpacpi::unknown_led2&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;tpacpi::status&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;tpacpi::unknown_led3&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;tpacpi::thinkvantage&quot;,<br>
=C2=A0};<br>
-#define TPACPI_SAFE_LEDS=C2=A0 =C2=A0 =C2=A0 =C2=A00x1081U<br>
+#define TPACPI_SAFE_LEDS=C2=A0 =C2=A0 =C2=A0 =C2=A00x1481U<br>
<br>
=C2=A0static inline bool tpacpi_is_led_restricted(const unsigned int led)<b=
r>
=C2=A0{<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.11.0.390.gc69c2f50cf-goog<br>
<br>
</font></span></blockquote></div><br></div><div class=3D"gmail_extra"><br><=
/div><div class=3D"gmail_extra">ping ?</div></div>

--001a113abbb04b7f720547693ce6--


--===============8117441427051605578==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

------------------------------------------------------------------------------
Check out the vibrant tech community on one of the world's most
engaging tech sites, SlashDot.org! http://sdm.link/slashdot
--===============8117441427051605578==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ibm-acpi-devel mailing list
ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel

--===============8117441427051605578==--
