From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: intel-hid: Add support for Device Specific Methods
Date: Thu, 28 Jun 2018 01:15:51 +0300
Message-ID: <CAHp75Vcn22DG0=TPdq+RYTErtaGFMf4POpuZyP9X78+9FrhLyA@mail.gmail.com>
References: <20180626233454.47340-1-srinivas.pandruvada@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180626233454.47340-1-srinivas.pandruvada@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: Alex Hung <alex.hung@canonical.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Mario Limonciello <Mario.Limonciello@dell.com>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Jun 27, 2018 at 2:34 AM, Srinivas Pandruvada
<srinivas.pandruvada@linux.intel.com> wrote:
> In some of the recent platforms, it is possible that stand alone methods
> for HEBC() or other methods used in this driver may not exist. In this
> case intel-hid driver will fail to load and power button will not be
> functional.
>
> It is also possible that some quirks in this driver added for some platfo=
rms
> may have same issue in loading intel-hid driver.
>
> There is an update to the ACPI details for the HID event filter driver.
> In the updated specification a _DSM is added, which has separate function
> indexes for each of the previous stand alone methods.
>
> This change brings in support for the _DSM and allows usage of function
> index for corresponding stand alone methods.
>
> Details of Device Specific Method:
>
> Intel HID Event Filter Driver _DSM UUID:
> eeec56b3-4442-408f-a792-4edd4d758054
>
> =E2=80=A2 Function index 0: Returns a buffer with a bit-field representin=
g the
> supported function IDs.
>
> Function Index  ASL Object
> --------------------------------
> 1               BTNL
> 2               HDMM
> 3               HDSM
> 4               HDEM
> 5               BTNS
> 6               BTNE
> 7               HEBC
> 8               VGBS
> 9               HEBC
>
> One significant change is to query the supported methods implemented on
> the platform. So the previous HEBC() has two variants. HEBC v1 and
> HEBC v2. The v2 version allowed further define which of the 5-button
> are actually defined by the platform. HEBC v2 support is only available
> via new DSM.
>
> v1 Button details:
> Bits [0] - Rotation Lock, Num Lock, Home, End, Page Up,
> Page Down
> Bits [1] - Wireless Radio Control
> Bits [2] - System Power Down
> Bits [3] - System Hibernate
> Bits [4] - System Sleep/ System Wake
> Bits [5] - Scan Next Track
> Bits [6] - Scan Previous Track
> Bits [7] - Stop
> Bits [8] - Play/Pause
> Bits [9] - Mute
> Bits [10] - Volume Increment
> Bits [11] - Volume Decrement
> Bits [12] - Display Brightness Increment
> Bits [13] - Display Brightness Decrement
> Bits [14] - Lock Tablet
> Bits [15] - Release Tablet
> Bits [16] - Toggle Bezel
> Bits [17] - 5 button array
> Bits [18-31] - reserved
>
> v2 Buttom details:
> Bits [0] - Rotation Lock, Num Lock, Home, End, Page Up, Page Down
> Bits [1] - Wireless Radio Control
> Bits [2] - System Power Down
> Bits [3] - System Hibernate
> Bits [4] - System Sleep/ System Wake
> Bits [5] - Scan Next Track
> Bits [6] - Scan Previous Track
> Bits [7] - Stop
> Bits [8] - Play/Pause
> Bits [9] - Mute
> Bits [10] - Volume Increment
> Bits [11] - Volume Decrement
> Bits [12] - Display Brightness Increment
> Bits [13] - Display Brightness Decrement
> Bits [14] - Lock Tablet
> Bits [15] - Release Tablet
> Bits [16] - Toggle Bezel
> Bits [17] - 5 button array
> Bits [18] =E2=80=93 Power Button
> Bits [19] - W Home Button
> Bits [20] - Volume Up Button
> Bits [21] - Volume Down Button
> Bits [22] =E2=80=93 Rotation Lock Button
> Bits [23-31] =E2=80=93 reserved

It's hard to get if they have a common part.
If so, perhaps in the latter drop the common part and replace it with

... same as v1 ...

or alike.


> +enum intel_hid_dsm_fn_codes {
> +       INTEL_HID_DSM_FN_INVALID,
> +       BTNL_FN_CODE,
> +       HDMM_FN_CODE,
> +       HDSM_FN_CODE,
> +       HDEM_FN_CODE,
> +       BTNS_FN_CODE,
> +       BTNE_FN_CODE,
> +       HEBC_V1_FN_CODE,
> +       VGBS_FN_CODE,
> +       HEBC_V2_FN_CODE,

> +       HEBC_MAX_FN_CODES

For sake of consistency I would rather name it
INTEL_HID_DSM_FN_MAX

> +};

> +static bool intel_hid_execute_method(acpi_handle handle,
> +                                    enum intel_hid_dsm_fn_codes fn_index=
,
> +                                    unsigned long long arg)
>  {
> +       union acpi_object *obj, argv4, req;
>         acpi_status status;
> +       guid_t dsm_guid;
> +       char *method_name;
>

> +       if (fn_index <=3D INTEL_HID_DSM_FN_INVALID ||
> +           fn_index >=3D HEBC_MAX_FN_CODES)
> +               return false;
> +

> +       method_name =3D (char *)intel_hid_dsm_fn_to_method[fn_index];

Can it be const char * in the first place?

> +
> +       if (!(intel_hid_dsm_fn_mask & fn_index))
> +               goto skip_dsm_exec;
> +

> +       guid_parse(HID_EVENT_FILTER_UUID, &dsm_guid);

Perhaps we can cache this in global variable and parse only once at
init / probe time?

> +
> +       /* All methods expects a package with one integer element */
> +       req.type =3D ACPI_TYPE_INTEGER;
> +       req.integer.value =3D arg;
> +
> +       argv4.type =3D ACPI_TYPE_PACKAGE;
> +       argv4.package.count =3D 1;
> +       argv4.package.elements =3D &req;
> +
> +       obj =3D acpi_evaluate_dsm(handle, &dsm_guid, 1, fn_index, &argv4)=
;
> +       if (obj) {

> +               pr_debug("Exec DSM Fn code: %d[%s] success\n", fn_index,
> +                        method_name);

acpi_handle_debug() ?

> +               ACPI_FREE(obj);
> +               return true;
> +       }
> +
> +skip_dsm_exec:
> +       status =3D acpi_execute_simple_method(handle, method_name, arg);
> +       if (ACPI_SUCCESS(status))
> +               return true;
> +
> +       return false;
> +}
> +
> +static bool intel_hid_evaluate_method(acpi_handle handle,
> +                                     enum intel_hid_dsm_fn_codes fn_inde=
x,
> +                                     unsigned long long *result)
> +{

Same comments as per previous function.

> +}

> +static void intel_hid_init_dsm(acpi_handle handle)
> +{

Ditto.

> +}

> +
> +static int intel_hid_set_enable(struct device *device, bool enable)
> +{
> +
> +       /* Enable|disable features - power button is always enabled */

> +       if (!intel_hid_execute_method(ACPI_HANDLE(device), HDSM_FN_CODE,
> +                                     enable)) {

For me the temporary variable looks slightly better.

acpi_handle handle =3D ACPI_HANDLE(device);
...


>                 dev_warn(device, "failed to %sable hotkeys\n",
>                          enable ? "en" : "dis");
>                 return -EIO;
> @@ -129,9 +259,8 @@ static void intel_button_array_enable(struct device *=
device, bool enable)
>         }
>
>         /* Enable|disable features - power button is always enabled */
> -       status =3D acpi_execute_simple_method(handle, "BTNE",
> -                                           enable ? button_cap : 1);
> -       if (ACPI_FAILURE(status))
> +       if (!intel_hid_execute_method(handle, BTNE_FN_CODE,
> +                                     enable ? button_cap : 1))
>                 dev_warn(device, "failed to set button capability\n");
>  }


>         if (priv->array) {
> +               unsigned long long results;
> +

Seems it's not used, perhaps call it dummy instead?

>                 intel_button_array_enable(&device->dev, true);
>
>                 /* Call button load method to enable HID power button */
> -               status =3D acpi_evaluate_object(handle, "BTNL", NULL, NUL=
L);
> -               if (ACPI_FAILURE(status))
> +               if (!intel_hid_evaluate_method(handle, BTNL_FN_CODE,
> +                                              &results)) {
>                         dev_warn(&device->dev,
>                                  "failed to enable HID power button\n");
> +               }
>         }

--=20
With Best Regards,
Andy Shevchenko
